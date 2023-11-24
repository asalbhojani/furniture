import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart ';
import 'package:furniture/Sofas.dart';
import 'package:furniture/Tables.dart';
import 'package:furniture/chairs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Login.dart';
import 'Register.dart';
import 'Theme/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex=0;

    List<Map<String, dynamic>> Data = [
    {'name': 'Luxury ArmChair', 'price': '48', 'img': 'assets/img/chairOrange.png'},
    {'name': 'Luxury Sofa',     'price': '60', 'img': 'assets/img/sofa.png'},
    {'name': 'Luxury Table',    'price': '30', 'img': 'assets/img/table6.png'},
  ];


  // String productName = "Luxury ArmChair";
  // double productPrice = 48;
  // String productImage ="assets/img/chairOrange.png";
  //
  // void updateData(String name, double price,String img) {
  //   setState(() {
  //     productName  = name;
  //     productPrice = price;
  //     productImage = img;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Theme.of(context).primaryColor,

      body: SingleChildScrollView(

        child: SafeArea(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40)
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

//Title
                SizedBox(height: 30,),
                 Row(
                   children: [
                     Text("Hala",style: GoogleFonts.workSans(
                         fontSize: 18,
                         fontWeight: FontWeight.w600,
                         color: Color(0xffff9e20),
                       ),),

                     Text("l-l",style: GoogleFonts.workSans(
                       fontSize: 18,
                       fontWeight: FontWeight.w700,
                       color: Theme.of(context).iconTheme.color,
                     ),),
                     Text("ab",style: GoogleFonts.workSans(
                       fontSize: 20,
                       fontWeight: FontWeight.w600,
                       color: Color(0xffff9e20),
                     ),),

                   ],),

 //Heading Discover
                Container(
                  width: double.infinity,
                  height: 65,
                  // color: Colors.cyan,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children:[
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Discover Our",style: GoogleFonts.workSans(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).iconTheme.color,
                        ),),

                        Text("Products",style: GoogleFonts.workSans(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).iconTheme.color,
                          ),),
                      ],),
                   SizedBox(width: 130,),
                          Container(
                            width: 51,
                            height: 53,
                            decoration: BoxDecoration(
                              color: Color(0xffff6d40),
                              borderRadius: BorderRadius.circular(25)
                            ),
                              child: Icon(Icons.search_rounded,color:Theme.of(context).primaryColor)
                          ),

                 ], ),),

