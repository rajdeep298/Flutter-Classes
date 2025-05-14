import 'package:firstapp/login.dart';
import 'package:firstapp/mens.dart';
import 'package:firstapp/womens.dart';
import 'package:flutter/material.dart';

class UserDash extends StatefulWidget {
  const UserDash({super.key});

  @override
  State<UserDash> createState() => _UserDashState();
}

class _UserDashState extends State<UserDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('UserDashboard'),
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 140,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Mens()));
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      
                      //color: Colors.blue,
                      child:Image.network('https://fashionweekdaily.com/wp-content/uploads/2015/07/Tommy-Hilfiger-SS16-NY-Mens-Fashion-Week_5.jpg',fit: BoxFit.cover,)
                      //Center(child: Text('Container 1')),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      height: 150,
                      
                      child: Image.network('https://th.bing.com/th/id/OIP.zCzS-fiwPSWnITrxQqbP9AHaLG?w=193&h=290&c=7&r=0&o=5&dpr=1.5&pid=1.7',fit: BoxFit.cover,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0), // Adjust the spacing between rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      height: 150,
                      
                      child: Image.network('https://th.bing.com/th/id/R.9893ace9a43388c3f7bfabfebdf6e784?rik=jZLyM8%2b%2fydtVHw&riu=http%3a%2f%2f1.bp.blogspot.com%2f-eA_p4L_nZkc%2fTlVJNpej2NI%2fAAAAAAAABOA%2fKdUUUpyUZmk%2fs1600%2fnecklace-zoom-DSC_9797.jpg&ehk=BQOvs%2bEbgckC%2fJlZoZqZ9o95%2fZfqMPS3XFFfZgukbv8%3d&risl=&pid=ImgRaw&r=0'),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      height: 150,
                      
                      child: Image.network('https://th.bing.com/th/id/OIP.XDilM-pXXOoTI_CFMuAllgHaE7?w=289&h=193&c=7&r=0&o=5&dpr=1.5&pid=1.7',fit: BoxFit.cover,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0), // Adjust the spacing between rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      height: 150,
                      
                      child: Image.network('https://i5.walmartimages.com/asr/c05441d8-926f-44ef-86f4-2bc1ecd6767c.7094e5a768a5c29eae27b9390f493d72.jpeg',fit: BoxFit.cover,),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      height: 150,
                     
                      child: Image.network('https://1.bp.blogspot.com/-8gbVnbc9pm8/V-1mCO5ClUI/AAAAAAAAOAM/c8_iK5j6qPIDbWEJuGdvpQavjyTnFPrNACLcB/s1600/Clarks_Fall_2016_Womens_Footwear_Collection4_www.shoeography.com.jpg',fit: BoxFit.cover,),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      


      drawer: Drawer(
        backgroundColor: Colors.tealAccent,
        elevation: 20.0,
        child: Column(
          children: <Widget>[
            DrawerHeader(
             
              child: 
            Text("Catagory",
            style: TextStyle(
              fontSize: 22.5,
              fontWeight: FontWeight.bold
            ),)),
            ListTile(
              title: new Text("Mens Collection"),
              leading: new Icon(Icons.add_card),
              onTap: () =>Navigator.push(context,
        MaterialPageRoute(builder: (context) => Login()))
            ),
            Divider(
              height: 0.3,
            ),
            ListTile(
              title: new Text("Womens Collection"),
              leading: new Icon(Icons.add_card),
            ),
             Divider(
              height: 0.3,
            ),
            ListTile(
              title: new Text("Jwellery"),
              leading: new Icon(Icons.add_card),
            ),
            ListTile(
              title: new Text("Hand Bags"),
              leading: new Icon(Icons.add_card),
            )
          ],
        ),

    ));
  }
}