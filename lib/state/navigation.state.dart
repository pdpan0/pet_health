import 'package:flutter/material.dart';

class NavigationState extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void navigate(int index) {
    _currentPage = index;
    notifyListeners();
  }
}
