import 'package:flutter/material.dart';
import 'package:meals_app/screens/bottom_nav_helper.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
        '/': (context) => BottomNavHelper(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
    );
  }
}
