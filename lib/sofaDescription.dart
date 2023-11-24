import 'package:flutter/material.dart';
import 'package:furniture/Sofas.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Login.dart';

class sofaDescription extends StatefulWidget {
  String img;
  String price;
  String name;

  sofaDescription({required this.img,required this.price,required this.name});
  @override
  State<sofaDescription> createState() => _sofaDescriptionState();
}

class _sofaDescriptionState extends State<sofaDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          color:Color(0xf0000731),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Stack(
                  children: <Widget>[

                    Container(
                      width: double.infinity,
                      height: 700,
                      // margin: EdgeInsets.symmetric(vertical: 100),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40)
                          )
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Container(
                            padding: EdgeInsets.all(7.0),
                            margin: EdgeInsets.only(left: 40,top: 50),
                            decoration: BoxDecoration(
                              // color: Colors.white,
                                borderRadius: BorderRadius.circular(40)
                            ),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Sofa()));
                              },
                              child: Icon(
                                Icons.arrow_back_ios_rounded, // Arrow icon
                                size: 18, // Icon size
                                color: Theme.of(context).iconTheme.color, // Icon color (match the container background)
                              ),
                            ),
                          ),


                          Container(
                            width: 350,
                            height: 250,
                            margin: EdgeInsets.only(left: 40,top: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              // color: Color(0xffffffff),
                              image: DecorationImage(
                                // colorFilter: ColorFilter.mode(Color(0xf0ffffff).withOpacity(0.2), BlendMode.darken),
                                  fit: BoxFit.cover,
                                  image: AssetImage(widget.img)
                              ),

                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 24,top: 40),
                            child: Text(widget.name, style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff171717),
                            ),),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 24,top: 15),
                            child: Text("\$"+widget.price, style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffff6d40),
                            ),),
                          ),

                          Container(
                            width: 350,
                            // color: Color(0xf0000000),
                            margin: EdgeInsets.only(left: 24,right: 30,top: 15),
                            child: Text("Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ",
                              softWrap: true,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff5b5a5a),
                              ),),
                          ),

                        ],),
                    ),

                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 600),
                      decoration: BoxDecoration(
                        // color: Color(0xf0000731),
                        // borderRadius: BorderRadius.only(
                        //     topRight: Radius.circular(40),
                        //     topLeft: Radius.circular(40)
                        // )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Login(),));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 130,left: 30,right: 30),
                              width: 300,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color(0xffff6d40),
                                  border: Border.all(color:Color(0xffff6d40),width: 3),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xff505050,),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(0.2, 0.2),
                                    )
                                  ]
                              ),
                              child:Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4,vertical:1 ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 90,),
                                    Text("Add To Cart", style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w700,
                                        color:  Color(0xf0000523)
                                    ),),
                                    SizedBox(width: 15,),
                                    Icon(
                                      Icons.shopping_bag, // Arrow icon
                                      size: 18, // Icon size
                                      color: Color(0xf0000523), // Icon color (match the container background)
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),



                  ],
                ),

              ],
            ),
          ),
        )

    );
  }
}
