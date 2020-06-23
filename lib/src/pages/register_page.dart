import 'dart:async';

import 'package:alga_frontend/src/auth/auth_state.dart';
import 'package:alga_frontend/src/utils/validators.dart';
import 'package:alga_frontend/src/widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          BounceInRight(child: _RegisterForm()),
        ],
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  @override
  __RegisterFormState createState() => __RegisterFormState();
}

class __RegisterFormState extends State<_RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _validator = Validators();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 160.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            height: size.height * 0.85,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(1.0, 5.0),
                      spreadRadius: 3)
                ]),
            child: Column(
              children: <Widget>[
                Text('Registro', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 50.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      _createEmail(),
                      SizedBox(height: 30.0),
                      _createPassword(),
                      SizedBox(height: 30.0),
                    ],
                  ),
                ),
                _registerButton(),
                _LoginButton()
              ],
            ),
          ),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _createEmail() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 30.0),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(30))),
          icon: Icon(Icons.alternate_email, color: Theme.of(context).primaryColor),
          labelText: 'Correo electrónico',
        ),
        autovalidate: false,
        autocorrect: false,
        validator: (text) {
          return _validator.toValidateEmail(text);
        },
      ),
    );
  }

  Widget _createPassword() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 30.0),
      child: TextFormField(
        controller: _passwordController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(30),
          )),
          icon: Icon(Icons.lock_outline, color: Theme.of(context).primaryColor),
          labelText: 'Contraseña',
        ),
        obscureText: true,
        autovalidate: false,
        autocorrect: false,
        validator: (text) {
          return _validator.toValidatePassword(text);
        },
      ),
    );
  }

  Widget _registerButton() {
    final _action = Provider.of<AuthState>(context);

    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 75.0, vertical: 15.0),
        child: Text('Registrarse'),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
        // bottomLeft: Radius.circular(50),
      )),
      elevation: 0.0,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: () {
        final isValid = _formKey.currentState.validate();
        if (isValid) {
          String email = _emailController.text;
          String password = _passwordController.text;

          _action.singUpWithEmailAndPassword(email, password);

          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Nuevo usuario registrado')));

          Timer(Duration(seconds: 2), () => Navigator.pushReplacementNamed(context, 'login'));
        }
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '¿Ya tienes cuenta?',
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          FlatButton(
            child: Text(
              'Ingresa',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}
