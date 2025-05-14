import 'package:flutter/material.dart';

class Perfume extends StatefulWidget {
  const Perfume({super.key});

  @override
  State<Perfume> createState() => _PerfumeState();
}

class _PerfumeState extends State<Perfume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 140, 172),
        title: Text('Perfume Collection'),
      ),
    );
  }
}