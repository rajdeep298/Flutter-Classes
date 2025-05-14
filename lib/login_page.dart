// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp/forgot_pw_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:login_signup_firebase/pages/forgot_pw_page.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  //final VoidCallback showRegisterPage;
  const LoginPage(/*{super.key, required this.showRegisterPage}*/);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Text Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //Custom Function
  ShowMySnackBar(var sMsg) {
    final SnBar = SnackBar(
      content: Text(sMsg),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blueAccent,
      showCloseIcon: true,
      closeIconColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(SnBar);
  }

  //Sign in Function
  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        
      );
      // Sign-in successful, navigate or show success message
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        // Email password mismatch or user not found
        showDialog(
          context: context, // Replace with your context provider
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Sign In Error'),
              content: Text(e.message ?? 'Invalid email or password.'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        );
      } else {
        // Handle other exceptions (e.g., network errors)
        // Don't print the error code, use a generic message
        showDialog(
          context: context, // Replace with your context provider
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Sign In Error'),
              content: const Text(
                  'Invalid Email or Password. Please enter correct credentials.'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              //lottie animation
              Container(
                child: Lottie.network(
                    'https://lottie.host/ee48def8-50db-4185-82af-70a643e81881/uknpX3N8jr.json'),
              ),
              SizedBox(
                height: 20,
              ),
              //Some Text
              Text(
                'Fill the details below:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 20,
              ),

              //Email field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              //Password field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
              //Signin BTN
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () {
                    var valEmailId = _emailController.text;
                    var valPass = _passwordController.text;
                    if (valEmailId.isEmpty == true) {
                      ShowMySnackBar("Please Enter Email Id");
                    }
                    if (valPass.isEmpty == true) {
                      ShowMySnackBar("Please Enter Password");
                    } else {
                      signIn();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //signup

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member ?'),
                  GestureDetector(
                   // onTap: widget.showRegisterPage,
                    child: Text(
                      ' Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ForgotPasswordPage();
                    }),
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
