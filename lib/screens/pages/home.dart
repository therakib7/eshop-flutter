import 'package:eshop/components/home_slider.dart';
import 'package:eshop/components/main_drawer.dart';
import 'package:eshop/components/popular_category.dart';
import 'package:eshop/components/type_product.dart';
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
          Navigator.pushNamed(context, '/wishlist');
          break;

        case 2:
          Navigator.pushNamed(context, '/cart');
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
                Icons.notifications_none,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/notification');
              }),
          IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              })
        ],
      ),
      drawer: Drawer(child: MainDrawer()),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[ 
          Padding(
            padding: EdgeInsets.only(top: 5, right: 5, bottom: 5, left: 5,),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.search),
                title: Text('What do you want to buy?'),
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
            ),
          ),
          HomeSlider(),
          PopularCategory(),
          TypeProductCom(name: 'offer_product', title: 'Offer Products'),
          TypeProductCom(name: 'new_arrival', title: 'New Arrivals'),
          TypeProductCom(name: 'trending_product', title: 'Trending Products'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text(''),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.add_shopping_cart),
          //   title: Text(''),
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text(''),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
