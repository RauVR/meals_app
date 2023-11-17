import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_item.dart';
import 'package:meals_app/services/meal_service.dart';

class MealList extends StatefulWidget {
  final String categoryName;
  const MealList({super.key, required this.categoryName});

  @override
  State<MealList> createState() => _MealListState();
}

class _MealListState extends State<MealList> {

  MealService? _mealService;
  List? _meals;

  initialize() async {
    _meals = await _mealService?.getAll(widget.categoryName)??[];
    setState(() {
      _meals = _meals;
    });
  }

  @override
  void initState() {
    _mealService=MealService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: _meals?.length??0,
            itemBuilder: (context, index) => Card(
              child: GestureDetector(
                onTap: () {
                  final id = _meals?[index].id ??'0';
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) {
                        return MealItem(mealId: id,);
                  },)
                  );
                },
                child: ListTile(
                    leading: Image.network(_meals?[index].imageUrl),
                    title: Text(_meals?[index].name??''),
                    trailing: const Icon(Icons.favorite),
                ),
              ),
            )

                //MealItem(meal: _meals?[index]),
        ),
      ),
    );
  }
}
























