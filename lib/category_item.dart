import 'package:flutter/material.dart';

import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem({
    Key? key,
    required this.id,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: (() => selectCategory(context)),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }

  selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => CategoryMealsScreen(
              categoryID: id,
              categoryTitle: title,
            )),
      ),
    );
  }
}
