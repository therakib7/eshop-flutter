import 'package:flutter/material.dart';

class BottomNavbarWidget extends StatefulWidget {
  @override
  _BottomNavbarWidgetState createState() => _BottomNavbarWidgetState();
}

class _BottomNavbarWidgetState extends State<BottomNavbarWidget> {
  @override
  Widget build(BuildContext context) {
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
            Navigator.pushNamed(context, '/chat');
            break;
          default:
        }
      });
    }

    return BottomNavigationBar(
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
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          title: Text(''),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).accentColor,
      unselectedItemColor: Color(0xFF000000),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: _onItemTapped,
    );
  }
}
