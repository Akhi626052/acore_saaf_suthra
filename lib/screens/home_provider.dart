import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool isAvailable = true;

  void toggleAvailable(bool value) {
    isAvailable = value;
    notifyListeners();
  }
}
