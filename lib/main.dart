import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture/Home.dart';
import 'package:furniture/Insert.dart';
import 'package:furniture/chairs.dart';
import 'package:furniture/userProfile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:furniture/Profile.dart';
import 'package:furniture/cart.dart';
import 'package:furniture/favourite.dart';
import 'Theme/theme_provider.dart';
import 'firebase_options.dart';


  void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform
  );
    runApp(const MyApp());

  }

  class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _) {
      final themeProvider = Provider.of<ThemeProvider>(context);

      return MaterialApp(
        themeMode: themeProvider.themeMode,
        debugShowCheckedModeBanner: false,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home:Chair(),
      );
    },
  );
  }

  class bottomNavigation extends StatefulWidget {
    const bottomNavigation({super.key});

    @override
    State<bottomNavigation> createState() => _bottomNavigationState();
  }

  class _bottomNavigationState extends State<bottomNavigation> {

    int selectedIndex=0;
    void pageShifter(index){
      setState(() {
        selectedIndex=index;
      });
    }

    List<Widget> myScreens=[
      HomePage(),
      AddtoCart(),
      favourite(),
      userProfile(),
    ];

    List<Widget> logScreens=[
      HomePage(),
      AddtoCart(),
      favourite(),
      profile(),
    ];
    Future login_user()async{
      SharedPreferences userLoginDetails = await SharedPreferences.getInstance();
      return userLoginDetails.getString("UserLoggedIn");
    }

    String? check;
    void initState() {
      // TODO: implement initState
      login_user().then((value){
        setState((){
          check = value;
        });
      });
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:check!=null?myScreens[selectedIndex]:logScreens[selectedIndex],



        bottomNavigationBar:check!=null? CurvedNavigationBar(
            index: selectedIndex,
            backgroundColor: Theme.of(context).primaryColor,
            color: Color(0xf0000523),
            onTap: pageShifter,
            items: [
              Icon(Icons.home_filled, color: selectedIndex!=0? Color(0xffffffff):
              Color(0xffff4914),),
              Icon(Icons.card_travel,color:  selectedIndex!=1? Color(0xffffffff):
              Color(0xffff4914),),
              Icon(CupertinoIcons.heart,color: selectedIndex!=2? Color(0xffffffff):
              Color(0xffff4914),),
              Icon(Icons.person_2_outlined,color:  selectedIndex!=3? Color(0xffffffff):
              Color(0xffff4914),)
            ]):
        CurvedNavigationBar(
            index: selectedIndex,
            backgroundColor: Color(0xffffffff),
            color: Color(0xf0000523),
            onTap: pageShifter,
            items: [
              Icon(Icons.home_filled, color: selectedIndex!=0? Color(0xffffffff):
              Color(0xffff4914),),
              Icon(Icons.card_travel,color:  selectedIndex!=1? Color(0xffffffff):
              Color(0xffff4914),),
              Icon(CupertinoIcons.heart,color: selectedIndex!=2? Color(0xffffffff):
              Color(0xffff4914),),
              Icon(Icons.person_2_outlined,color:  selectedIndex!=3? Color(0xffffffff):
              Color(0xffff4914),)
            ]),


      );
    }
  }




// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Wishlist App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ProductsPage(),
//     );
//   }
// }
//
// class ProductsPage extends StatefulWidget {
//   @override
//   _ProductsPageState createState() => _ProductsPageState();
// }
//
// class _ProductsPageState extends State<ProductsPage> {
//   List<Product> products = List.generate(
//     10,
//         (index) => Product(id: index, name: 'Product $index'),
//   );
//
//   Set<int> wishlistItems = Set();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Products'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.favorite),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => WishlistPage(
//                     wishlistItems: wishlistItems,
//                     onRemove: (productId) {
//                       setState(() {
//                         wishlistItems.remove(productId);
//                       });
//                     },
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           final product = products[index];
//           final isFavorite = wishlistItems.contains(product.id);
//
//           return ListTile(
//             title: Text(product.name),
//             trailing: IconButton(
//               icon: Icon(
//                 isFavorite ? Icons.favorite : Icons.favorite_border,
//                 color: isFavorite ? Colors.red : null,
//               ),
//               onPressed: () {
//                 setState(() {
//                   if (isFavorite) {
//                     wishlistItems.remove(product.id);
//                   } else {
//                     wishlistItems.add(product.id);
//                   }
//                 });
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class Product {
//   final int id;
//   final String name;
//
//   Product({required this.id, required this.name});
// }
//
// class WishlistPage extends StatelessWidget {
//   final Set<int> wishlistItems;
//   final Function(int) onRemove;
//
//   WishlistPage({required this.wishlistItems, required this.onRemove});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Wishlist'),
//       ),
//       body: ListView.builder(
//         itemCount: wishlistItems.length,
//         itemBuilder: (context, index) {
//           final productId = wishlistItems.elementAt(index);
//
//           return ListTile(
//             title: Text('Product $productId'),
//             trailing: IconButton(
//               icon: Icon(Icons.delete),
//               onPressed: () {
//                 onRemove(productId);
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: WishlistApp(),
//     );
//   }
// }
//
// class WishlistApp extends StatefulWidget {
//   @override
//   _WishlistAppState createState() => _WishlistAppState();
// }
//
// class _WishlistAppState extends State<WishlistApp> {
//   List<Product> products = List.generate(
//     10,
//         (index) => Product(id: index, name: 'Product $index'),
//   );
//
//   List<Product> wishlist = [];
//
//   void toggleWishlist(int productId) {
//     setState(() {
//       Product product = products.firstWhere((p) => p.id == productId);
//       if (wishlist.contains(product)) {
//         wishlist.remove(product);
//       } else {
//         wishlist.add(product);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Wishlist App'),
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           Product product = products[index];
//           return ListTile(
//             title: Text(product.name),
//             trailing: IconButton(
//               icon: wishlist.contains(product)
//                   ? Icon(Icons.favorite, color: Colors.red)
//                   : Icon(Icons.favorite_border),
//               onPressed: () => toggleWishlist(product.id),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => WishlistPage(wishlist)),
//           );
//         },
//         child: Icon(Icons.favorite),
//       ),
//     );
//   }
// }
//
// class Product {
//   final int id;
//   final String name;
//
//   Product({required this.id, required this.name});
// }
//
// class WishlistPage extends StatelessWidget {
//   final List<Product> wishlist;
//
//   WishlistPage(this.wishlist);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Wishlist'),
//       ),
//       body: ListView.builder(
//         itemCount: wishlist.length,
//         itemBuilder: (context, index) {
//           Product product = wishlist[index];
//           return ListTile(
//             title: Text(product.name),
//           );
//         },
//       ),
//     );
//   }
// }