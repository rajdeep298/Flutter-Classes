import 'package:flutter/material.dart';

class UpdateItem extends StatefulWidget {
  const UpdateItem({super.key});

  @override
  State<UpdateItem> createState() => _UpdateItemState();
}

class _UpdateItemState extends State<UpdateItem> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Text("Update Item Screen",
      style: TextStyle(fontSize: 25,
      fontWeight: FontWeight.bold),),
    );
  }
}