import 'dart:io';
import 'package:furniture/main.dart';
import 'package:furniture/userProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class profileEdit extends StatefulWidget {

  String UId;
  String UName;
  String UAge;
  String UImage;
  String UEmail;
  String UPassword;


  profileEdit({required this.UId,required this.UName,required this.UAge,required this.UImage,required this.UEmail,required this.UPassword});


  @override
  State<profileEdit> createState() => _profileEditState();
}

class _profileEditState extends State<profileEdit> {

  TextEditingController name=TextEditingController();
  TextEditingController age=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController pass =TextEditingController();

  File? userProfile;

  UpdateUserImg()async{

    FirebaseStorage.instance.refFromURL(widget.UImage).delete();
    UploadTask uploadTask = FirebaseStorage.instance.ref().child("User-Images").child(Uuid().v1()).putFile(userProfile!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String userImage = await taskSnapshot.ref.getDownloadURL();
    UpdateUser(imgUrl: userImage);
    Navigator.pop(context);
  }

  UpdateUser({String? imgUrl})async{

    await FirebaseFirestore.instance.collection("userData").doc(widget.UId).update(
        {
          "User-Id":widget.UId,
          "User-Name":name.text.toString(),
          "User-Age":age.text.toString(),
          "User-Image":imgUrl,
          "User-Email":email.text.toString(),
          "User-Password":pass.text.toString(),

        });

    Navigator.pop(context);

  }

  @override
  void initState() {
    // TODO: implement initState

    name.text=widget.UName;
    age.text=widget.UAge;
    email.text= widget.UEmail;
    pass.text=widget.UPassword;

    super.initState();
  }

  var _formkey =GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children:[
            Stack(
              children:<Widget>[

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
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(40)
                            ),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> bottomNavigation(),));
                              },
                              child: Icon(
                                Icons.arrow_back_ios_rounded, // Arrow icon
                                size: 18, // Icon size
                                color: Theme.of(context).iconTheme.color, // Icon color (match the container background)
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 100,top: 15),
                            child: Text("Welcome Back", style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 124,),
                            child: Text("Edit your details", style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),),
                          ),

                        ],),
                    ],),
                ),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 200),
                  decoration: BoxDecoration(
                      color:Theme.of(context).primaryColor,
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
                        child: Text("Edit ", style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          // color: Theme.of(context).iconTheme.color,
                        ),),
                      ),

                Form(
                key: _formkey,
                child: Column(
                  children: [

                    SizedBox(height: 20,),

                    GestureDetector(
                        onTap: ()async{
                          XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                          if (selectedImage!=null) {
                            File convertedImg = File(selectedImage.path);
                            setState(() {
                              userProfile = convertedImg;
                            });
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No Image Selected")));
                          }
                        },
                        child: userProfile==null?CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(widget.UImage),
                        ):CircleAvatar(
                          radius: 40,
                          backgroundImage: userProfile!=null?FileImage(userProfile!):null,
                        )
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
                                borderSide: BorderSide(color: Color(0xffff6d40), width: 4,),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 25.0,right: 20),
                                child:Icon(Icons.person)),
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
                                borderSide: BorderSide(color: Color(0xffff6d40), width: 4,),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 25.0,right: 20),
                                child:Icon(Icons.person)),
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
                                borderSide: BorderSide(color: Color(0xffff6d40), width: 4,),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              prefixIcon:Padding(
                                padding: EdgeInsets.only(left: 25.0,right: 20),
                                child: Icon(Icons.person)),
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
                                borderSide: BorderSide(color: Color(0xffff6d40), width: 4,),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              prefixIcon:Padding(
                                padding: EdgeInsets.only(left: 25.0,right: 20),
                                child: Icon(Icons.key)),
                            )
                        )
                    ),

                    SizedBox(height:20,),

                    ElevatedButton(onPressed: (){

                      if (_formkey.currentState!.validate()) {
                        /*   print(name.text.toString());*/

                        UpdateUserImg();

                      }

                    },
                        style:  ElevatedButton.styleFrom(
                          side: BorderSide(width: 0, color: Theme.of(context).primaryColor),
                          primary: Theme.of(context).primaryColor,
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
                                SizedBox(width: 100,),
                                Text("Edit", style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color:  Colors.white
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

                        //    Text("Already Have an Account ? ",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w300),),
                        //    /*  ElevatedButton(onPressed: (){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => signup(),));
                        // }, child:  Text("SignUp",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600),)),*/
                        //
                        //    GestureDetector(
                        //      onTap: (){
                        //        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login(),));
                        //      },
                        //      child:Text("SignIn",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w700),),
                        //    ),
                      ],
                    )
                  ],
                ),
              ),
        ],),
    ),
            ]),
          ],
        ),
      ),
    );
  }
}
