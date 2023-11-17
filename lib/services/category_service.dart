import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meals_app/models/category.dart';

class CategoryService{

  String baseUrl='https://www.themealdb.com/api/json/v1/1/categories.php';

  Future<List> getAll() async {
    final http.Response response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode==HttpStatus.ok){
      final jsonResponse = json.decode(response.body);
      final List maps = jsonResponse['categories']; //nombre de toda la lista
      return maps.map((e) => Category.fromJson(e)).toList();
    }
    return [];

  }

}