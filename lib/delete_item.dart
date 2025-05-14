import 'package:flutter/material.dart';

class DeleteItem extends StatefulWidget {
  const DeleteItem({super.key});

  @override
  State<DeleteItem> createState() => _DeleteItemState();
}

class _DeleteItemState extends State<DeleteItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Text("Delete Item Screen",
      style: TextStyle(fontSize: 25,
      fontWeight: FontWeight.bold),),
    );
  }
}