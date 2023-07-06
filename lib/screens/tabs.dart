import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Meal> _favouriteMeals = [];

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      showInfoMessage("favorite deleted");
    } else {
      setState(() {
        _favouriteMeals.add(meal);
        showInfoMessage("add to the favourite");
      });
    }
  }

  void _pageSelected(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget appScreen = CategoriesScreen(
      onToggleFavourites: _toggleMealFavouriteStatus,
    );
    var activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      appScreen = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleMealFavouriteStatus,
      );
      activePageTitle = "Your favourite Meals";
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: appScreen,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _pageSelected,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites")
          ]),
    );
  }
}
