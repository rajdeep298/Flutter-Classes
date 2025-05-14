import 'package:flutter/material.dart';

class Mens extends StatefulWidget {
  const Mens({super.key});

  @override
  State<Mens> createState() => _MensState();
}

class _MensState extends State<Mens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 140, 172),
        title: Text('Mens Collection'),
      ),
    );
  }
}