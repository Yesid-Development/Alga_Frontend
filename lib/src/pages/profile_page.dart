import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffededec),
      body: SingleChildScrollView(
        child: _myBody(context),
      ),
      floatingActionButton: _myFloatingButton(),
    );
  }

  Stack _myBody(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final _background = ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70)),
      child: Container(
        height: size.height * 0.52,
        width: double.infinity,
        child: FadeInImage(
          image: NetworkImage(
              'https://image.freepik.com/foto-gratis/fondo-hojas-verdes-tropicales_53876-88891.jpg'),
          placeholder: AssetImage('assets/gifs/other_loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );

    // Caja Transparente superior
    final _whiteBox = Container(
      margin: EdgeInsets.only(top: 110, left: 5, right: 5),
      height: size.height * 0.31,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(90),
              bottomLeft: Radius.circular(90),
              bottomRight: Radius.circular(30)),
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 20.0,
            )
          ]),
    );

    //foto de perfil
    final _photoProfile = SafeArea(
        child: Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 17),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                      offset: Offset(1.0, 1.0))
                ]),
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              backgroundImage: NetworkImage(
                  'https://image.freepik.com/foto-gratis/retrato-hombre-blanco-aislado_53876-40306.jpg'),
              radius: 60,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Andres Bustamante',
            style: TextStyle(
                color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text('Líder', style: TextStyle(fontSize: 18))
        ],
      ),
    ));

    return Stack(
      children: <Widget>[
        _background,
        _whiteBox,
        _photoProfile,
        _empresarialData(size),
        _personalData(size)
      ],
    );
  }

  Container _empresarialData(Size size) {
    final _styleText = TextStyle(
        color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold);

    return Container(
      height: size.height * 0.41,
      margin: EdgeInsets.only(left: 15, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 15)),
              Text('Sede', style: _styleText),
              Text('Medellín', style: TextStyle(fontSize: 16))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(90, 15, 90, 15)),
              Text('Correo', style: _styleText),
              Text('Correo@gmail.com', style: TextStyle(fontSize: 16))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(40, 15, 40, 15)),
              Text('Estado', style: _styleText),
              Text('Presencial', style: TextStyle(fontSize: 16))
            ],
          )
        ],
      ),
    );
  }

  Column _personalData(Size size) {
    final _textColor = Colors.white;


    final datos = Container(
      margin: EdgeInsets.only(top: 340, left: 10, right: 10),
      height: size.height * 0.91,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 20.0,
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(80),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              child: FadeInImage(
                image: NetworkImage(
                    'https://image.freepik.com/foto-gratis/fondo-hojas-verdes-tropicales_53876-88891.jpg'),
                placeholder: AssetImage('assets/gifs/loading.gif'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(color: Colors.white12, boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 20.0,
                ),
              ]),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Datos Personales',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    title: Text('Nombre', style: TextStyle(color: _textColor),),
                    subtitle: Text('Andres', style: TextStyle(color: _textColor)),
                    leading: Icon(Icons.account_box, color: _textColor)
                  ),
                  ListTile(
                    title: Text('Apellido', style: TextStyle(color: _textColor)),
                    subtitle: Text('Bustamante Castro', style: TextStyle(color: _textColor)),
                    leading: Icon(Icons.portrait, color: _textColor)
                  ),
                  ListTile(
                    title: Text('Dirección', style: TextStyle(color: _textColor)),
                    subtitle: Text('Calle 14 #52-64', style: TextStyle(color: _textColor)),
                    leading: Icon(Icons.place, color: _textColor)
                  ),
                  ListTile(
                    title: Text('Teléfono', style: TextStyle(color: _textColor)),
                    subtitle: Text('31617382014', style: TextStyle(color: _textColor)),
                    leading: Icon(Icons.add_call, color: _textColor)
                  ),
                  ListTile(
                    title: Text('Correo', style: TextStyle(color: _textColor)),
                    subtitle: Text('Ejemplo@gmail.com', style: TextStyle(color: _textColor)),
                    leading: Icon(Icons.alternate_email, color: _textColor)
                  ),
                  ListTile(
                    title: Text('Fecha de Ingreso', style: TextStyle(color: _textColor)),
                    subtitle: Text('06:00 A.m.', style: TextStyle(color: _textColor)),
                    leading: Icon(Icons.access_alarm, color: _textColor)
                  ),
                  ListTile(
                    title: Text('Fecha de Salida', style: TextStyle(color: _textColor)),
                    subtitle: Text('04:00 P.m.', style: TextStyle(color: _textColor)),
                    leading: Icon(Icons.access_alarm, color: _textColor)
                  ), // leading: Icon(Ic
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Column(
      children: <Widget>[datos, SizedBox(height: 10)],
    );
  }

  SpeedDial _myFloatingButton() {
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
          child: Icon(FontAwesomeIcons.paintBrush),
          backgroundColor: Colors.lightBlueAccent,
          label: 'Editar',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => {
            Navigator.of(context).pushNamed('edit')
          },
        ),
      ],
    );
  }
}
