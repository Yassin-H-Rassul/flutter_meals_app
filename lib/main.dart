import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/bottom_nav_helper.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  void saveFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) return false;
        if (_filters['lactose']! && !meal.isLactoseFree) return false;
        if (_filters['vegan']! && !meal.isVegan) return false;
        if (_filters['vegetarian']! && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  List<Meal> _favouriteMeals = [];

  void _toggleFavourite(String mealId) {
    int existingIndex = _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      print('///////////////////////////////////deleting');
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavourite(String mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 1, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 1, 1),
              ),
              headline5: TextStyle(
                color: Color.fromRGBO(20, 51, 1, 1),
                fontSize: 22,
                fontWeight: FontWeight.bold,
                // fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // home: CategoryScreen(),
      routes: {
        '/': (context) => BottomNavHelper(_favouriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
            toggleFavourite: _toggleFavourite, isFavourite: isFavourite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, saveFilters),
      },
    );
  }
}
