import 'package:eshop/widgets/BottomNavBarWidget.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/notification');
            // Navigate back to first screen when tapped.
          },
          child: Text('Go to Notification!'),
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
