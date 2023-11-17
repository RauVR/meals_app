import 'dart:developer';

import 'package:meals_app/database/app_database.dart';
import 'package:meals_app/models/meal.dart';
import 'package:sqflite/sqflite.dart';

class MealRepository{

  insert(Meal meal) async {
    Database db = await AppDatabase().openDB();
    await db.insert(AppDatabase().tableName, meal.toMap());
    log(meal.toMap().toString());
  }

  delete(Meal meal) async {
    Database db = await AppDatabase().openDB();
    await db.delete(
        AppDatabase().tableName,
        where: 'id=?',
        whereArgs: [meal.id]
    );
  }

  Future<bool> isFavorite(Meal meal) async {
    Database db = await AppDatabase().openDB();
    List maps = await db.query(
        AppDatabase().tableName,
        where: 'id=?',
        whereArgs: [meal.id]
    );
    return maps.isNotEmpty;
  }

  Future<List<Meal>> getAll() async {
    Database db = await AppDatabase().openDB();
    final maps = await db.query(AppDatabase().tableName);
    return maps.map((e) => Meal.fromMap(e)).toList();
  }
}