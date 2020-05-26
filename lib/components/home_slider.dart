import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

final List<String> imgList = [
  'https://evaly.com.bd/static/images/express_b.png',
  'https://evaly.com.bd/static/images/express_f.png',
  'https://evaly.com.bd/static/images/express_p.png'
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        // width: MediaQuery.of(context).size.width,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: 1300,
          imageUrl: item,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => new Icon(Icons.error),
        ),
      ),
    )
    .toList();

class HomeSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeSliderState();
  }
}

class _HomeSliderState extends State<HomeSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: false,
            // aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.map((url) {
          int index = imgList.indexOf(url);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index
                  ? Color.fromRGBO(0, 0, 0, 0.9)
                  : Color.fromRGBO(0, 0, 0, 0.4),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
