import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);
  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isLactoseFree = false;
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;

  Widget buildSwitchListTile({
    required String theTitle,
    required String description,
    required bool currentValue,
    required Function onChangeHandler,
  }) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (newValue) => onChangeHandler(newValue),
      title: Text(theTitle),
      subtitle: Text(
        description,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Adjust the filters for the meals:',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          buildSwitchListTile(
              theTitle: 'Gluten-free',
              description: 'only include Gluten-free meals',
              currentValue: isGlutenFree,
              onChangeHandler: (newValue) {
                setState(() {
                  isGlutenFree = newValue;
                });
              }),
          buildSwitchListTile(
              theTitle: 'Lactose-free',
              description: 'only include Lactose-free meals',
              currentValue: isLactoseFree,
              onChangeHandler: (newValue) {
                setState(() {
                  isLactoseFree = newValue;
                });
              }),
          buildSwitchListTile(
              theTitle: 'Vegan',
              description: 'only include Vegan meals',
              currentValue: isVegan,
              onChangeHandler: (newValue) {
                setState(() {
                  isVegan = newValue;
                });
              }),
          buildSwitchListTile(
              theTitle: 'Vegetarian',
              description: 'only include Vegetarian meals',
              currentValue: isVegetarian,
              onChangeHandler: (newValue) {
                setState(() {
                  isVegetarian = newValue;
                });
              }),
        ],
      ),
    );
  }
}
