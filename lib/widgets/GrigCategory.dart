import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GridCategory extends StatelessWidget {
  final String title;
  final String imageUrl;

  GridCategory({
    Key key,
    @required this.title,
    @required this.imageUrl,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: (MediaQuery.of(context).size.width / 2) - 70,
              width: double.infinity,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: imageUrl,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
            ListTile(
                title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ))
          ],
        ),
      ),
    );
  }
}
