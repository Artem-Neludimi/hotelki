import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/core/services/firebase/firestore/firebase_firestore_service.dart';

abstract interface class PartnerSettingsRepository {
  Future<void> boundAccounts(String email, String partnerEmail);
}

class PartnerSettingsRepositoryImpl with RepositoryLoggy implements PartnerSettingsRepository {
  final FirebaseFirestoreService _firestore;

  PartnerSettingsRepositoryImpl(this._firestore);

  @override
  Future<void> boundAccounts(String email, String partnerEmail) async {
    try {
      await _firestore.boundAccounts(email, partnerEmail);
    } catch (e) {
      loggy.error(e);
      rethrow;
    }
  }
}
