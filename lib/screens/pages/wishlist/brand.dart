import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

class WishlistBrand extends StatefulWidget {
  @override
  _WishlistBrandState createState() => _WishlistBrandState();
}

class _WishlistBrandState extends State<WishlistBrand> {
  final List<Map<dynamic, dynamic>> items = [
    {
      'name': 'Cloth',
      'rating': 3.0,
      'image':
          'https://cdn.chaldal.net/_mpimage/fresh-fruits?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D29185&q=low&v=1&m=250&webp=1'
    },
    {
      'name': 'Vagitable',
      'rating': 3.0,
      'image':
          'https://cdn.chaldal.net/_mpimage/fresh-vegetables?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D23773&q=low&v=1&m=250&webp=1'
    },
    {
      'name': 'Mobile',
      'rating': 4.0,
      'image':
          'https://cdn.chaldal.net/_mpimage/local-breakfast?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D27881&q=best&v=1&m=250&webp=1'
    },
    {
      'name': 'Computer',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=414&q=80'
    },
    {
      'name': 'Cloth',
      'rating': 3.0,
      'image':
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=411&q=80'
    },
    {
      'name': 'Vagitable',
      'rating': 3.0,
      'image':
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=412&q=80'
    },
    {
      'name': 'Mobile',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=413&q=80'
    },
    {
      'name': 'Computer',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=414&q=80'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
      children: List.generate(8, (index) {
        return Container(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                print('Card tapped.');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox( 
                    height: (MediaQuery.of(context).size.width / 2) - 70,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: items[index]['image'],
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                    ),
                  ),
                  ListTile(
                      title: Text(
                    'Two Gold Rings',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
