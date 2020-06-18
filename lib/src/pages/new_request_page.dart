import 'dart:async';

import 'package:alga_frontend/src/db/firebase_db.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class NewRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear tarea'),
      ),
      body: BounceInRight(child: _NewRequestForm()),
    );
  }
}

class _NewRequestForm extends StatefulWidget {
  @override
  __NewRequestFormState createState() => __NewRequestFormState();
}

class __NewRequestFormState extends State<_NewRequestForm> {
  String _fecha = '';

  final _formkey = GlobalKey<FormState>();

  final _dateController = new TextEditingController();
  final _titleController = new TextEditingController();
  final _descriptionController = new TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    _tituloField(),
                    Divider(
                      color: Colors.transparent,
                    ),
                    _calendario(),
                    Divider(color: Colors.transparent),
                    _descripcionField(),
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

  Widget _tituloField() {
    return TextFormField(
      controller: _titleController,
      maxLength: 100,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Titulo'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'El titulo no puedo estar vacio';
        }
      },
    );
  }

  Widget _calendario() {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _dateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Fecha',
        labelText: 'Fecha',
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selecDate();
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'La fecha no puede estar vacio';
        }
      },
    );
  }

  _selecDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _dateController.text = _fecha;
      });
    }
  }

  Widget _descripcionField() {
    return TextFormField(
      controller: _descriptionController,
      keyboardType: TextInputType.multiline,
      minLines: 5,
      maxLines: null,
      maxLength: 500,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Descripción'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'La descripción no puedo estar vacio';
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
          String title = _titleController.text;
          String date = _dateController.text;
          String description = _descriptionController.text;

          createTasks(title, date, description);

          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Nuevo usuario registrado')));

          Timer(Duration(seconds: 2), () => Navigator.pop(context));
        }
      },
    );
  }
}
