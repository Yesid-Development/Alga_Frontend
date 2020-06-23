import 'dart:async';

import 'package:alga_frontend/src/db/firebase_db.dart';
import 'package:alga_frontend/src/models/models.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class EditTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar tarea'),
      ),
      body: BounceInRight(child: _EditTaskForm()),
    );
  }
}

class _EditTaskForm extends StatefulWidget {
  @override
  __EditTaskFormState createState() => __EditTaskFormState();
}

class __EditTaskFormState extends State<_EditTaskForm> {

  final _formkey = GlobalKey<FormState>();
  TasksModels tasks = TasksModels();

  @override
  Widget build(BuildContext context) {
    final TasksModels taskData = ModalRoute.of(context).settings.arguments;
    if (taskData != null) {
      tasks = taskData;
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

    final _titleController = new TextEditingController(text: tasks.title);

    return TextFormField(
      textCapitalization: TextCapitalization.words,
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
      onChanged: (value) => tasks.title = value,
    );
  }

  Widget _calendario() {

    final _dateController = new TextEditingController(text: tasks.date);

    return TextFormField(
      controller: _dateController,
      enableInteractiveSelection: false,
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
      onSaved: (value) => tasks.date = value,
    );
  }

  _selecDate() async {
     await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2025),
            locale: Locale('es', 'ES'))
        .then((value) {
      setState(() {
        DateTime _date = value;
        tasks.date = _date.toString();
      });
    });
  }

  Widget _descripcionField() {

    final _descriptionController = new TextEditingController(text: tasks.description);

    return TextFormField(
      controller: _descriptionController,
      keyboardType: TextInputType.multiline,
      minLines: 5,
      maxLines: null,
      maxLength: 100,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Descripción'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'La descripción no puedo estar vacio';
        }
      },
      onChanged: (value) => tasks.description = value,
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
          String title = tasks.title;
          String date = tasks.date;
          String description = tasks.description;
          String id = tasks.id;

          editTasks(title, date, description, id);

          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Tarea Modificada')));

          Timer(Duration(seconds: 2), () => Navigator.pop(context));
        }
      },
    );
  }
}
