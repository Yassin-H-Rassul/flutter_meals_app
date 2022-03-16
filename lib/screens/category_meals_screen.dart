import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryID;
  final String categoryTitle;
  CategoryMealsScreen({
    Key? key,
    required this.categoryID,
    required this.categoryTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('The Recipes Screen.'),
      ),
    );
  }
}
