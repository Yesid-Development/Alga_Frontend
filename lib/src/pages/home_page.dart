import 'package:alga_frontend/src/auth/auth_state.dart';
import 'package:alga_frontend/src/widgets/background_home.dart';
import 'package:alga_frontend/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        BackgroundHome(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(),
          body: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: <Widget>[
              _buildHeader(screenHeight),
            ],
          ),
          floatingActionButton: _myFloatingButton(),
        ),
      ],
    );
  }

  // Body
  SliverToBoxAdapter _buildHeader(double screenHeigjt) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Yesid Rodelo',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    );
  }

  Widget _myFloatingButton() {
    final _action = Provider.of<AuthState>(context);

    return SpeedDial(
      marginRight: 18,
      marginBottom: 20,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(FontAwesomeIcons.cog),
          backgroundColor: Colors.blue,
          label: 'Config',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => {Navigator.pushNamed(context, 'settings')},
        ),
        SpeedDialChild(
          child: Icon(FontAwesomeIcons.powerOff),
          backgroundColor: Colors.red,
          label: 'Salir',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => {_action.logout()},
        ),
      ],
    );
  }
}
