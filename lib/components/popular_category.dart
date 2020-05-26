import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PopularCategory extends StatefulWidget {
  @override
  _PopularCategoryState createState() => _PopularCategoryState();
}

class _PopularCategoryState extends State<PopularCategory> {
  final List<String> imgList = [
    'https://cdn.chaldal.net/_mpimage/fresh-fruits?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D29185&q=low&v=1&m=250&webp=1',
    'https://cdn.chaldal.net/_mpimage/fresh-vegetables?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D23773&q=low&v=1&m=250&webp=1',
    'https://cdn.chaldal.net/_mpimage/local-breakfast?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D27881&q=best&v=1&m=250&webp=1'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Text('Popular Categories',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0, top: 5.0, left: 5.0),
              child: SizedBox(
                width: 65, // specific value
                height: 25,
                child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.all(0.0),
                    child:
                        Text('View All', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/categorise');
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
            children: imgList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: 200.0,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/products',
                              arguments: i);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                'Food & Vegitable',
                                style: TextStyle(fontSize: 16),
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
