import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    final background = Container(
      // height: size.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xffa3bd31),
        Color(0xff196F3D),
      ])),
    );

    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          gradient: LinearGradient(colors: [
            Color(0xff58D68D),
            Color(0xff196F3D),
          ])),
    );

    final persona = Container(
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
      // height: size.height * 0.5,
      child: Stack(
        children: <Widget>[
          background,
          Positioned(top: 50.0, left: 30.0, child: circle),
          Positioned(top: 200.0, left: 20.0, child: circle),
          Positioned(bottom: -20.0, left: 30.0, child: circle),
          Positioned(top: -30.0, right: -30.0, child: circle),
          Positioned(top: 120.0, right: 10.0, child: circle),
          Positioned(bottom: 70.0, right: 50.0, child: circle),
          Positioned(bottom: -30.0, right: -30.0, child: circle),
          persona
        ],
      ),
    );
  }
}
