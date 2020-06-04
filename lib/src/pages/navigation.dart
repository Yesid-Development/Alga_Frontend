import 'package:alga_frontend/src/pages/home_page.dart';
import 'package:alga_frontend/src/pages/profile_page.dart';
import 'package:alga_frontend/src/widgets/background_home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BackgroundHome(),
        Scaffold(
          backgroundColor: Colors.white12,
          body: _callViews(_page),
          bottomNavigationBar: _customBottomNavigationBar(),
        ),
      ],
    );
  }

  Widget _callViews(int actualView) {
    switch (actualView) {
      case 0:
        return ProfilePage();
        break;
      case 1:
        return HomePage();
        break;
      default:
        return HomePage();
    }
  }

  Widget _customBottomNavigationBar() {
    final _size = 30.0;
    final _color = Colors.white;

    return CurvedNavigationBar(
      index: 1,
      height: 50.0,
      animationDuration: Duration(milliseconds: 400),
      backgroundColor: Colors.transparent,
      color: Colors.white24,
      buttonBackgroundColor: Colors.white24,
      items: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            FontAwesomeIcons.solidUser,
            size: _size,
            color: _color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            FontAwesomeIcons.home,
            size: _size,
            color: _color,
          ),
        ),
      ],
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
    );
  }
}
