import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryID;
  // final String categoryTitle;
  // CategoryMealsScreen({
  //   Key? key,
  //   required this.categoryID,
  //   required this.categoryTitle,
  // }) : super(key: key);

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final currentCategoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: currentCategoryMeals[index].id,
              imageUrl: currentCategoryMeals[index].imageUrl,
              title: currentCategoryMeals[index].title,
              duration: currentCategoryMeals[index].duration,
              affordability: currentCategoryMeals[index].affordability,
              complexity: currentCategoryMeals[index].complexity,
            );
          },
          itemCount: currentCategoryMeals.length,
        ));
  }
}
