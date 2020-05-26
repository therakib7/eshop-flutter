import 'package:eshop/components/home_slider.dart';
import 'package:eshop/components/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<String> iimgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

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
          Padding(
            padding: EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
            child: Text('New Arrivals',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            height: 240.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: iimgList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: 140.0,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/products',
                                arguments: i);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 160,
                                child: Hero(
                                  tag: '$i',
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: i,
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        new Icon(Icons.error),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Two Gold Rings',
                                  style: TextStyle(fontSize: 14),
                                ),
                                subtitle: Text('\$200',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.w700)),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/banner-1.png'),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Text('Shop By Category',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 8.0, left: 8.0),
                child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child:
                        Text('View All', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/categorise');
                    }),
              )
            ],
          ),
           
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
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
