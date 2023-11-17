import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Meal Categories"))),
      body: const SafeArea(child: CategoryList()),
    );
  }
}
