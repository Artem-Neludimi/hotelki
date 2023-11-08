import 'package:flutter/material.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/hotelka/hotelka_model.dart';

import '../../../core/localization/generated/l10n.dart';

class CreatingHotelkaNotifier extends ChangeNotifier {
  CreatingHotelkaNotifier() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _categories.addAll([
        S.of(context).movies,
        S.of(context).flowers,
        S.of(context).dates,
        S.of(context).presents,
      ]);
      notifyListeners();
      _pickedCategory.addListener(pickedCategoryListener);
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
  bool get isNewCategory => !_categories.contains(categoryController.text) && categoryController.text.isNotEmpty;
  void addNewCategory() {
    _categories.add(categoryController.text);
    categoryController.clear();
    notifyListeners();
  }

  final ValueNotifier<String> _pickedCategory = ValueNotifier('');
  String get pickedCategory => _pickedCategory.value;
  set pickedCategory(String value) {
    _pickedCategory.value = '';
    _pickedCategory.value = value;
    notifyListeners();
  }

  bool _isImportant = false;
  bool get isImportant => _isImportant;
  set isImportant(bool value) {
    _isImportant = value;
    notifyListeners();
  }

  void pickedCategoryListener() {
    categoryController.clear();
    categoryController.text = pickedCategory;
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

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    referencesController.dispose();
    categoryController.dispose();
    super.dispose();
  }
}
