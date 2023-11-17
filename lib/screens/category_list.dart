import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/category_detail.dart';
import 'package:meals_app/screens/category_item.dart';
import 'package:meals_app/screens/meal_list.dart';
import 'package:meals_app/services/category_service.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  CategoryService? _categoryService;
  List? _categories;

  initialize() async{
    _categories = await _categoryService?.getAll()??[];// si es null que me pinte vacio
    setState(() {
      _categories=_categories;
    });
  }

  @override
  void initState() {
    _categoryService=CategoryService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: _categories?.length??0,// si es null pone cero
        itemBuilder: (context, index) {
          return CategoryItem(category: _categories?[index]);
        },
    );
  }
}




















