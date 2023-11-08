import 'package:scalable_flutter_app_starter/core/services/api/model/category/category_model.dart';
import 'package:scalable_flutter_app_starter/core/services/firebase/firestore/firebase_firestore_service.dart';

import '../../../core/services/api/model/hotelka/hotelka_model.dart';

abstract interface class HomeRepository {
  Future<Map<String, HotelkaModel>> getHotelkaModels(String email);
  Future<void> createHotelka(HotelkaModel hotelkaModel);
  Future<void> updateHotelka(HotelkaModel hotelkaModel, String id);
  Future<List<CategoryModel>> getCategories(String partnerEmail);
}

class HomeRepositoryImpl implements HomeRepository {
  final FirebaseFirestoreService _firestore;

  const HomeRepositoryImpl(this._firestore);

  @override
  Future<Map<String, HotelkaModel>> getHotelkaModels(String email) {
    return _firestore.getHotelkaModels(email);
  }

  @override
  Future<void> createHotelka(HotelkaModel hotelkaModel) {
    return _firestore.createHotelka(hotelkaModel);
  }

  @override
  Future<void> updateHotelka(HotelkaModel hotelkaModel, String id) {
    return _firestore.updateHotelka(hotelkaModel, id);
  }

  @override
  Future<List<CategoryModel>> getCategories(String partnerEmail) {
    return _firestore.getCategories(partnerEmail);
  }
}
