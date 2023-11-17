import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/category_detail.dart';

class CategoryItem extends StatefulWidget {

  final Category category;
  const CategoryItem({super.key, required this.category});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {

    final image = Image.network(widget.category.imageUrl);
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return CategoryDetail(category: widget.category);
              },)
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Hero(
                  tag: widget.category.id,
                  child: image
              ),
            ),
            const SizedBox(height: 20,),
            Text(widget.category.name),
            //Text(widget.category.description),
          ],
        ),
      ),
    );
  }
}
