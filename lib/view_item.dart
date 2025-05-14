import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewItem extends StatefulWidget {
  const ViewItem({super.key});

  @override
  State<ViewItem> createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body:  StreamBuilder(
          stream: FirebaseFirestore.instance.collection('product').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget> [
                      Image.asset(''),
                      Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Id    :"+doc['id']),
                              //style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Name :"+doc['name']),
                          Text("Price :"+doc['price']),
                        ]))),

                    ]
                  ),
                  /*child: ListTile(
                    title: Text(doc['id']),
                    subtitle: Text(doc['name']),*/
                    
                    
                  );
                
              }).toList(),
            );
          },
        ),
      
      
    );
  }
}