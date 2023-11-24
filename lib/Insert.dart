 import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import 'Login.dart';
import 'main.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {


  TextEditingController name=TextEditingController();
  TextEditingController price=TextEditingController();
  TextEditingController category=TextEditingController();

  File? productImage;

  void InsertProductwithImg()async{

    UploadTask uploadTask = FirebaseStorage.instance.ref().child("Product-Images").child(Uuid().v1()).putFile(productImage!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String Image = await taskSnapshot.ref.getDownloadURL();
    InsertProduct(imgURL: Image);
    Navigator.pop(context);

  }

  void InsertProduct ({String? imgURL})async{

    String productId = Uuid().v1();

    Map<String , dynamic> productDetails ={
      "Product-Id":productId,
      "Product-Name":name.text.toString(),
      "Product-Price":price.text.toString(),
      "Product-Image": imgURL,
      "Product-Category":category.text.toString(),
    };

    FirebaseFirestore.instance.collection("Product-Data").doc(productId).set(productDetails);

  }
  var _formkey =GlobalKey<FormState>();

@override
void dispose() {
    // TODO: implement dispose
  name.dispose();
  price.dispose();
  // productImage.dispose();
  category.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 250,
                    color: Color(0xf0000731),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Container(
                              padding: EdgeInsets.all(7.0),
                              margin: EdgeInsets.only(left: 40,top: 50),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> bottomNavigation(),));
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_rounded, // Arrow icon
                                  size: 18, // Icon size
                                  color: Color(0xff282828), // Icon color (match the container background)
                                ),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 100,top: 15),
                              child: Text("Welcome Back", style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff),
                              ),),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 124,),
                              child: Text("SignIn to your account", style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffffffff),
                              ),),
                            ),

                          ],),
                      ],),
                  ),

                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 200),
                    decoration: BoxDecoration(
                        color: Color(0xf0ffffff),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40)
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 24,top: 40),
                          child: Text("Register ", style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff171717),
                          ),),
                        ),

                        Form(
                          key: _formkey,
                          child: Column(
                            children: [

                              SizedBox(height: 20,),

                              GestureDetector(
                                onTap: () async {
                                  XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                                  if (selectedImage!=null) {
                                    File convertedFile  =File(selectedImage.path);
                                    setState(() {
                                      productImage = convertedFile;
                                    });
                                  }
                                  else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No Image Selected")));
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.grey.shade400,
                                  backgroundImage: productImage!=null?FileImage(productImage!):null,
                                ),
                              ),

                              SizedBox(height: 20,),

                              Container(
                                  margin: EdgeInsets.symmetric(horizontal:20),
                                  child:TextFormField(
                                      controller: name,
                                      validator: (value){
                                        if (value==null || value.isEmpty || value==" ") {
                                          return "ProductName is required ";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        label: Text("Enter Product name"),
                                        border: OutlineInputBorder(

                                          borderSide: BorderSide(
                                              color: Colors.lime
                                          ),
                                        ),
                                        prefixIcon: Icon(Icons.person),
                                      )
                                  )
                              ),

                              SizedBox(height: 20,),

                              Container(
                                  margin: EdgeInsets.symmetric(horizontal:20),
                                  child:TextFormField(
                                      controller: price,
                                      validator: (value){
                                        if (value==null || value.isEmpty || value==" ") {
                                          return "price is required ";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        label: Text("Enter Price"),
                                        border: OutlineInputBorder(

                                          borderSide: BorderSide(
                                              color: Colors.lime
                                          ),
                                        ),
                                        prefixIcon: Icon(Icons.person),
                                      )
                                  )
                              ),

                              SizedBox(height:20,),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal:20),
                                  child:TextFormField(
                                      controller: category,
                                      validator: (value){
                                        if (value==null || value.isEmpty || value==" ") {
                                          return "Category is required ";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        label: Text("Enter Category Name"),
                                        border: OutlineInputBorder(

                                          borderSide: BorderSide(
                                              color: Colors.lime
                                          ),
                                        ),
                                        prefixIcon: Icon(Icons.person),
                                      )
                                  )
                              ),

                              SizedBox(height:20,),

                              ElevatedButton(onPressed: (){

                                if (_formkey.currentState!.validate()) {

                                  InsertProductwithImg();

                                }
                                Navigator.push((context), MaterialPageRoute(builder: (context)=> Login()));
                              },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color(0xffffffff)),
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(top: 20,left: 30,right: 30),
                                  width: 350,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xf0000523),
                                    border: Border.all(color: Color(0xffffffff),width: 3),
                                    borderRadius: BorderRadius.circular(10),

                                  ),
                                  child:Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 4,vertical:1 ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 120,),
                                        Text("Register", style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            color:  Color(0xffffffff)
                                        ),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text("Already Have an Account ? ",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w300),),
                                  /*  ElevatedButton(onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => signup(),));
                     }, child:  Text("SignUp",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600),)),*/

                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Login(),));
                                    },
                                    child:Text("SignIn",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w700),),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),



                ],
              ),

            ],
          ),
        )

    );
  }
}
