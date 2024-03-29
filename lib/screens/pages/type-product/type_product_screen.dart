import 'package:eshop/components/search_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:eshop/widgets/bottom_navbar_widget.dart';
 
class TypeProductScreen extends StatefulWidget {
  TypeProductScreen({Key key, this.type }) : super(key: key);

  final String type;

  @override
  _TypeProductScreenState createState() => _TypeProductScreenState();
}

class _TypeProductScreenState extends State<TypeProductScreen> {

  final List<Map<dynamic, dynamic>> products = [
    {
      'name': 'IPhone',
      'rating': 3.0,
      'image':
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'
    },
    {
      'name': 'IPhone X 2',
      'rating': 3.0,
      'image':
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    }, 
  ];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          actions: <Widget>[ 
            Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => Scaffold.of(context).openEndDrawer(), 
                  ),
            ),
          ],
          title: Text('Title'),
        ), 
        endDrawer: Drawer(child: SearchDrawer()),
        body: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2, 
          padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
          children: List.generate(products.length, (index) {
            return Container(
              child: Card( 
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    print('Card tapped.');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 110,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          fit: BoxFit.fitWidth,
                          imageUrl: products[index]
                              ['image'],
                          placeholder: (context, url) => Center(
                              child:
                                  CircularProgressIndicator()),
                          errorWidget:
                              (context, url, error) =>
                                  new Icon(Icons.error),
                        ),
                        // child: Image.network(
                        //   products[index]['image'],
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: ListTile(
                          title: Text(
                            'Two Gold Rings',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0, bottom: 1),
                                    child: Text('\$200',
                                        style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6.0),
                                    child: Text('(\$400)',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough)),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SmoothStarRating(
                                      isReadOnly: true,
                                      starCount: 5,
                                      rating: products[index]['rating'],
                                      size: 16.0,
                                      color: Colors.amber,
                                      borderColor: Colors.amber,
                                      spacing: 0.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6.0),
                                    child: Text('(4)',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Theme.of(context)
                                                .primaryColor)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
       bottomNavigationBar: BottomNavbarWidget(),
    );
  }
}
