import 'package:eshop/screens/auth/auth.dart';
import 'package:eshop/screens/pages/cart.dart';
import 'package:eshop/screens/pages/home.dart';
import 'package:eshop/screens/pages/notification.dart';
import 'package:eshop/screens/pages/product_detail.dart';
import 'package:eshop/screens/pages/search.dart';
import 'package:eshop/screens/pages/settings/setting.dart'; 
import 'package:eshop/screens/pages/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:eshop/screens/auth/auth_block.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<AuthBlock>.value(value: AuthBlock())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlue[900],
        accentColor: Colors.lightBlue[900],
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Lato',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(title: 'Eshop'),
        '/auth': (context) => Auth(),  
        '/wishlist': (context) => WishList(),
        '/cart': (context) => Cart(),  
        '/product-detail': (context) => ProductDetail(),  
        '/setting': (context) => Setting(),
        '/notification': (context) => NotificationScreen(),  
        '/search': (context) => SearchScreen(),  
      },
    );
  }
}
