// lib/providers/water_provider.dart
import 'package:flutter/material.dart';

class WaterProvider with ChangeNotifier {
  int _glassesCount = 0;

  int get glassesCount => _glassesCount;

  void addGlass() {
    _glassesCount++;
    notifyListeners();
  }

  void removeGlass() {
    if (_glassesCount > 0) {
      _glassesCount--;
      notifyListeners();
    }
  }
}