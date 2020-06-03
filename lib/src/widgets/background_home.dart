import 'package:flutter/material.dart';

class BackgroundHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      child: FadeInImage(
        image: AssetImage('assets/img/fondo.webp'),
        fit: BoxFit.cover,
        placeholder: AssetImage('assets/img/fondo.webp'),
      ),
    );
  }
}