//Buttons
                Container(
                  width: double.infinity,
                  height: 50,
                  // color: Colors.cyan,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      
                      ElevatedButton(onPressed: (){
                        setState(() {

                          currentIndex=0;


                        });
                      },
                          style: ButtonStyle(
                            backgroundColor: currentIndex==0?MaterialStateProperty.all(Color(0xf001174d)):
                            MaterialStateProperty.all(Color(0xffffffff)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      side: BorderSide(color: Color(0xf969696))
                                  ))
                          ),
                        child:Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4,vertical:11 ),
                          child: Row(
                            children: [
                              Icon(Icons.chair_alt_outlined, color:  currentIndex==0?Color(0xffffffff):
                                                                     Color(0xf0000000),),
                              SizedBox(width: 5,),
                              Text("Chair", style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color:  currentIndex==0?Color(0xffffffff):
                                Color(0xf0000000),
                              ),)
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 13,),

                      ElevatedButton(onPressed: (){
                        setState(() {

                          currentIndex=1;
                          // updateData("Luxury Grey Sofa", 48,"assets/img/sofa.png");
                        });
                      },
                          style: ButtonStyle(
                            backgroundColor: currentIndex==1?MaterialStateProperty.all(Color(0xf001174d)):
                            MaterialStateProperty.all(Color(0xffffffff)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      side: BorderSide(color: Color(0xf969696))
                                  ))
                          ),
                          child:Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4,vertical:11 ),
                            child: Row(
                              children: [
                                Icon(Icons.chair_outlined,color:  currentIndex==1?Color(0xffffffff):
                                                                              Color(0xf0000000),),
                                SizedBox(width: 5,),
                                Text("Sofa", style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color:  currentIndex==1?Color(0xffffffff):
                                  Color(0xf0000000),
                                ),)
                              ],
                            ),
                          ),
                      ),

                      SizedBox(width: 13,),

                      ElevatedButton(onPressed: (){
                        setState(() {

                          currentIndex=2;
                        });
                      },
                          style: ButtonStyle(
                            backgroundColor: currentIndex==2?MaterialStateProperty.all(Color(0xf001174d)):
                            MaterialStateProperty.all(Color(0xffffffff)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      side: BorderSide(color: Color(0xf969696))
                                  ))
                          ),
                        child:Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4,vertical:11 ),
                          child: Row(
                            children: [
                              Icon(Icons.table_restaurant_outlined, color:  currentIndex==2?Color(0xffffffff):
                                                                                         Color(0xf0000000),),
                              SizedBox(width: 5,),
                              Text("Table", style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color:  currentIndex==2?Color(0xffffffff):
                                                     Color(0xf0000000),
                              ),)
                            ],
                          ),
                        ),
                      ),

                    ],),
                ),

                SizedBox(height: 18,),
                Text("Popular", style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xf0000000),
                ),),

                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 300,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xf0eccfd3),
                        //0xf0ceacc5,0xf0e1ccd8
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      width: 330,
                      height: 300,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xf0fae7d0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      width: 310,
                      height: 300,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xf0eacfbd),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      width: 290,
                      height: 300,
                      margin: EdgeInsets.symmetric(vertical: 10,),
                      decoration: BoxDecoration(
                        color: Color(0xf0fcdfe6),
                        //0xf0e1a1c8,0xf0ffcce4,0xf0eecadb,0xf0ffd9ea,0xf0fad5e1
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: 40,
                              height: 33,
                              margin: EdgeInsets.only(left: 230,top: 7,right: 20),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffababab,),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(2, 2),
                                    )
                                  ]
                                  // border: Border.all(color: Color(0xffa19e9e))
                              ),
                              child: Icon(CupertinoIcons.heart,color: Color(0xffff6d40))
                          ),


                          Container(
                            width: double.infinity,
                            height: 200,
                            // color: Colors.lightBlue,
                            alignment: Alignment.center,
                        child: Image.asset('${Data[currentIndex]['img']}',
                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.cover),
                            ),


                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('${Data[currentIndex]['name']}', style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xf0363535),
                            ),),
                          ),

                          Container(
                            width: double.infinity,
                            height: 35,
                            // color: Colors.lightBlueAccent,
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text("\$${Data[currentIndex]['price']}", style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xf00c0c0c),
                                  ),),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],),

//Show more
                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    setState(() {

                      if(currentIndex==0){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Chair(),));
                      }
                      if(currentIndex==1){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Sofa(),));
                      }
                      if(currentIndex==2){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Tables()));
                      }

                      // updateData("Luxury Table", 48,"assets/img/table.png");
                    });
                  },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(
                            0xf000103b)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                                side: BorderSide(color: Color(0xf969696))
                            ))
                    ),
                    child:Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4,vertical:11 ),
                      child: Row(
                        children: [
                          Icon(Icons.expand_more, color:  Color(0xffffffff)),
                          SizedBox(width: 5,),
                          Text("Show More", style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color:  Color(0xffffffff),
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),



                // Row(
                //   children:[
                //     SizedBox(width: 20,),
                //     Text("Discover Our",style: GoogleFonts.workSans(
                //     fontSize: 27,
                //     fontWeight: FontWeight.w500,
                //     color: Color(0xf0000000),
                //   ),),
                //     SizedBox(width: 140,),
                //     Container(
                //       width: 51,
                //       height: 53,
                //       decoration: BoxDecoration(
                //         color: Color(0xffff6d40),
                //         borderRadius: BorderRadius.circular(23)
                //       ),
                //         child: Icon(Icons.search,color: Color(0xffffffff))
                //     ),
                //
                //   ],),

                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 20),
                //   child: Text("Products",style: GoogleFonts.workSans(
                //     fontSize: 27,
                //     fontWeight: FontWeight.w700,
                //     color: Color(0xf0000000),
                //   ),),
                // ),



              ],
            ),
          ),
        ),

      ),



    );
  }
}
