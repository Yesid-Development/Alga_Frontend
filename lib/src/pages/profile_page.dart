import 'package:alga_frontend/src/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileModel = ProfileModels();
  final _dbRef = Firestore.instance;
  SharedPreferences _prefs;

  String _id;
  String _name;
  String _lastName;
  String _direction;
  String _email;
  String _emailEmp;
  String _phone;

  bool loading = true;

  _ProfilePageState() {
    getProfile();
  }

  void getProfile() async {
    await _dbRef
        .collection('profile')
        .document('DVNLLssLfyoHM2THgL6b')
        .get()
        .then(
      (DocumentSnapshot document) {
        _profileModel.id = document.documentID;
        _profileModel.name = document['name'].toString();
        _profileModel.lastname = document['lastname'].toString();
        _profileModel.direction = document['direction'].toString();
        _profileModel.email = document['email'].toString();
        _profileModel.emailEmp = document['emailEmp'].toString();
        _profileModel.phone = document['phone'].toString();

        _id = _profileModel.id;
        _name = _profileModel.name;
        _lastName = _profileModel.lastname;
        _direction = _profileModel.direction;
        _email = _profileModel.email;
        _emailEmp = _profileModel.emailEmp;
        _phone = _profileModel.phone;
      },
    );
  }

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('Correo Emp.', style: _styleText),
              Text('Correo@gmail.com', style: TextStyle(fontSize: 16))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('Dirección Emp.', style: _styleText),
              Text('Correo@gmail.com', style: TextStyle(fontSize: 16))
            ],
          ),
        ],
      ),
    );
  }

  Widget _personalData(Size size) {
    getProfile();
    final _textColor = Colors.white;

    return Container(
      margin: EdgeInsets.only(top: 340, left: 10, right: 10, bottom: 20.0),
      height: size.height * 0.7,
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
                      title: Text(
                        'Nombre',
                        style: TextStyle(color: _textColor),
                      ),
                      subtitle: Text(_name != null ? _name : 'cargando...',
                          style: TextStyle(color: _textColor)),
                      leading: Icon(Icons.account_box, color: _textColor)),
                  ListTile(
                      title:
                          Text('Apellido', style: TextStyle(color: _textColor)),
                      subtitle: Text(
                          _lastName != null ? _lastName : 'cargando...',
                          style: TextStyle(color: _textColor)),
                      leading: Icon(Icons.portrait, color: _textColor)),
                  ListTile(
                      title: Text('Dirección',
                          style: TextStyle(color: _textColor)),
                      subtitle: Text(
                          _direction != null ? _direction : 'cargando...',
                          style: TextStyle(color: _textColor)),
                      leading: Icon(Icons.place, color: _textColor)),
                  ListTile(
                      title:
                          Text('Teléfono', style: TextStyle(color: _textColor)),
                      subtitle: Text(_phone != null ? _phone : 'cargando...',
                          style: TextStyle(color: _textColor)),
                      leading: Icon(Icons.add_call, color: _textColor)),
                  ListTile(
                      title:
                          Text('Correo', style: TextStyle(color: _textColor)),
                      subtitle: Text(_email != null ? _email : 'cargando...',
                          style: TextStyle(color: _textColor)),
                      leading: Icon(Icons.alternate_email, color: _textColor)),
                ],
              ),
            ),
          ],
        ),
      ),
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
          child: Icon(FontAwesomeIcons.paintBrush, color: Colors.white),
          backgroundColor: Colors.lightBlueAccent,
          label: 'Editar',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => {
            Navigator.of(context)
                .pushNamed('editProfile', arguments: _profileModel)
          },
        ),
      ],
    );
  }
}
