import 'package:eshop/screens/pages/home.dart';
import 'package:eshop/screens/pages/setting.dart';
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
        primaryColor: Colors.deepOrange[500],
        accentColor: Colors.lightBlue[900],
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Lato',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(title: 'Eshop'),
        '/wishlist': (context) => WishList(),
        '/settings': (context) => Setting(),

      },
    );
  }
}
