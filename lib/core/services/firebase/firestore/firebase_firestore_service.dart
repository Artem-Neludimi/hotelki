import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/hotelka/hotelka_model.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/user/user_model.dart';
import 'package:scalable_flutter_app_starter/core/services/firebase/firestore/data/default_categories.dart';

import '../../api/model/category/category_model.dart';

part 'firestore_keys.dart';

abstract interface class FirebaseFirestoreService {
  Future<UserModel?> getUserByEmail(String email);
  Future<UserModel?> createUser(String email);
  Stream<UserModel> userStream(String email);
  Future<void> boundAccounts(String email, String partnerEmail);
  Stream<Map<String, HotelkaModel>> streamHotelkaModels(String email);
  Future<void> createHotelka(HotelkaModel hotelkaModel);
  Future<void> updateHotelka(HotelkaModel hotelkaModel, String id);
  Future<List<CategoryModel>> getCategories(String partnerEmail);
}

final class FirebaseFirestoreServiceImpl with ServiceLoggy implements FirebaseFirestoreService {
  FirebaseFirestoreServiceImpl();

  final _firestore = FirebaseFirestore.instance;
  late final _users = _firestore.collection(FirestoreKeys.users);
  late final _hotelki = _firestore.collection(FirestoreKeys.hotelki);
  late final _categories = _firestore.collection(FirestoreKeys.categories);

  @override
  Future<UserModel?> getUserByEmail(String email) async {
    try {
      final userQuery = _users.where(FirestoreKeys.email, isEqualTo: email);
      final querySnapshot = await userQuery.get();
      if (querySnapshot.docs.isNotEmpty) {
        final userData = querySnapshot.docs.first.data();
        return UserModel.fromJson(userData);
      }
      return null;
    } catch (e, s) {
      loggy.error('getCurrentUser error', e, s);
      rethrow;
    }
  }

  @override
  Future<UserModel?> createUser(String email) async {
    try {
      final userQuery = _users.where(FirestoreKeys.email, isEqualTo: email);
      final querySnapshot = await userQuery.get();
      if (querySnapshot.docs.isEmpty) {
        await _firestore.runTransaction((transaction) async {
          transaction.set(_users.doc(email), UserModel(email: email).toJson());
          for (var category in DefaultCategories.buildCategories(email)) {
            transaction.set(_categories.doc(), category.toJson());
            loggy.info('category: ${category.toJson()}');
          }
        });
      }
      final querySnapshotAgain = await userQuery.get();
      final userData = querySnapshotAgain.docs.first.data();
      return UserModel.fromJson(userData);
    } catch (e, s) {
      loggy.error('getCurrentUser error', e, s);
      rethrow;
    }
  }

  @override
  Stream<UserModel> userStream(String email) {
    try {
      final userQuery = _users.where(FirestoreKeys.email, isEqualTo: email);
      return userQuery.snapshots().map((event) {
        final userData = event.docs.first.data();
        return UserModel.fromJson(userData);
      });
    } catch (e, s) {
      loggy.error('userStream error', e, s);
      rethrow;
    }
  }

  @override
  Future<void> boundAccounts(String email, String partnerEmail) async {
    try {
      final firstUser = await _users.where(FirestoreKeys.email, isEqualTo: email).get();
      final secondUser = await _users.where(FirestoreKeys.email, isEqualTo: partnerEmail).get();
      await _firestore.runTransaction((transaction) async {
        transaction.update(firstUser.docs.first.reference, {FirestoreKeys.partnerEmail: partnerEmail});
        transaction.update(secondUser.docs.first.reference, {FirestoreKeys.partnerEmail: email});
      });
    } catch (e, s) {
      loggy.error('getCurrentUser error', e, s);
      rethrow;
    }
  }

  @override
  Stream<Map<String, HotelkaModel>> streamHotelkaModels(String email) {
    try {
      final hotelkaQuery = _hotelki.where(FirestoreKeys.email, isEqualTo: email);
      return hotelkaQuery.snapshots().map((event) {
        final hotelkaModels = event.docs.map((doc) => HotelkaModel.fromJson(doc.data())).toList();
        final hotelkaModelIds = event.docs.map((doc) => doc.id).toList();
        return Map.fromIterables(hotelkaModelIds, hotelkaModels);
      });
    } catch (e, s) {
      loggy.error('getHotelkaModels error', e, s);
      rethrow;
    }
  }

  @override
  Future<void> createHotelka(HotelkaModel hotelkaModel) async {
    try {
      final userCategoriesQuery = await _categories.where(FirestoreKeys.email, isEqualTo: hotelkaModel.email).get();
      final userCategories = userCategoriesQuery.docs.map((doc) => CategoryModel.fromJson(doc.data())).toList();
      final userCategoriesString = userCategories.map((e) => e.category).toList();
      if (!userCategoriesString.contains(hotelkaModel.category)) {
        await _firestore.runTransaction((transaction) async {
          transaction.set(_hotelki.doc(), hotelkaModel.toJson());
          transaction.set(
            _categories.doc(),
            CategoryModel(
              category: hotelkaModel.category,
              email: hotelkaModel.email,
            ).toJson(),
          );
        });
      } else {
        await _hotelki.add(hotelkaModel.toJson());
      }
    } catch (e, s) {
      loggy.error('createHotelka error', e, s);
      rethrow;
    }
  }

  @override
  Future<void> updateHotelka(HotelkaModel hotelkaModel, String id) async {
    try {
      await _hotelki.doc(id).update(hotelkaModel.toJson());
    } catch (e, s) {
      loggy.error('updateHotelka error', e, s);
      rethrow;
    }
  }

  @override
  Future<List<CategoryModel>> getCategories(String partnerEmail) async {
    try {
      final querySnapshot = await _categories.where(FirestoreKeys.email, isEqualTo: partnerEmail).get();
      final categories = querySnapshot.docs.map((doc) => CategoryModel.fromJson(doc.data())).toList();
      return categories;
    } catch (e, s) {
      loggy.error('getCategories error', e, s);
      rethrow;
    }
  }
}
