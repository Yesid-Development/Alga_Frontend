import 'dart:async';

import 'package:alga_frontend/src/db/firebase_db.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class NewContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Contacto'),
      ),
      body: BounceInRight(child: _NewContactForm()),
    );
  }
}

class _NewContactForm extends StatefulWidget {
  @override
  __NewContactFormState createState() => __NewContactFormState();
}

class __NewContactFormState extends State<_NewContactForm> {  

  final _formkey = GlobalKey<FormState>();
  String contacts;

  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _positionController = TextEditingController();
  final _numberController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    _positionController.dispose();
    _numberController.dispose();
    _emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            height: size.height * 0.99,
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
                    Divider(color: Colors.transparent,),
                    _lastnameField(),
                    Divider(color: Colors.transparent),
                    _positionField(),
                    Divider(color: Colors.transparent),
                    _numberField(),
                    Divider(color: Colors.transparent),
                    _emailField(),                    
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


    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: _nameController,
      maxLength: 100,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Nombre'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'El nombre no puedo estar vacio';
        }
      },
    );
  }

  Widget _lastnameField() {


    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: _lastnameController,
      maxLength: 100,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Apellido'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'El apellido no puedo estar vacio';
        }
      },
    );
  }

  Widget _positionField() {


    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: _positionController,
      maxLength: 100,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Cargo'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'El cargo no puedo estar vacio';
        }
      },
    );
  }

  Widget _numberField() {


    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _numberController,
      maxLength: 10,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Número de Teléfono'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'El número de teléfono no puedo estar vacio';
        }
      },
    );
  }

  Widget _emailField() {


    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      maxLength: 100,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Correo'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'El correo no puedo estar vacio';
        }
      },
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
          String name = _nameController.text;
          String lastname = _lastnameController.text;
          String position = _positionController.text;
          String number = _numberController.text;
          String email = _emailController.text;

          createContacts(name, lastname, position, number, email);

          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Nuevo contacto agregada')));

          Timer(Duration(seconds: 2), () => Navigator.pop(context));
        }
      },
    );
  }
}
