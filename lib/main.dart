import 'package:eshop/screens/auth/auth.dart';
import 'package:eshop/screens/chat/chat.dart';
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
import 'package:eshop/graphql/conf.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:google_fonts/google_fonts.dart';

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
    return GraphQLProvider(
      client: GraphQLConfig().client,
      child: CacheProvider(
        child: MaterialApp(
          title: 'Eshop',
          debugShowCheckedModeBanner: true,
          theme: ThemeData(
            primaryColor: Colors.lightBlue[900],
            accentColor: Colors.lightBlue[900],
            primarySwatch: Colors.lightBlue,
            // fontFamily: 'Lato',
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
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
            '/chat': (context) => ChatScreen(),
          },
        ),
      ),
    );
  }
}
