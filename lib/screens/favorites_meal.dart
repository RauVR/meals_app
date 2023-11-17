import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/repositories/meal_repository.dart';
import 'package:meals_app/screens/home.dart';
import 'package:meals_app/screens/meal_item.dart';

class FavoritesMeal extends StatefulWidget {
  const FavoritesMeal({super.key});

  @override
  State<FavoritesMeal> createState() => _FavoritesMealState();
}

class _FavoritesMealState extends State<FavoritesMeal> {
  
  MealRepository? _mealRepository;
  List<Meal>? _favoriteMeals;

  initialize() async {
    _favoriteMeals = await _mealRepository?.getAll() ?? []; // se usa elvis por si retorna null
    log(_favoriteMeals.toString());
    setState(() {
      _favoriteMeals = _favoriteMeals;
    });
  }
  
  @override
  void initState() {
    _mealRepository=MealRepository();
    initialize();
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Favorite Meals'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home(),));
          },
        ),
      ),
      body: GridView.builder(
          itemCount: _favoriteMeals?.length??0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {

            return GestureDetector(

              onTap: () {
                final id = _favoriteMeals?[index].id ??'0';
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                  return MealItem(mealId: id,);
                },)
                );
              },

              child: Card(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: NetworkImage(_favoriteMeals?[index].imageUrl??''),height: 130),
                  const SizedBox(height: 10,),
                  Text(_favoriteMeals?[index].name??'empty'),
                ],
              )),
            );
          },
      ),
      
    );
  }
}
