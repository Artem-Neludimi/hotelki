import 'package:flutter/material.dart';

class StoriesNotifier extends ChangeNotifier {
  String _referenceUrl = '';
  String get referenceUrl => _referenceUrl;
  set referenceUrl(String value) {
    _referenceUrl = value;
    notifyListeners();
  }
}
