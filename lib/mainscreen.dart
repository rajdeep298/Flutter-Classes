import 'package:firstapp/login.dart';
import 'package:firstapp/login_page.dart';
//import 'package:firstapp/register.dart';
import 'package:firstapp/register_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, 
      child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(tabs:[
          Tab(text: "Register",),
          Tab(text:"Login"),
          
        ]),
        
      ),
      body: TabBarView(children:[
       Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    ),
       Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    ),
      ] 
      ),
    )
    );
    
    
  }
}