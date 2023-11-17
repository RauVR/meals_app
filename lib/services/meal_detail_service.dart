import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meals_app/models/Meal_detail.dart';

class MealDetailService{
  final String baseUrl='https://www.themealdb.com/api/json/v1/1/lookup.php?i=';

  Future<List> getDetails(String mealId) async {
    final http.Response response = await http.get(Uri.parse('$baseUrl$mealId'));

    log(response.body);

    if(response.statusCode==HttpStatus.ok){
      final jsonResponse = json.decode(response.body);
      final List maps = jsonResponse['meals'];
      return maps.map((element) => MealDetail.fromJson(element)).toList();
    }
    return [];
  }
}