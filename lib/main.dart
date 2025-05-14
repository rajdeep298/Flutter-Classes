import 'package:firstapp/admindashboard.dart';
import 'package:firstapp/home_page.dart';
import 'package:firstapp/landing.dart';
import 'package:firstapp/mainscreen.dart';
import 'package:firstapp/uploadimagescreen.dart';
import 'package:firstapp/userdashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async 
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Welcome"),
        centerTitle: true,
      ),
      body:Center( 
        child: Image( 
          image: AssetImage('assets/img1.jpg')),
         // image: NetworkImage('https://media.istockphoto.com/id/1494104649/photo/ai-chatbot-artificial-intelligence-digital-concept.jpg?s=1024x1024&w=is&k=20&c=FQZBVxbXjhgPzm-W-5Jo3O7x7OXLPugwXzTKEu6nV3w=')),
       /* child:Text("Welcome to Flutter",
        style: TextStyle(
          fontSize: 25.5,
          fontWeight: FontWeight.w700,
          color: Colors.pink
        ),),*/),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => Landing()));
         },
        child: Text("Click"),
        backgroundColor: Colors.greenAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
      ,
     
    );
  }
}

