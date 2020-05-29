import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class GridProduct extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String costPrice;
  final String salePrice;
  final String avgRating;
  final String totalRating;

  GridProduct({
    Key key,
    @required this.title,
    @required this.imageUrl,
    @required this.costPrice,
    @required this.salePrice,
    this.avgRating,
    this.totalRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            print('Card tapped.');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                // height: 150,
                // width: double.infinity,
                child: CachedNetworkImage(
                  fit: BoxFit.fitWidth,
                  imageUrl: imageUrl,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
                // child: Image.network(
                //   products[index]['image'],
                // ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: ListTile(
                  title: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0, bottom: 1),
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
                                    decoration: TextDecoration.lineThrough)),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SmoothStarRating(
                              isReadOnly: true,
                              starCount: 5,
                              rating: 3.5, //avg rating goes here
                              size: 16.0,
                              color: Colors.amber,
                              borderColor: Colors.amber,
                              spacing: 0.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text('(4)',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context).primaryColor)),
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
      );
  }
}
