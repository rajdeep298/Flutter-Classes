// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  //final VoidCallback showLoginPage;
  const RegisterPage(/*{super.key, required this.showLoginPage}*/);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Text Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();

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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _nameController.dispose();
    _mobileController.dispose();

    super.dispose();
  }

  Future<void> signUp() async {
    // Check password confirmation before proceeding
    if (_passwordController.text.trim() !=
        _confirmpasswordController.text.trim()) {
      showDialog(
        context: context, // Replace with your context provider
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sign Up Error'),
            content: const Text('Passwords do not match. Please try again.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        }, 
      );
      return; // Exit the function if passwords don't match
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      //add Details
      addUserDetails(
        _nameController.text.trim(),
        _mobileController.text.trim(),
        _emailController.text.trim(),
      );
      // Sign-up successful, navigate or show success message
    } on FirebaseAuthException catch (e) {
      // Handle signup errors
      showDialog(
        context: context, // Replace with your context provider
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sign Up Error'),
            content: Text(e.message.toString()),
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
  Future addUserDetails(String name, String mobile, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'mobile': mobile,
      'email': email,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                //lottie animation
                Container(
                  child: SizedBox(
                    height: 300,
                    child: Lottie.network(
                        'https://lottie.host/465251be-508f-4f50-ba72-03378ce68e35/iTUMJMGb8j.json'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //Some Text
                Text(
                  'Fill it out for Registration!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                //Name field
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
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
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
                        controller: _mobileController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mobile Number',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
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
                        controller: _confirmpasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
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
                      var valConfirmPass = _confirmpasswordController.text;
                      var valName = _nameController.text;
                      var valMobile = _mobileController.text;

                      if (valName.isEmpty == true) {
                        ShowMySnackBar("Please Enter Your Name");
                      }
                      if (valMobile.isEmpty == true) {
                        ShowMySnackBar("Please Enter Mobile No.");
                      }
                      if (valEmailId.isEmpty == true) {
                        ShowMySnackBar("Please Enter Email Id");
                      }
                      if (valPass.isEmpty == true) {
                        ShowMySnackBar("Please Enter Password");
                      }
                      if (valConfirmPass.isEmpty == true) {
                        ShowMySnackBar("Please Re-Enter Password");
                      } else {
                        signUp();
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
                          'Register',
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
                    Text('Already a member ?'),
                    GestureDetector(
                     // onTap: 
                      child: Text(
                        ' Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
