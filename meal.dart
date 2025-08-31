// lib/models/meal.dart
import 'package:uuid/uuid.dart';

class Meal {
  final String id;
  final String name;
  final double calories;
  final DateTime timestamp;

  Meal({
    required this.name,
    required this.calories,
    required this.timestamp,
  }) : id = const Uuid().v4();
}