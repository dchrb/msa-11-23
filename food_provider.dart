// lib/providers/food_provider.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/meal.dart';

class FoodProvider with ChangeNotifier {
  final List<Meal> _meals = [];

  List<Meal> get meals => _meals;

  void addMeal(String name, double calories, DateTime timestamp) {
    _meals.add(Meal(name: name, calories: calories, timestamp: timestamp));
    notifyListeners();
  }

  void deleteMeal(String id) {
    _meals.removeWhere((meal) => meal.id == id);
    notifyListeners();
  }

  void updateMeal(String id, String newName, double newCalories, DateTime newTimestamp) {
    final mealIndex = _meals.indexWhere((meal) => meal.id == id);
    if (mealIndex != -1) {
      _meals[mealIndex] = Meal(
        name: newName,
        calories: newCalories,
        timestamp: newTimestamp,
      );
      notifyListeners();
    }
  }

  double getDailyCalories(DateTime date) {
    return _meals
        .where((meal) =>
            meal.timestamp.year == date.year &&
            meal.timestamp.month == date.month &&
            meal.timestamp.day == date.day)
        .fold(0.0, (sum, meal) => sum + meal.calories);
  }

  Map<String, double> getWeeklySummary() {
    final Map<String, double> summary = {};
    for (int i = 0; i < 7; i++) {
      final date = DateTime.now().subtract(Duration(days: i));
      final dayName = DateFormat('EEE').format(date);
      summary[dayName] = getDailyCalories(date);
    }
    return summary;
  }
}