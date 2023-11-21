import 'package:flutter/material.dart';

class NavigationState extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void navigate(int index) {
    print('Index atual $_currentPage');
    _currentPage = index;
    print('Index atualizado $_currentPage');
    notifyListeners();
  }
}