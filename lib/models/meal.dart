import 'dart:convert';

import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}
enum Affordability {
  Pricey,
  Luxurious,
  Affordable,
}

class Meal {
  final String id;
  final String title;
  final int duration;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final List<String> categories;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  const Meal({
    required this.id,
    required this.title,
    required this.duration,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.categories,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}
