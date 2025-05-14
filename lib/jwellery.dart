import 'package:flutter/material.dart';

class Jwellery extends StatefulWidget {
  const Jwellery({super.key});

  @override
  State<Jwellery> createState() => _JwelleryState();
}

class _JwelleryState extends State<Jwellery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 140, 172),
        title: Text('Jwellery Collection'),
      ),
    );
  }
}