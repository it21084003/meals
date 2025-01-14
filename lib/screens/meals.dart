import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals,});

  final String? title;
  final List<Meal> meals;
  //final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context,Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MealDetailsScreen(meal: meal, );
    }));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('No meals found, please check your filters!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface
                  ),),
            const SizedBox(height: 16),
            Text('Try changing your filters to find meals.',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    )),
          ],
        ),
      );

    if(meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(meal: meals[index], onSelectMeal: (meal){
            selectMeal(context, meal);
          },);
      });
    }
    if(title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}