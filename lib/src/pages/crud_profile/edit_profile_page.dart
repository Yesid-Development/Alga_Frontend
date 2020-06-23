import 'dart:async';

import 'package:alga_frontend/src/db/firebase_db.dart';
import 'package:alga_frontend/src/models/models.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar perfil'),
      ),
      body: BounceInRight(child: _EditProfileForm()),
    );
  }
}

class _EditProfileForm extends StatefulWidget {
  @override
  __EditProfileFormtate createState() => __EditProfileFormtate();
}

class __EditProfileFormtate extends State<_EditProfileForm> {

  final _formkey = GlobalKey<FormState>();
  ProfileModels profile = ProfileModels();

  @override
  Widget build(BuildContext context) {
    final ProfileModels profileData = ModalRoute.of(context).settings.arguments;
    if (profileData != null) {
      profile = profileData;
    }

    final size = MediaQuery.of(context).size;

    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Container(
          height: size.height * 0.86,
          margin: EdgeInsets.all(24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 20.0,
                )
              ]),
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  _nameField(),
                  Divider(color: Colors.transparent),
                  _lastnameField(),
                  Divider(color: Colors.transparent),
                  _directionField(),
                  Divider(color: Colors.transparent),
                  _phoneField(),
                  Divider(color: Colors.transparent),
                  _emailField(),
                  Divider(color: Colors.transparent),
                  _emailEmpField(),
                  SizedBox(height: 39),
                  _btnAccept()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _nameField() {

    final _nameController = new TextEditingController(text: profile.name);

    return TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: _nameController,
      maxLength: 50,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Nombre'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'El nombre no puedo estar vacio';
        }
      },
      onChanged: (value) => profile.name = value,
    );
  }

  Widget _lastnameField() {

    final _lastnameController = new TextEditingController(text: profile.lastname);

    return TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: _lastnameController,
      maxLength: 50,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Apellido'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'El apellido no puedo estar vacio';
        }
      },
      onChanged: (value) => profile.lastname = value,
    );
  }

  Widget _directionField() {

    final _directionController = new TextEditingController(text: profile.direction);

    return TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: _directionController,
      maxLength: 50,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Dirección'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'La dirección no puedo estar vacio';
        }
      },
      onChanged: (value) => profile.direction = value,
    );
  }

  Widget _phoneField() {

    final _phoneController = new TextEditingController(text: profile.phone);

    return TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: _phoneController,
      maxLength: 20,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Teléfono'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'El teléfono no puedo estar vacio';
        }
      },
      onChanged: (value) => profile.phone = value,
    );
  }

  Widget _emailField() {

    final _emailController = new TextEditingController(text: profile.email);

    return TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: _emailController,
      maxLength: 50,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Correo'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'El Correo no puedo estar vacio';
        }
      },
      onChanged: (value) => profile.email = value,
    );
  }

  Widget _emailEmpField() {

    final _emailEmpController = new TextEditingController(text: profile.emailEmp);

    return TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: _emailEmpController,
      maxLength: 50,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Correo Empresarial'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'El Correo Empresarial no puedo estar vacio';
        }
      },
      onChanged: (value) => profile.emailEmp = value,
    );
  }

  

  Widget _btnAccept() {
    return RaisedButton(
      shape: StadiumBorder(
        side: BorderSide(color: Colors.transparent, width: 1),
      ),
      child: Text('Confirmar',
          style: TextStyle(color: Color(0xff32a05f), fontSize: 16)),
      onPressed: () {
        final isValid = _formkey.currentState.validate();
        if (isValid) {
          String name = profile.name;
          String lastname = profile.lastname;
          String direction = profile.direction;
          String phone = profile.phone;
          String email = profile.email;
          String emailEmp = profile.emailEmp;
          String id = profile.id;


          editProfile( name, lastname, direction, phone, email, emailEmp, id);

          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Tarea Modificada')));

          Timer(Duration(seconds: 2), () => Navigator.pop(context));
        }
      },
    );
  }
}
