import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meal_list.dart';

class CategoryDetail extends StatefulWidget {
  final Category category;
  const CategoryDetail({super.key, required this.category});

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {

    final image = Image.network(widget.category.imageUrl,fit: BoxFit.fitHeight);

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 200,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(widget.category.name, style: const TextStyle(color: Colors.white,fontSize: 16)),
                  background: Hero(
                      tag: widget.category.id,
                      child: image
                  ),
                ),
              )
            ];
          },
          body: Center(
            child: MealList(categoryName: widget.category.name),
          ),
        ),
      ),
    );
  }
}
