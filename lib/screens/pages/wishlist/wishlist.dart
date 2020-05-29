import 'package:eshop/screens/pages/wishlist/brand.dart';
import 'package:eshop/screens/pages/wishlist/category.dart';
import 'package:eshop/screens/pages/wishlist/product.dart';
import 'package:flutter/material.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            // isScrollable: true,
            tabs: [
              Tab(
                text: "Products",
                //icon: Icon(Icons.bookmark),
              ), 
              Tab(
                text: "Categories",
                //icon: Icon(Icons.category),
              ),
              Tab(
                text: "Brands",
                //icon: Icon(Icons.shopping_basket),
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushNamed(context, '/'),
          ),
          title: Text('WishList'),
        ),
        body: TabBarView(
          children: [
            WishlistProduct(),
            WishlistCategory(),
            WishlistBrand(), 
          ],
        ),
      ),
    );
  }
}
