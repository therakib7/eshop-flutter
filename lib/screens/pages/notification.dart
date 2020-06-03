import 'package:eshop/widgets/bottom_navbar_widget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text('You Notifications List'),
      ),
        bottomNavigationBar: BottomNavbarWidget(),
    );
  }
}