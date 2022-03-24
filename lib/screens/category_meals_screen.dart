import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryID;
  // final String categoryTitle;
  // CategoryMealsScreen({
  //   Key? key,
  //   required this.categoryID,
  //   required this.categoryTitle,
  // }) : super(key: key);

  static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> currentCategoryMeals = [];
  bool isInitDataLoaded = false;
  String? categoryTitle;

  void removeMeal(String mealId) {
    currentCategoryMeals.removeWhere((meal) => meal.id == mealId);
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    if (!isInitDataLoaded) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      currentCategoryMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      isInitDataLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
            removeItemHandler: removeMeal,
          );
        },
        itemCount: currentCategoryMeals.length,
      ),
    );
  }
}
