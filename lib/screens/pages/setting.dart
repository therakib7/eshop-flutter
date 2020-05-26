import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(
                Icons.edit,
                color: Theme.of(context).accentColor,
                size: 28,
              ),
              title: Text('Profile',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Theme.of(context).accentColor),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.notifications,
                color: Theme.of(context).accentColor,
                size: 28,
              ),
              title: Text('Notifications',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Theme.of(context).accentColor),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.panorama,
                color: Theme.of(context).accentColor,
                size: 28,
              ),
              title: Text('Progress',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Theme.of(context).accentColor),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                color: Theme.of(context).accentColor,
                size: 28,
              ),
              title: Text('Favorite',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Theme.of(context).accentColor),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.feedback,
                color: Theme.of(context).accentColor,
                size: 28,
              ),
              title: Text('Feedback',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Theme.of(context).accentColor),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.add_photo_alternate,
                color: Theme.of(context).accentColor,
                size: 28,
              ),
              title: Text('About Us',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Theme.of(context).accentColor),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.vpn_key,
                color: Theme.of(context).accentColor,
                size: 28,
              ),
              title: Text('Change Password',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Theme.of(context).accentColor),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.lock,
                color: Theme.of(context).accentColor,
                size: 28,
              ),
              title: Text('Logout',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Theme.of(context).accentColor),
            ),
          ),
        ],
      ),
    );
  }
}
