import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
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
    );
  }
}

