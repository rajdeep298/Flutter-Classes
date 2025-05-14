import 'package:flutter/material.dart';

class SearcItem extends StatefulWidget {
  const SearcItem({super.key});

  @override
  State<SearcItem> createState() => _SearcItemState();
}

class _SearcItemState extends State<SearcItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Text("Search Item Screen",
      style: TextStyle(fontSize: 25,
      fontWeight: FontWeight.bold),),
    );
  }
}