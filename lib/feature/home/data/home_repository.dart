import 'dart:io';

import 'package:scalable_flutter_app_starter/core/services/api/model/category/category_model.dart';
import 'package:scalable_flutter_app_starter/core/services/firebase/firestore/firebase_firestore_service.dart';

import '../../../core/services/api/model/hotelka/hotelka_model.dart';
import '../../../core/services/firebase/storage/firebase_storage_service.dart';

abstract interface class HomeRepository {
  Stream<Map<String, HotelkaModel>> streamHotelkaModels(String email);
  Future<void> createHotelka(HotelkaModel hotelkaModel, List<String> referencesImagesPaths);
  Future<void> updateHotelka(HotelkaModel hotelkaModel, String id);
  Future<List<CategoryModel>> getCategories(String partnerEmail);
}

class HomeRepositoryImpl implements HomeRepository {
  final FirebaseFirestoreService _firestore;
  final FirebaseStorageService _firebaseStorage;

  const HomeRepositoryImpl(this._firestore, this._firebaseStorage);

  @override
  Stream<Map<String, HotelkaModel>> streamHotelkaModels(String email) {
    return _firestore.streamHotelkaModels(email);
  }

  @override
  Future<void> createHotelka(HotelkaModel hotelkaModel, List<String> referencesImagesPaths) async {
    final futureImagesUrl = <Future<String>>[];
    for (var imagePath in referencesImagesPaths) {
      final futureUrl = _firebaseStorage.uploadReferencesImage(file: File(imagePath), email: hotelkaModel.email);
      futureImagesUrl.add(futureUrl);
    }
    final imagesUrls = await Future.wait(futureImagesUrl);
    final hotelka = referencesImagesPaths.isEmpty
        ? hotelkaModel
        : hotelkaModel.copyWith(references: hotelkaModel.references!.copyWith(imageUrls: imagesUrls));

    await _firestore.createHotelka(hotelka);
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
