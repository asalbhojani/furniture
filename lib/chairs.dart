import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class Chair extends StatefulWidget {

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

  // List img= [
  //   'assets/img/chair.jpg',
  //   'assets/img/chair1.png',
  //   'assets/img/chairOrange.png',
  //   'assets/img/chair2.png',
  //   'assets/img/chair3.png',
  //   'assets/img/chair4.png',
  //   'assets/img/chair5.png',
  //   'assets/img/chair7.png',
  //   'assets/img/chair8.png',
  //   'assets/img/chair6.png',
  //   'assets/img/chair9.png',
  // ];
  //
  // List name=['Luxury Blue ArmChair',
  //   'Luxury Torqoise Chair',
  //   'Luxury Orange Chair',
  //   'Royal Black Chair',
  //   'Luxury ArmChair',
  //   'Luxury Pink Chair',
  //   'Royal Grey Chair',
  //   'Luxury Grey Chair',
  //   'Luxury Black Chair',
  //   'Royal Green Chair',
  //   'Luxury TealPink Chair',
  // ];
  //
  // List price=['46','41','48','56','53','49','46','47','54','50','53'];

  bool isFavourite = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<String> favoriteProducts = [];

  void toggleFavorite(String productId) {
    setState(() {
      if (favoriteProducts.contains(productId)) {
        favoriteProducts.remove(productId);
        removeFromFavorites(productId);
      } else {
        favoriteProducts.add(productId);
        addToFavorites(productId);
      }
    });
  }

  Future<void> addToFavorites(String productId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('favorites')
          .doc(user.uid)
          .collection('chair')
          .doc(productId)
          .set({});
    }
  }

  Future<void> removeFromFavorites(String productId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('favorites')
          .doc(user.uid)
          .collection('chair')
          .doc(productId)
          .delete();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
      body:SingleChildScrollView(

        child: Column(
          children: [

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



            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Product-Data").where('Product-Category',isEqualTo:"Chairs")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    var dataLength = snapshot.data!.docs.length;

                    return dataLength == 0
                        ? Center(
                      child: Text("Nothing to show"),
                    )
                        : ListView.builder(
                        itemCount: dataLength,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {

                          String Id = snapshot.data!.docs[index].id;
                          String Name =
                          snapshot.data!.docs[index]['Product-Name'];
                          String Img =
                          snapshot.data!.docs[index]['Product-Image'];
                          String Price =
                          snapshot.data!.docs[index]['Product-Price'];

                          return
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
                                            children: List.generate(1, (index) => Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children:[
                                                  Stack(
                                                    children: <Widget>[

                                                                   Container(
                                                                     width: 300,
                                                                     height: 170,
                                                                     decoration: BoxDecoration(
                                                                         borderRadius: BorderRadius.circular(15),
                                                                         color: Theme.of(context).iconTheme.color,
                                                                         image: DecorationImage(
                                                                             colorFilter: ColorFilter.mode(Color(0xf44d4d4d).withOpacity(0.2), BlendMode.darken),
                                                                             fit: BoxFit.cover,
                                                                             image: NetworkImage("$Img")
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
                                                                     margin: EdgeInsets.only(left: 125,right: 10,),
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
                                                                     child: IconButton(
                                                                       onPressed: () {
                                                                         toggleFavorite(Id);
                                                                       },
                                                                       icon: isFavourite ? Icon(CupertinoIcons.heart_fill,color: Color(0xffff6d40)):
                                                                       Icon(CupertinoIcons.heart,color: Color(0xffff6d40)
                                                                           ),

                                                                     ),
                                                                     // isFavourite? GestureDetector(
                                                                     //     onTap: (){
                                                                     //       toggleFavorite(Id);
                                                                     //     },
                                                                     //     child: Icon(CupertinoIcons.heart_fill,color: Color(0xffff6d40))
                                                                     // ):
                                                                     // GestureDetector(
                                                                     //   onTap: (){
                                                                     //     toggleFavorite(Id);
                                                                     //   },
                                                                     //   child: Icon(CupertinoIcons.heart,color: Color(0xffff6d40)
                                                                     //   ),
                                                                     // ),
                                                                   )],),
                                                               SizedBox(height: 10,),
                                                               Text('$Name',style: GoogleFonts.poppins(
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
                                                                   Text('\$$Price',style: GoogleFonts.poppins(
                                                                     fontSize: 16,
                                                                     fontWeight: FontWeight.w600,
                                                                     color: Color(0xffff6d40),
                                                                   ),),
                                                                 ],
                                                               ),
                                                             ])),

                                          ),
                                        );



                        });
                  }

                  return Container();
                }),
              ],
            ),
          ),

          ],
        ),

      ));
  }
}
