import 'package:eshop/screens/pages/type-product/type_product.dart'; 
import 'package:flutter/material.dart';

class TypeProductScreen extends StatefulWidget {
  TypeProductScreen({Key key, this.title}) : super(key: key);

  final String title; 

  @override
  _TypeProductScreenState createState() => _TypeProductScreenState();
}

class _TypeProductScreenState extends State<TypeProductScreen> {
  @override
  Widget build(BuildContext context) { 
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: "Price (Low->High)",
                //icon: Icon(Icons.bookmark),
              ), 
              Tab(
                text: "Price (High->Low)",
                //icon: Icon(Icons.category),
              ),
              Tab(
                text: "Top Rated",
                //icon: Icon(Icons.shopping_basket),
              ), 
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushNamed(context, '/'),
          ),
          title: Text( widget.title ),
        ),
        body: TabBarView(
          children: [
            TypeProduct(), 
            TypeProduct(), 
            TypeProduct(),  
          ],
        ),
      ),
    );
  }
}
