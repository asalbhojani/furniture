import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture/Home.dart';
import 'package:furniture/chairDescription.dart';
import 'package:furniture/favourite.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class Chair extends StatefulWidget {
  //  String name;
  //  bool isFavorite;
  //  VoidCallback onFavoriteToggle;
  //
  //  Chair({
  //   required this.name,
  //   required this.isFavorite,
  //   required this.onFavoriteToggle,
  // });

  @override
  State<Chair> createState() => _ChairState();
}

class _ChairState extends State<Chair> {

  // List<Map<String, dynamic>> chairData = [
  //   {'name': 'Luxury Blue ArmChair', 'price': '46', 'img': 'assets/img/chair.jpg'},
  //   {'name': 'Luxury Torqoise Chair','price': '41', 'img': 'assets/img/chair1.png'},
  //   {'name': 'Luxury Orange Chair',  'price': '48', 'img': 'assets/img/chairOrange.png'},
  //   {'name': 'Royal Black Chair',    'price': '51', 'img': 'assets/img/chair2.png'},
  //   {'name': 'Luxury ArmChair',      'price': '43', 'img': 'assets/img/chair3.png'},
  //   {'name': 'Luxury Pink Chair',    'price': '39', 'img': 'assets/img/chair4.png'},
  //   {'name': 'Royal Grey Chair',     'price': '46', 'img': 'assets/img/chair5.png'},
  //   {'name': 'Luxury Grey Chair',    'price': '51', 'img': 'assets/img/chair7.png'},
  //   {'name': 'Luxury Black Chair',   'price': '44', 'img': 'assets/img/chair8.png'},
  //   {'name': 'Royal Green Chair',    'price': '47', 'img': 'assets/img/chair6.png'},
  //   {'name': 'Luxury TealPink Chair','price': '52', 'img': 'assets/img/chair9.png'},
  //
  // ];

  List img= [
    'assets/img/chair.jpg',
    'assets/img/chair1.png',
    'assets/img/chairOrange.png',
    'assets/img/chair2.png',
    'assets/img/chair3.png',
    'assets/img/chair4.png',
    'assets/img/chair5.png',
    'assets/img/chair7.png',
    'assets/img/chair8.png',
    'assets/img/chair6.png',
    'assets/img/chair9.png',
  ];

  List name=['Luxury Blue ArmChair',
    'Luxury Torqoise Chair',
    'Luxury Orange Chair',
    'Royal Black Chair',
    'Luxury ArmChair',
    'Luxury Pink Chair',
    'Royal Grey Chair',
    'Luxury Grey Chair',
    'Luxury Black Chair',
    'Royal Green Chair',
    'Luxury TealPink Chair',
  ];

  List price=['46','41','48','56','53','49','46','47','54','50','53'];

  bool isFavourite =false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
      body:SingleChildScrollView(

        child: Column(
          children: [

            Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Color(0xffff9e20),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Container(
                          width: 100,
                          height: 5,
                          padding: EdgeInsets.all(7.0),
                          margin: EdgeInsets.only(left: 150,top: 65),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(40)
                          ),
                        ),
                      ],),
                  ),


                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 80),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25)
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 65,
                          // color: Colors.cyan,
                          margin: EdgeInsets.only(left: 10,top: 40),
                          child: Row(
                            children:[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text("Explore Our",style: GoogleFonts.workSans(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    // color: Theme.of(context).primaryColor,
                                  ),),

                                  Text("Best Chairs",style: GoogleFonts.workSans(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    // color: Theme.of(context).primaryColor,
                                  ),),
                                ],),
                              SizedBox(width: 140,),
                              Container(
                                  width: 51,
                                  height: 53,
                                  decoration: BoxDecoration(
                                      color: Color(0xffff6d40),
                                      borderRadius: BorderRadius.circular(25)
                                  ),
                                  child: Icon(Icons.search_rounded,color: Theme.of(context).primaryColor)
                              ),

                            ], ),),

                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> bottomNavigation(),));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text("Home > chair", style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xf0626262),
                            ),),
                          ),
                        ),


                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: GridView.count(
                            crossAxisCount: 2,
                            physics: const ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 300/420,
                            children: List.generate(img.length, (index) => Stack(
                              children: [
                                // Container(
                                //    width: 30,
                                //    height: 320,
                                //    decoration: BoxDecoration(
                                //      borderRadius: BorderRadius.circular(20),
                                //      color: Color(0xff002a62),
                                //        boxShadow: [
                                //          BoxShadow(
                                //            color: Color(0xff8f8989,),
                                //            spreadRadius: 4,
                                //            blurRadius: 10,
                                //            offset: Offset(4, 4),
                                //          )
                                //        ]
                                //    ),
                                //  ),

                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> chairDescription(img: img[index], price: price[index], name: name[index]),));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        width:300,
                                        // color: Colors.lightBlueAccent,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:[

                                            Container(

                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                children:[
                                                  Stack(
                                                    children: <Widget>[

                                                      Container(
                                                  width: 300,
                                                  height: 170,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      color: Theme.of(context).primaryColor,
                                                      image: DecorationImage(
                                                          colorFilter: ColorFilter.mode(Color(0xf44d4d4d).withOpacity(0.2), BlendMode.darken),
                                                          fit: BoxFit.cover,
                                                          image: AssetImage("${img[index]}")
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color(0xf44d4d4d),
                                                          spreadRadius: 1,
                                                          blurRadius: 5,
                                                          offset: Offset(1, 1),
                                                        )
                                                      ]
                                                  ),
                                          ),
                                                      Container(
                                                          width: 40,
                                                          height: 33,
                                                          margin: EdgeInsets.only(left: 125,right: 10,top: 5),
                                                          decoration: BoxDecoration(

                                                              shape: BoxShape.circle,
                                                              color: Theme.of(context).primaryColor,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Color(0xf343434),
                                                                  spreadRadius: 1,
                                                                  blurRadius: 5,
                                                                  offset: Offset(2, 2),
                                                                )
                                                              ]
                                                            // border: Border.all(color: Color(0xffa19e9e))
                                                          ),
                                                          child: isFavourite? Icon(CupertinoIcons.heart_fill,color: Color(0xffff6d40)):
                                                          Icon(CupertinoIcons.heart,color: Color(0xffff6d40)
                                                          ),
                                                     ),],),
                                                  SizedBox(height: 10,),
                                                  Text('${name[index]}',style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color:Theme.of(context).iconTheme.color,
                                                  ),),

                                                  Row(
                                                    children: [

                                                      Icon(Icons.star_outline_rounded,color: Color(
                                                          0xf0343434)),
                                                      SizedBox(width: 5,),
                                                      Text("5.00", style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w600,
                                                        color:  Color(0xf0343434),
                                                      ),),
                                                      SizedBox(width: 70,),
                                                      Text('\$${price[index]}',style: GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                        color: Color(0xffff6d40),
                                                      ),),
                                                    ],
                                                  ),
                                  ]),
                                ),
                                        ],),
                                      ),



                                    ],
                                  ),
                                ),
                              ],
                            )),

                          ),
                        ),


                      ],
                    ),
                  ),

                ]),

          ],
        ),

      ));
  }
}
