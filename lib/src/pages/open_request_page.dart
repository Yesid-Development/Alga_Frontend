import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OpenRequestPage extends StatefulWidget {
  @override
  _OpenRequestPageState createState() => _OpenRequestPageState();
}

class _OpenRequestPageState extends State<OpenRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitud Desada"),
      ),
      body: _showRequest(),
      floatingActionButton: _buildFloatingButton(),
    );
  }

  Widget _showRequest() {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.7,
      margin: EdgeInsets.only(left: 24, right: 24, top: 60, bottom: 40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 20.0,
            )
          ]),
      child: _titulo(),
    );
  }

  Widget _titulo() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Text("Cancelar el proyecto de GreenApp",
                  style: TextStyle(
                      color: Color.fromRGBO(110, 214, 88, 1),
                      fontSize: 21,
                      fontWeight: FontWeight.bold)),
//Tamaño maximo de caracteres//
              // child: Text("Útil para tus comentarios en Twitter, así como para muchas otras aplicaciones, esta es una calculada", style: TextStyle(color: Color.fromRGBO(110, 214, 88, 1), fontSize: 18,fontWeight: FontWeight.bold)),
            ],
          ),
          Divider(
            height: 25,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[Text("Motivo: "), Text("Opinión")],
          ),
          Divider(
            height: 45,
            indent: 20,
            endIndent: 20,
          ),
          Row(
            children: <Widget>[Text("Fecha Propuesta: "), Text("28/05/2020")],
          ),
          Divider(
            height: 45,
            indent: 40,
            endIndent: 40,
          ),
          Row(
            children: <Widget>[
              Text("Descripción: "),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 320,
                height: 160,
                child: Text(
                    "No se consiguen muchas ganancias y despues de pensarlo con el equipo de trabajo, hemos decidido que la mejor opción es cancelarlo"),
              )
            ],
          )
        ],
      ),
    );
  }

  SpeedDial _buildFloatingButton() {
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
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(FontAwesomeIcons.check),
          backgroundColor: Colors.green,
          label: 'Aceptado',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {
          },
        ),
      ],
    );
  }

}
