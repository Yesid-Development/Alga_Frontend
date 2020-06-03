import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Settings Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.arrowLeft),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
