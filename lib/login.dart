import 'package:firstapp/admindashboard.dart';
import 'package:firstapp/userdashboard.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
  double sWidth = MediaQuery.of(context).size.width;
  double sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
       width: sWidth,
       height: sHeight,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20), // This is for gaping
            Image.asset("assets/adminlogin.png",
            width: 160, height: 110, fit: BoxFit.fill),
              //Image(image: AssetImage('assets/login3.png')),
              SizedBox(height: 40),

            Text(
              "LogIn Window",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 100), // This is for gaping
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: userIdController,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Please Enter User Id ..",
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),

            SizedBox(height: 10), // This is for gaping
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: passwordController,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Please Enter Password ..",
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),

            SizedBox(height: 30), // This is for gaping

            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text("Login"),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  fixedSize: Size(150, 40),
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ), onPressed: () { 
                  var userid=userIdController.text;
                  var userPas=passwordController.text;
                  if(userid=="admin@gmail.com" && userPas=="admin@1234")
                  {
                     Navigator.push(context,
                     MaterialPageRoute(builder: (context) => AdminDash()));
                  }
                 },
              ))
      ])));
  }
}