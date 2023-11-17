import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Developed by :",style: TextStyle(fontSize: 20)),
              SizedBox(height: 20,),
              Text("Raul Ventura",style: TextStyle(fontSize: 35),),
              SizedBox(height: 20,),
              Text("; )",style: TextStyle(fontSize: 35),),
              SizedBox(height: 100,),
            ]),
      ),
    );
  }
}
