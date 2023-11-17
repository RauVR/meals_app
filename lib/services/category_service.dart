import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
//import 'package:http/http.dart' as http;
import 'package:meals_app/models/category.dart';

class CategoryService{

  String baseUrl='https://www.themealdb.com/api/json/v1/1/categories.php';
  final _dio=Dio();

  Future<List> getAll() async {
    //final http.Response response = await http.get(Uri.parse(baseUrl));
    final response = await _dio.get('https://www.themealdb.com/api/json/v1/1/categories.php');

    if(response.statusCode==HttpStatus.ok){
      //final jsonResponse = json.decode(response.body);
      final jsonResponse = response.data;
      final List maps = jsonResponse['categories']; //nombre de toda la lista
      return maps.map((e) => Category.fromJson(e)).toList();
    }
    return [];

  }

}