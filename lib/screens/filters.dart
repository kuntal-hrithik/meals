import 'package:flutter/material.dart';

enum filter { gluttenfree, lactosefree, vegan, vegetarian }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilter});

  final Map<filter, bool> currentFilter;
  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _gluttenFreeIsSet = false;
  var _lactoseFreeIsSet = false;
  var _vegetarianFreeIsSet = false;
  var _veganFreeIsSet = false;
  @override
  void initState() {
    _gluttenFreeIsSet = widget.currentFilter[filter.gluttenfree]!;
    _lactoseFreeIsSet = widget.currentFilter[filter.lactosefree]!;
    _veganFreeIsSet = widget.currentFilter[filter.vegan]!;
    _vegetarianFreeIsSet = widget.currentFilter[filter.vegetarian]!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("your filterd meals"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            filter.gluttenfree: _gluttenFreeIsSet,
            filter.lactosefree: _lactoseFreeIsSet,
            filter.vegan: _veganFreeIsSet,
            filter.vegetarian: _vegetarianFreeIsSet
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluttenFreeIsSet,
              onChanged: (isChecked) {
                setState(() {
                  _gluttenFreeIsSet = isChecked;
                });
              },
              title: Text(
                "Gluten free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only included gluten free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFreeIsSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeIsSet = isChecked;
                });
              },
              title: Text(
                "Vegan free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only included Vegan free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeIsSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeIsSet = isChecked;
                });
              },
              title: Text(
                "Lactose free free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only included Lactose free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegetarianFreeIsSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeIsSet = isChecked;
                });
              },
              title: Text(
                "Vagetarian free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only included Vagetarian free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      ),
    );
  }
}
