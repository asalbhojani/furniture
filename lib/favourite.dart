import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class favourite extends StatefulWidget {
  // final List<bool> isFavoriteList;
  //
  // favourite(this.isFavoriteList);

  @override
  _favouriteState createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {

  // List<String> favoriteItems = [];
  //
  // void toggleFavorite(String item) {
  //   setState(() {
  //     if (favoriteItems.contains(item)) {
  //       favoriteItems.remove(item);
  //     } else {
  //       favoriteItems.add(item);
  //     }
  //   });
  // }
  //
  // bool isFavorite(String item) {
  //   return favoriteItems.contains(item);
  // }
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
                              crossAxisCount: 1,
                              physics: const ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 400/200,
                              children: List.generate(img.length, (index) => Container(
                                width:double.infinity,
                                // color: Colors.lightBlueAccent,
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:[
                                      Container(
                                        width: 340,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Theme.of(context).primaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xf39a9a9a),
                                                spreadRadius: 1,
                                                blurRadius: 5,
                                                offset: Offset(1, 1),
                                              )
                                            ]
                                        ),
                                      child: Stack(
                                        children: <Widget>[


                                         Container(
                                           width: 160,
                                           height: 150,
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft:Radius.circular(15) ),
                                               color: Theme.of(context).primaryColor,
                                               image: DecorationImage(
                                                   colorFilter: ColorFilter.mode(Color(0xf44d4d4d).withOpacity(0.2), BlendMode.darken),
                                                   fit: BoxFit.cover,
                                                   image: AssetImage("${img[index]}")
                                               ),
                                               // boxShadow: [
                                               //   BoxShadow(
                                               //     color: Color(0xf44d4d4d),
                                               //     spreadRadius: 1,
                                               //     blurRadius: 5,
                                               //     offset: Offset(1, 1),
                                               //   )
                                               // ]
                                           ),
                                         ),

                                          // Container(
                                          //   width: 160,
                                          //   height: 150,
                                          //   decoration: BoxDecoration(
                                          //     borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft:Radius.circular(15) ),
                                          //     color: Theme.of(context).primaryColor,
                                          //     image: DecorationImage(
                                          //         colorFilter: ColorFilter.mode(Color(0xf44d4d4d).withOpacity(0.2), BlendMode.darken),
                                          //         fit: BoxFit.cover,
                                          //         image: AssetImage("${img[index]}")
                                          //     ),
                                          //     // boxShadow: [
                                          //     //   BoxShadow(
                                          //     //     color: Color(0xf44d4d4d),
                                          //     //     spreadRadius: 1,
                                          //     //     blurRadius: 5,
                                          //     //     offset: Offset(1, 1),
                                          //     //   )
                                          //     // ]
                                          //   ),
                                          // ),
                                         Container(
                                           width: 35,
                                           height: 30,
                                           margin: EdgeInsets.only(left: 300,right: 10,top: 5),
                                           padding:EdgeInsets.only(top:3),
                                           decoration: BoxDecoration(

                                               shape: BoxShape.circle,
                                               color: Theme.of(context).primaryColor,
                                               boxShadow: [
                                                 BoxShadow(
                                                   color: Color(0xf39a9a9a),
                                                   spreadRadius: 3,
                                                   blurRadius: 8,
                                                   offset: Offset(1, 0),
                                                 )
                                               ]
                                             // border: Border.all(color: Color(0xffa19e9e))
                                           ),
                                           child: isFavourite? Icon(CupertinoIcons.heart_fill,color: Color(0xffff6d40)):
                                           Icon(CupertinoIcons.heart,color: Color(0xffff6d40)
                                           ),
                                         ),
                                        Column(
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children:[
                                             Container(
                                              margin: EdgeInsets.only(left: 175,right: 5,),
                                              child: Text('${name[index]}',style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color:Theme.of(context).iconTheme.color,
                                              ),),
                                            ),

                                             Container(
                                               margin: EdgeInsets.only(left: 50,right: 10,),
                                               child: Text('\$${price[index]}',style: GoogleFonts.poppins(
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.w600,
                                                 color: Color(0xffff6d40),
                                               ),),
                                             ),

                                             Row(
                                               children: [
                                                 Container(
                                                   margin: EdgeInsets.only(left: 175,right: 10,),
                                                   child: Icon(Icons.star_outline_rounded,color: Color(
                                                       0xf0343434)),
                                                 ),
                                                 // SizedBox(width: 5,),
                                                 Text("5.00", style: GoogleFonts.poppins(
                                                   fontWeight: FontWeight.w600,
                                                   fontSize: 14,
                                                   color:  Color(0xf0343434),
                                                 ),),
                                                 SizedBox(width: 30,),

                                               ],),

                                              ]),
                                          ],),
                                      ),
                                    ]),
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

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Favorites'),
    //   ),
    //   body: ListView(
    //     children: [
    //       ProductItem(
    //         name: 'Chair 1',
    //         isFavorite: isFavorite('Chair 1'),
    //         onFavoriteToggle: () => toggleFavorite('Chair 1'),
    //       ),
    //       ProductItem(
    //         name: 'Table 1',
    //         isFavorite: isFavorite('Table 1'),
    //         onFavoriteToggle: () => toggleFavorite('Table 1'),
    //       ),
    //       ProductItem(
    //         name: 'Sofa 1',
    //         isFavorite: isFavorite('Sofa 1'),
    //         onFavoriteToggle: () => toggleFavorite('Sofa 1'),
    //       ),
    //       // Add more ProductItems as needed
    //     ],
    //   ),
    // );
  }
}
