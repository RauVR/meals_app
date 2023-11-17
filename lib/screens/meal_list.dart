import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/repositories/meal_repository.dart';
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
                child: MealsBoxes(meal: _meals?[index],),
              ),
            )

                //MealItem(meal: _meals?[index]),
        ),
      ),
    );
  }
}


class MealsBoxes extends StatefulWidget {
  final Meal meal;
  const MealsBoxes({super.key, required this.meal});

  @override
  State<MealsBoxes> createState() => _MealsBoxesState();
}

class _MealsBoxesState extends State<MealsBoxes> {

  bool _favorite=false;
  MealRepository? _repository;

  initialize() async {
    _favorite = await _repository?.isFavorite(widget.meal)??false;
    if(mounted){
      setState(() {
        _favorite = _favorite;
      });
    }
  }

  @override
  void initState() {
    _repository=MealRepository();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final image = Image.network(widget.meal.imageUrl);
    final icon = _favorite?const Icon(Icons.favorite,color: Colors.red,)
        :const Icon(Icons.favorite,color: Colors.white54,);

    return ListTile(
      leading: image,
      title: Text(widget.meal.name??''),
      trailing: IconButton(
        icon: icon,
        onPressed: () {
          setState(() {
            _favorite=!_favorite;
          });
          _favorite
              ?_repository?.insert(widget.meal)
              :_repository?.delete(widget.meal);
        },
      ),
    );
  }
}






















