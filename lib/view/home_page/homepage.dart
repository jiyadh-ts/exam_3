import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage"),),
      body: Container(
        child: Center(
          child: Text("Welcome to HomePage",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
        ),
      ),
    );

  }
}