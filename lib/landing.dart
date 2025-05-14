import 'package:firstapp/admindashboard.dart';
import 'package:firstapp/login.dart';
import 'package:firstapp/mainscreen.dart';
import 'package:firstapp/userdashboard.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Welcome'),

      ),
      body: Container(
       child: Center(
          child:Column(
          children: [
            Text(
              "Chose For Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 250),
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text("Admin"),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  fixedSize: Size(250, 60),
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ), onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Login()));
                  },
              )),
                 SizedBox(height: 30),
              Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text("User"),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  fixedSize: Size(250, 60),
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ), onPressed: () { 
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
                 },
              ))

          ],
        ),
      ),
     ) );
  }
}