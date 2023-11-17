import 'package:flutter/material.dart';
import 'package:meals_app/screens/favorites_meal.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //BuildHeader(),
              BuildMenuItems(),

            ],
          ),
        ),
      ),
    );
  }
}

class BuildHeader extends StatefulWidget {
  const BuildHeader({super.key});

  @override
  State<BuildHeader> createState() => _BuildHeaderState();
}

class _BuildHeaderState extends State<BuildHeader> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class BuildMenuItems extends StatefulWidget {
  const BuildMenuItems({super.key});

  @override
  State<BuildMenuItems> createState() => _BuildMenuItemsState();
}

class _BuildMenuItemsState extends State<BuildMenuItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          leading: Icon(Icons.home_outlined),
          title:Text('Home'),
        ),
        ListTile(
          leading: const Icon(Icons.favorite,color: Colors.red),
          title:const Text('Favorites'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return const FavoritesMeal();
            },)
            );
          },
        ),
        const ListTile(
          leading: Icon(Icons.person),
          title:Text('Perfil'),
        ),
      ],
    );
  }
}
