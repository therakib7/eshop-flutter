import 'package:eshop/components/home_slider.dart';
import 'package:eshop/components/main_drawer.dart';
import 'package:eshop/components/new_arrival.dart';
import 'package:eshop/components/trending_product.dart';
import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          Navigator.pushNamed(context, '/');
          break;
        case 1:
          // Navigator.pushNamed(context, '/my-favourite');
          break;

        case 2:
          // Navigator.pushNamed(context, '/cart');
          break;

        case 3:
          // Navigator.pushNamed(context, '/chat');
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              }),
          IconButton(
              icon: Icon(
                Icons.notifications_none,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/notification');
              })
        ],
      ),
      drawer: Drawer(child: MainDrawer()),
      body: ListView(
        children: <Widget>[
          HomeSlider(),
          NewArrival(), 
          TrendingProduct(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('Favorite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Chat'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
