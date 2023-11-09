import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/hotelka/hotelka_model.dart';

import '../../../core/services/firebase/storage/firebase_storage_service.dart';
import '../../../core/services/pick_image/pick_image_service.dart';

class CreatingHotelkaNotifier extends ChangeNotifier {
  final FirebaseStorageService _firebaseStorage;
  final ImagePickerService _imagePickerService;

  CreatingHotelkaNotifier(this._firebaseStorage, this._imagePickerService);

  void init(List<String> categories) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _categories.addAll(categories);
      notifyListeners();
      _pickedCategory.addListener(_pickedCategoryListener);
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext get context => scaffoldKey.currentContext!;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController referencesController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  final _categories = <String>[];
  List<String> get categories => _categories;

  final ValueNotifier<String> _pickedCategory = ValueNotifier('');
  String get pickedCategory => _pickedCategory.value;
  set pickedCategory(String value) {
    _pickedCategory.value = '';
    _pickedCategory.value = value;
    notifyListeners();
  }

  final _referencesImagesPaths = <String>[];
  bool imagePickerLoading = false;
  List<String> get referencesImagePaths => _referencesImagesPaths;
  void addReferenceImagePath() async {
    imagePickerLoading = true;
    notifyListeners();

    final imagePath = await _imagePickerService.pickImage().onError((_, __) {
      imagePickerLoading = false;
      notifyListeners();
      return null;
    });
    if (imagePath != null) {
      _referencesImagesPaths.add(imagePath);
    }
    imagePickerLoading = false;
    notifyListeners();
  }

  bool _isImportant = false;
  bool get isImportant => _isImportant;
  set isImportant(bool value) {
    _isImportant = value;
    notifyListeners();
  }

  Future<HotelkaModel> createHotelka(String email) async {
    if (nameController.text.isEmpty || categoryController.text.isEmpty) {
      throw 'fill required fields';
    }
    final futureImagesUrl = <Future<String>>[];
    final imageUrlList = <String>[];
    for (var imagePath in _referencesImagesPaths) {
      final futureUrl = _firebaseStorage.uploadReferencesImage(file: File(imagePath), email: email);
      futureImagesUrl.add(futureUrl);
    }
    imageUrlList.addAll(await Future.wait(futureImagesUrl));
    return HotelkaModel(
      email: email,
      name: nameController.text.trim(),
      description: descriptionController.text.trim(),
      category: categoryController.text.trim(),
      references: ReferencesModel(
        link: referencesController.text.trim(),
        imageUrls: imageUrlList,
      ),
      isDone: false,
      isImportant: isImportant,
      periodicity: '',
      date: DateTime.now().toUtc().toIso8601String(),
    );
  }

  void _pickedCategoryListener() {
    categoryController.clear();
    categoryController.text = pickedCategory;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    referencesController.dispose();
    categoryController.dispose();
    super.dispose();
  }
}
