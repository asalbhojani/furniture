import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture/Login.dart';
import 'package:furniture/Register.dart';
import 'package:furniture/profileEdit.dart';
import 'package:furniture/userProfile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  // void pageShifter()async{
  //   SharedPreferences userLoginDetails = await SharedPreferences.getInstance();
  //   var myValue = userLoginDetails.getBool("UserLoggedIn");
  //   if (myValue==true) {
  //     Timer(Duration(milliseconds: 3000), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => userProfile(),)),);
  //   }
  //   else{
  //     Timer(Duration(milliseconds: 3000), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => profile(),)),);
  //   }
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Timer(
  //       Duration(milliseconds: 3000),
  //           () => FirebaseAuth.instance.currentUser != null
  //           ? Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => userProfile(),
  //           ))
  //           : Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => profile(),
  //           )));
  //   super.initState();
  // }

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
                       color: Theme.of(context).primaryColor,
                    child: Container(
                      width: double.infinity,
                      height: 350,

                      decoration: BoxDecoration(
                          color: Color(0xf0000523),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.elliptical(69000, 99000),
                              // bottomLeft: Radius.circular(150)
                          )
                      ),
                      child: Container(
                        width: 300,
                        margin: EdgeInsets.only(left: 100,bottom: 100,right:20),
                        child: Image.asset('assets/img/profilepic.png',
                            width: 100,
                            height: 300,
                            fit: BoxFit.cover),
                      ),

                    ),),


                    Container(
                      color: Color(0xf0000523),
                      margin: EdgeInsets.symmetric(vertical: 349.9),
                      child: Container(
                        width: double.infinity,
                        height: 450,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(170),
                            )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 54,top: 60),
                              child: Text("AS WE EVOLVE, OUR HOMES ", style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xf000094d),
                              ),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 124,),
                              child: Text("SHOULD TOO ", style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xf000094d),
                              ),),
                            ),

                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Login(),));
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20,left: 30,right: 30),
                                width: 350,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  border: Border.all(color: Color(0xf0000523),width: 3),
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                child:Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4,vertical:1 ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 130,),
                                      Text("SignIn", style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w700,
                                          // color:  Color(0xf0000523)
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Register(),));
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20,left: 30,right: 30),
                                width: 350,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xf0000523),
                                  border: Border.all(color: Color(0xf0000523),width: 3),
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                child:Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4,vertical:1 ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 130,),
                                      Text("Register", style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w700,
                                          // color:  Theme.of(context).primaryColor
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                            ),



                          ],
                        ),
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




// GestureDetector(
// onTap: (){
// Navigator.push(context, MaterialPageRoute(builder: (context)=> Register(),));
// },
//   child: Container(
//     margin: EdgeInsets.only(top: 20,left: 30,right: 30),
//     width: 350,
//     height: 40,
//     decoration: BoxDecoration(
//       color: Color(0xf0000523),
//       border: Border.all(color: Color(0xffffffff),width: 3),
//       borderRadius: BorderRadius.circular(10),
//
//     ),
//     child:Padding(
//       padding: EdgeInsets.symmetric(horizontal: 4,vertical:1 ),
//       child: Row(
//         children: [
//           SizedBox(width: 130,),
//           Text("Register", style: GoogleFonts.poppins(
//               fontWeight: FontWeight.w700,
//               color:  Color(0xffffffff)
//           ),)
//         ],
//       ),
//     ),
//   ),
// )