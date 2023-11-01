import 'package:flutter/material.dart';

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
      _pickedCategory.value = _categories.first;
      categoryController.text = pickedCategory;
      _pickedCategory.addListener(pickedCategoryListener);
      notifyListeners();
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext get context => scaffoldKey.currentContext!;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
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

  void pickedCategoryListener() {
    categoryController.clear();
    categoryController.text = pickedCategory;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
    super.dispose();
  }
}
