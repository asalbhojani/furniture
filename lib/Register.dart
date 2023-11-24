import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:furniture/Home.dart';
import 'package:furniture/Login.dart';
import 'package:furniture/Profile.dart';
import 'package:furniture/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  TextEditingController name=TextEditingController();
  TextEditingController age=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController pass =TextEditingController();

  File? userProfile;

  void InsertUserwithImg()async{

    UploadTask uploadTask = FirebaseStorage.instance.ref().child("User-Images").child(Uuid().v1()).putFile(userProfile!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String userImage = await taskSnapshot.ref.getDownloadURL();
    InsertUser(imgURL: userImage);
    Navigator.push(context, MaterialPageRoute(builder: (context)=> Login(),));

  }
  void InsertUser ({String? imgURL})async{

    String userId = Uuid().v1();

    Map<String , dynamic> userDetails ={
      "User-Id":userId,
      "User-Name":name.text.toString(),
      "User-Age":age.text.toString(),
      "User-Image": imgURL,
      "User-Email":email.text.toString(),
      "User-Password":pass.text.toString(),
    };
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.toString(), password: pass.text.toString());
      await FirebaseFirestore.instance.collection("userData").doc(userId).set(userDetails);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
      // SharedPreferences userLoginDetails = await SharedPreferences.getInstance();
      // userLoginDetails.setBool("UserLoggedIn", true);
    }on FirebaseAuthException catch(ex){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${ex.code.toString()}')));
    }
  }
  var _formkey =GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    name.dispose();
    age.dispose();
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   color: Color(0xf0000731),
              //   padding: EdgeInsets.all(16.0),
              //   child: Row(
              //     children: [
              //       Container(
              //         padding: EdgeInsets.all(7.0),
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(40)
              //         ),
              //         child: Icon(
              //           Icons.arrow_back_ios_rounded, // Arrow icon
              //           size: 18, // Icon size
              //           color: Color(0xff282828), // Icon color (match the container background)
              //         ),
              //       ),
              //       SizedBox(width: 8), // Add spacing between the arrow and other content
              //     ],
              //   ),
              // ),

              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 250,
                    color: Color(0xf0000523),

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
                                  color:  Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> bottomNavigation(),));
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_rounded, // Arrow icon
                                  size: 18, // Icon size
                                  color:  Theme.of(context).iconTheme.color, // Icon color (match the container background)
                                ),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 100,top: 15),
                              child: Text("Welcome Back", style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                // color: Theme.of(context).primaryColor,
                              ),),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 124,),
                              child: Text("SignIn to your account", style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                // color:  Theme.of(context).primaryColor,
                              ),),
                            ),

                          ],),
                      ],),
                  ),

                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 200),
                    decoration: BoxDecoration(
                        color:  Theme.of(context).primaryColor,
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
                            color: Theme.of(context).iconTheme.color,
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
                                      userProfile = convertedFile;
                                    });
                                  }
                                  else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No Image Selected")));
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.grey.shade400,
                                  backgroundImage: userProfile!=null?FileImage(userProfile!):null,
                                  child: Icon(Icons.person,color: Color(
                                      0xf08c8c8c),size: 75,),
                                ),
                              ),

                              SizedBox(height: 20,),

                              Container(
                                  margin: EdgeInsets.symmetric(horizontal:30),
                                  child:TextFormField(
                                      controller: name,
                                      validator: (value){
                                        if (value==null || value.isEmpty || value==" ") {
                                          return "Name is required ";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        label: Text("Enter your name"),
                                        filled: true,
                                        // fillColor: Color(0xffff6d40),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(40),
                                          borderSide: BorderSide(
                                            color: Color(0xf001074f),
                                            width: 2,
                                          ),
                                        ),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(left: 25.0,right: 20),
                                          child:Icon(Icons.person,color: Color(0xf001074f),)),
                                      )
                                  )
                              ),

                              SizedBox(height: 20,),

                              Container(
                                  margin: EdgeInsets.symmetric(horizontal:30),
                                  child:TextFormField(
                                      controller: age,
                                      validator: (value){
                                        if (value==null || value.isEmpty || value==" ") {
                                          return "Age is required ";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        label: Text("Enter your Age"),
                                        filled: true,
                                        // fillColor: Color(0xffff6d40),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(40),
                                          borderSide: BorderSide(
                                            color: Color(0xf001074f),
                                            width: 2,
                                          ),
                                        ),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(left: 25.0,right: 20),
                                          child:Icon(Icons.person,color: Color(0xf001074f),)),
                                      )
                                  )
                              ),

                              SizedBox(height:20,),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal:30),
                                  child:TextFormField(
                                      controller: email,
                                      validator: (value){
                                        if (value==null || value.isEmpty || value==" ") {
                                          return "Email is required ";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        label: Text("Enter your email"),
                                        filled: true,
                                        // fillColor: Color(0xffff6d40),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(40),
                                          borderSide: BorderSide(
                                            color: Color(0xf001074f),
                                            width: 2,
                                          ),
                                        ),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(left: 25.0,right: 20),
                                          child:Icon(Icons.person,color: Color(0xf001074f),)),
                                      )
                                  )
                              ),

                              SizedBox(height: 20,),

                              Container(
                                  margin: EdgeInsets.symmetric(horizontal:30),
                                  child:TextFormField(
                                      controller: pass,
                                      validator: (value){
                                        if (value==null || value.isEmpty || value==" ") {
                                          return "Password is required ";
                                        }
                                      },
                                      obscureText: true,
                                      obscuringCharacter: "*",
                                      decoration: InputDecoration(
                                        label: Text("Enter your password"),
                                        filled: true,
                                        // fillColor: Color(0xffff6d40),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(40),
                                          borderSide: BorderSide(
                                            color: Color(0xf001074f),
                                            width: 2,
                                          ),
                                        ),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(left: 25.0,right: 20),
                                          child:Icon(Icons.key,color: Color(0xf001074f),)),
                                      )
                                  )
                              ),

                              SizedBox(height:20,),

                              ElevatedButton(onPressed: (){

                                if (_formkey.currentState!.validate()) {

                                  InsertUserwithImg();

                                }
                              },
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(width: 0, color: Theme.of(context).primaryColor),
                                  primary:  Theme.of(context).primaryColor,
                                  elevation: 0,
                                ),
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20,left: 30,right: 30),
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xf0000523),
                                      // border: Border.all(color: Color(0xffffffff),width: 3),
                                      borderRadius: BorderRadius.circular(40),

                                    ),
                                    child:Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 4,vertical:1 ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 90,),
                                          Text("Register", style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              color:   Theme.of(context).iconTheme.color
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
