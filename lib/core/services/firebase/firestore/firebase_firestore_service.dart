import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/user/user_model.dart';

abstract interface class _FirebaseFirestoreService {
  Future<UserModel?> getUserByEmail(String email);
  Future<UserModel?> createUser(String email);
}

class FirebaseFirestoreService with ApiLoggy implements _FirebaseFirestoreService {
  FirebaseFirestoreService();

  final _firestore = FirebaseFirestore.instance;
  late final _users = _firestore.collection('users');

  @override
  Future<UserModel?> getUserByEmail(String email) async {
    try {
      final userQuery = _users.where('email', isEqualTo: email);
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
      final userQuery = _users.where('email', isEqualTo: email);
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
