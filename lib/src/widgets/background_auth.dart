import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final _background1 = Container(
      height: double.infinity,
    );

    final _background2 = ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: Container(
        height: _size.height * 0.45,
        child: FadeInImage(
          image: AssetImage('assets/img/fondo_login.jpg'),
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/img/fondo_login.jpg'),
        ),
      ),
    );

    final _persona = Container(
      padding: EdgeInsets.only(top: 40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Icon(FontAwesomeIcons.leaf, color: Colors.white, size: 100.0),
            SizedBox(height: 5.0),
            Text('Alga', style: TextStyle(color: Colors.white, fontSize: 30.0))
          ],
        ),
      ),
    );

    return Container(
      child: Stack(
        children: <Widget>[_background1, _background2, _persona],
      ),
    );
  }
}
