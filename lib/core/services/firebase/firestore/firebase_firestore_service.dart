import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/user/user_model.dart';

part 'firestore_keys.dart';

abstract interface class FirebaseFirestoreService {
  Future<UserModel?> getUserByEmail(String email);
  Future<UserModel?> createUser(String email);
}

final class FirebaseFirestoreServiceImpl with ApiLoggy implements FirebaseFirestoreService {
  FirebaseFirestoreServiceImpl();

  final _firestore = FirebaseFirestore.instance;
  late final _users = _firestore.collection(FirestoreKeys.users);

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
        await _users.add(UserModel(email: email).toJson());
      }
      final querySnapshotAgain = await userQuery.get();
      final userData = querySnapshotAgain.docs.first.data();
      return UserModel.fromJson(userData);
    } catch (e, s) {
      loggy.error('getCurrentUser error', e, s);
      rethrow;
    }
  }
}
