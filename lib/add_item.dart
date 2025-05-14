import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
   
   final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _catagoryController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
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
    _idController.dispose();
    _nameController.dispose();
    _catagoryController.dispose();
    _quantityController.dispose();
    _priceController.dispose();

    super.dispose();
  }

  Future<void> signUp() async {
    // Check password confirmation before proceeding
   /* if (_passwordController.text.trim() !=
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
        },*/
      //);
     // return; // Exit the function if passwords don't match
       addUserDetails(
        _idController.text.trim(),
        _nameController.text.trim(),
        _catagoryController.text.trim(),
        _quantityController.text.trim(),
        _priceController.text.trim(),
      );
    }

    Future addUserDetails(String id, String name, String cat, String qty, String price) async {
    await FirebaseFirestore.instance.collection('product').add({
      'id':id,
      'name': name,
      'catagory': cat,
      'quantity': qty,
      'price':price
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
                  'Get Your Spacesuit Ready!',
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
                       controller: _idController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Id',
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
                        controller: _catagoryController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Catagory',
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
                        controller: _quantityController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Quantity',
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
                        controller: _priceController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Price',
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
                    var valId = _idController.text;
                      var valName = _nameController.text;
                      var valCatagory = _catagoryController.text;
                      var valQty = _quantityController.text;
                      var valPrice = _priceController.text; 

                     if (valId.isEmpty == true) {
                        ShowMySnackBar("Please Enter Id");
                      }
                      if (valName.isEmpty == true) {
                        ShowMySnackBar("Please Enter Name");
                      }
                      if (valCatagory.isEmpty == true) {
                        ShowMySnackBar("Please Enter Catagory");
                      }
                      if (valQty.isEmpty == true) {
                        ShowMySnackBar("Please Enter Quantity");
                      }
                      if (valPrice.isEmpty == true) {
                        ShowMySnackBar("Please Enter Price");
                      } else {
                        signUp();
                        //addUserDetails(id, name, cat, qty, price)
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
                          'Save',
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

               
              ],
            ),
          ),
        ),
      ),
    );
  }
}