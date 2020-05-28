import 'package:eshop/screens/pages/type-product/type_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class TypeProductCom extends StatefulWidget {
  TypeProductCom({Key key, this.title, this.name}) : super(key: key);

  final String title;
  final String name;

  @override
  _TypeProductComState createState() => _TypeProductComState();
}

class _TypeProductComState extends State<TypeProductCom> {
  final List<Map<dynamic, dynamic>> items = [
    {
      'title': 'IPhone',
      'rating': 3.0,
      'image':
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=411&q=80'
    },
    {
      'title': 'IPhone X 2',
      'rating': 3.0,
      'image':
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=412&q=80'
    },
    {
      'title': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=413&q=80'
    },
    {
      'title': 'IPhone 12',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=414&q=80'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
              child: Text(widget.title,
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 9.0, left: 5.0),
              child: SizedBox(
                width: 65, // specific value
                height: 25,
                child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.all(0.0),
                    child:
                        Text('See All', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TypeProductScreen(title: widget.title)),
                      );
                    }),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          height: 240.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: items.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: 200.0,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/product-detail',
                              arguments: item);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 160,
                              child: Hero(
                                tag: UniqueKey().toString(),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: item['image'],
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      new Icon(Icons.error),
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                item['title'],
                                style: TextStyle(fontSize: 16),
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
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontWeight: FontWeight.w700,
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Text('(\$400)',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.grey,
                                                decoration: TextDecoration
                                                    .lineThrough)),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SmoothStarRating(
                                          isReadOnly: true,
                                          starCount: 5,
                                          rating: item['rating'],
                                          size: 16.0,
                                          color: Colors.amber,
                                          borderColor: Colors.amber,
                                          spacing: 0.0),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
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
      ],
    );
  }
}
