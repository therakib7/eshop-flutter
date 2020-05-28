import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.home, color: Theme.of(context).accentColor),
          title: Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading:
              Icon(Icons.shopping_basket, color: Theme.of(context).accentColor),
          title: Text('Shop'),
          trailing: Text('New',
              style: TextStyle(color: Theme.of(context).primaryColor)),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/shop');
          },
        ),
        ListTile(
          leading: Icon(Icons.category, color: Theme.of(context).accentColor),
          title: Text('Categories'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/categorise');
          },
        ),
        ListTile(
          leading: Icon(Icons.favorite, color: Theme.of(context).accentColor),
          title: Text('My Wishlist'),
          trailing: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: Text('4',
                style: TextStyle(color: Colors.white, fontSize: 10.0)),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/wishlist');
          },
        ),
        ListTile(
          leading:
              Icon(Icons.shopping_cart, color: Theme.of(context).accentColor),
          title: Text('My Cart'),
          trailing: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: Text('2',
                style: TextStyle(color: Colors.white, fontSize: 10.0)),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/cart');
          },
        ),
         ListTile(
          leading: Icon(Icons.refresh, color: Theme.of(context).accentColor),
          title: Text('Order History'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/order-history');
          },
        ),
        ListTile(
          leading: Icon(Icons.lock, color: Theme.of(context).accentColor),
          title: Text('Login'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/auth');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.settings, color: Theme.of(context).accentColor),
          title: Text('Settings'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/setting');
          },
        ), 
        ListTile(
          leading:
              Icon(Icons.exit_to_app, color: Theme.of(context).accentColor),
          title: Text('Logout'),
          onTap: () async {
            // await auth.logout();
          },
        )
      ],
    );
  }
}
