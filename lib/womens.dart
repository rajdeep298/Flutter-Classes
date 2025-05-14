import 'package:flutter/material.dart';

class Womens extends StatefulWidget {
  const Womens({super.key});

  @override
  State<Womens> createState() => _WomensState();
}

class _WomensState extends State<Womens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 140, 172),
        title: Text('Womens Collection'),
      ),
    );
  }
}