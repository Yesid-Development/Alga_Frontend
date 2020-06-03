import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white24,
        elevation: 0.0,
        
        // title: Icon(FontAwesomeIcons.leaf),
        title: Text(
          'Bienvenido',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.userAlt),
            color: Colors.white,
            // iconSize: 35.0,
            onPressed: () {
              Navigator.of(context).pushNamed('profile');
            },
          )
        ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
