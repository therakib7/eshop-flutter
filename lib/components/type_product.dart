import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TypeProduct extends StatefulWidget {

  TypeProduct({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TypeProductState createState() => _TypeProductState();
}

class _TypeProductState extends State<TypeProduct> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=403&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=404&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=405&q=80'
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 160,
                              child: Hero(
                                tag: widget.title,
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
      ],
    );
  }
}
