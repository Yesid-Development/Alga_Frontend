import 'dart:async';

import 'package:alga_frontend/src/db/firebase_db.dart';
import 'package:alga_frontend/src/models/models.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class EditContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Contacto'),
      ),
      body: BounceInRight(child: _EditContactsForm()),
    );
  }
}

class _EditContactsForm extends StatefulWidget {
  @override
  __EditContactsFormState createState() => __EditContactsFormState();
}

class __EditContactsFormState extends State<_EditContactsForm> {

  final _formkey = GlobalKey<FormState>();
  ContactsModels contacts = ContactsModels();

  @override
  Widget build(BuildContext context) {
    final ContactsModels contactData = ModalRoute.of(context).settings.arguments;
    if (contactData != null) {
      contacts = contactData;
    }

    final size = MediaQuery.of(context).size;

    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Container(
          height: size.height * 0.82,
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

    final _nameController = new TextEditingController(text: contacts.name);

    return TextFormField(
      textCapitalization: TextCapitalization.words,
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
      onChanged: (value) => contacts.name = value,
    );
  }

  Widget _lastnameField() {

    final _lastnameController = new TextEditingController(text: contacts.lastname);



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
      onChanged: (value) => contacts.lastname = value,
    );
  }

  Widget _positionField() {

    final _positionController = new TextEditingController(text: contacts.position);


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
      onChanged: (value) => contacts.position = value,
    );
  }

  Widget _numberField() {

    final _numberController = new TextEditingController(text: contacts.number);

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
      onChanged: (value) => contacts.number = value,
    );
  }

  Widget _emailField() {

    final _emailController = new TextEditingController(text: contacts.email);

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
      onChanged: (value) => contacts.email = value,
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
          String name = contacts.name;
          String lastname = contacts.lastname;
          String position = contacts.position;
          String number = contacts.number;
          String email = contacts.email;
          String id = contacts.id;

          editContacts(name, lastname, position, number, email, id);

          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Contacto Modificada')));

          Timer(Duration(seconds: 2), () => Navigator.pop(context));
        }
      },
    );
  }
}
