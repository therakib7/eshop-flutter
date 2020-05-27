import 'package:eshop/screens/pages/cart.dart';
import 'package:eshop/screens/pages/home.dart';
import 'package:eshop/screens/pages/notification.dart';
import 'package:eshop/screens/pages/settings/setting.dart';
import 'package:eshop/screens/pages/wishlist.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
        '/wishlist': (context) => WishList(),
        '/cart': (context) => Cart(), 
        '/setting': (context) => Setting(),
        '/notification': (context) => NotificationScreen(),  
      },
    );
  }
}
