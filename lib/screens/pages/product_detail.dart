import 'package:eshop/components/slider.dart';
import 'package:eshop/widgets/bottom_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

final List<String> imgList = [
  'https://evaly.com.bd/static/images/express_b.png',
  'https://evaly.com.bd/static/images/express_f.png',
  'https://evaly.com.bd/static/images/express_p.png'
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        child: CachedNetworkImage(
          fit: BoxFit.fitWidth,
          imageUrl: item,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => new Icon(Icons.error),
        ),
      ),
    )
    .toList();

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      bottomNavigationBar: BottomNavbarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GallerySlider(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment(-1.0, -1.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        'Product Title Name',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text(
                                '\$90',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text('\$190',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    decoration: TextDecoration.lineThrough)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SmoothStarRating(
                                isReadOnly: true,
                                starCount: 5,
                                rating: 4.0,
                                size: 20.0,
                                color: Colors.amber,
                                borderColor: Colors.amber,
                                spacing: 0.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text('(20)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Card(
                  child: ExpansionTile(
                    title: Text('Description'),
                    children: <Widget>[
                      Container(
                          alignment: Alignment(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 0, right: 15.0, bottom: 15.0, left: 15.0),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. but also the leap into electronic typesetting Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ))
                    ],
                  ),
                ),
                Card(
                  child: ExpansionTile(
                    title: Text('Reviews'),
                    children: <Widget>[
                      Container(
                          alignment: Alignment(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 0, right: 15.0, bottom: 15.0, left: 15.0),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. but also the leap into electronic typesetting Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ))
                    ],
                  ),
                ),
                Card(
                  child: ExpansionTile(
                    title: Text('FAQ'),
                    children: <Widget>[
                      Container(
                          alignment: Alignment(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 0, right: 15.0, bottom: 15.0, left: 15.0),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. but also the leap into electronic typesetting Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ))
                    ],
                  ),
                ),
                Card(
                  child: ExpansionTile(
                    title: Text('Package'),
                    children: <Widget>[
                      Container(
                          alignment: Alignment(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 0, right: 15.0, bottom: 15.0, left: 15.0),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. but also the leap into electronic typesetting Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ))
                    ],
                  ),
                ),
                Card(
                  child: ExpansionTile(
                    title: Text('Term & Condition'),
                    children: <Widget>[
                      Container(
                          alignment: Alignment(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 0, right: 15.0, bottom: 15.0, left: 15.0),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. but also the leap into electronic typesetting Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
