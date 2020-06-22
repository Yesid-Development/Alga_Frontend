import 'package:alga_frontend/src/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:alga_frontend/src/widgets/widgets.dart';
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

    return  Stack(
        children: <Widget>[
          BackgroundHome(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[_buildHeader(screenHeight), _circleButtons()],
              ),
            ),
            floatingActionButton: _buildFloatingButton(),
          ),
        ],
    );
  }

  //========== Body ==========\\
  SliverToBoxAdapter _buildHeader(double screenHeight) {

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Bienvenido',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(height: screenHeight * 0.04),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _circleButtons() {
    return SliverToBoxAdapter(
      child: Table(
        children: [
          TableRow(children: [
            _createCircleButton(
              Colors.white,
              FontAwesomeIcons.solidFolderOpen,
              'Documentos',
              'documents'
            ),
            _createCircleButton(
              Colors.white,
              FontAwesomeIcons.calendarAlt,
              'Reuniones',
              'meetings'
            ),
          ]),
          TableRow(children: [
            _createCircleButton(
              Colors.white,
              FontAwesomeIcons.tasks,
              'Tareas',
              'tasks'
            ),
            _createCircleButton(
              Colors.white,
              FontAwesomeIcons.addressBook,
              'Contactos',
              'contacts'
            ),
          ]),
        ],
      ),
    );
  }

  Widget _createCircleButton(Color color, IconData icon, String text, String route) {
    return Container(
      height: 180.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.white24,
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              offset: Offset(1.0, 5.0),
              spreadRadius: 3)
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        splashColor: Colors.deepPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: color,
              radius: 35,
              child: Icon(
                icon,
                size: 40.0,
                color: Colors.blue,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: color,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
              ),
            )
          ],
        ),
        onTap: ()=> {
          Navigator.of(context).pushNamed(route)
        },
      ),
    );
  }

  SpeedDial _buildFloatingButton() {
    final state = Provider.of<AuthState>(context);

    return SpeedDial(
      marginRight: 5,
      marginBottom: 10,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      backgroundColor: Colors.white24,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(FontAwesomeIcons.signOutAlt),
          backgroundColor: Colors.red,
          label: 'Salir',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => state.logout(),
        ),
      ],
    );
  }
}