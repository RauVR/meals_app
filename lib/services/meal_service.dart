import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meals_app/models/meal.dart';

class MealService{

  final String baseUrl='https://www.themealdb.com/api/json/v1/1/filter.php?c=';

  Future<List> getAll(String categoryName) async {
    final http.Response response = await http.get(Uri.parse('$baseUrl$categoryName'));

    //log(response.body);

    if(response.statusCode==HttpStatus.ok){
      final jsonResponse = json.decode(response.body);
      final List maps = jsonResponse['meals'];
      return maps.map((element) => Meal.fromJson(element)).toList();
    }
    return [];
  }

}