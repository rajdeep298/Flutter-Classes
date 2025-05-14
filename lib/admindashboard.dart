import 'package:firstapp/add_item.dart';
import 'package:firstapp/delete_item.dart';
import 'package:firstapp/search_item.dart';
import 'package:firstapp/update_item.dart';
import 'package:flutter/material.dart';

import 'view_item.dart';

class AdminDash extends StatefulWidget {
  const AdminDash({super.key});

  @override
  State<AdminDash> createState() => _AdminDashState();
}

class _AdminDashState extends State<AdminDash> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Admin Dashboard',
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: PageView(
        controller: pageController,
        children: [
      Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => AddItem(),)),

      Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => ViewItem(),)),

      Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => SearcItem(),)),

      Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => UpdateItem(),)),

      Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => DeleteItem(),)),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Item'),
           BottomNavigationBarItem(icon: Icon(Icons.view_agenda), label: 'View Item'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Update Item'),
           BottomNavigationBarItem(icon: Icon(Icons.delete), label: 'Delete Item'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      )
    );
  }
}