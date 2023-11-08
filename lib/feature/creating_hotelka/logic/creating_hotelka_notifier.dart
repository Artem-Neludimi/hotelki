import 'package:flutter/material.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/hotelka/hotelka_model.dart';

import '../../../core/services/pick_image/pick_image_service.dart';

class CreatingHotelkaNotifier extends ChangeNotifier {
  final ImagePickerService _imagePickerService;

  CreatingHotelkaNotifier(this._imagePickerService);

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

  HotelkaModel createHotelka(String email) {
    if (nameController.text.isEmpty || categoryController.text.isEmpty) {
      throw 'fill required fields';
    }
    return HotelkaModel(
      email: email,
      name: nameController.text,
      description: descriptionController.text,
      references: referencesController.text,
      category: categoryController.text,
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
