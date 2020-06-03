import 'package:flutter/material.dart';
import 'package:alga_frontend/src/auth/auth_state.dart';
import 'package:alga_frontend/src/utils/validators.dart';
import 'package:alga_frontend/src/widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (BuildContext context, AuthState value, Widget child) {
          if (value.isLoading()) {
            return FadeInLeft(
              child: Center(
                  child: SpinKitChasingDots(
                itemBuilder: (_, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  );
                },
                size: 250.0,
              )),
            );
          } else if (value.isValidating()) {
            return Scaffold();
          } else {
            return child;
          }
        },
        child: Stack(
          children: <Widget>[
            Background(),
            BounceInRight(child: _LoginForm()),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  __LoginFormState createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _validator = Validators();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

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
            width: _size.width * 0.85,
            height: _size.height * 0.83,
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
                Text('Ingreso', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 50.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _createEmail(),
                      SizedBox(height: 30.0),
                      _createPassword(),
                      SizedBox(height: 30.0),
                    ],
                  ),
                ),
                // Boton de login
                _loginButton(),
                // Login de google
                _googleLogin(),
                // Boton de registro
                _RegisterButton(),
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
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(30))),
            icon: Icon(Icons.alternate_email, color: Colors.green[700]),
            labelText: 'Correo electrónico',
          ),
          autovalidate: false,
          autocorrect: false,
          validator: (text) {
            return _validator.toValidateEmail(text);
          }),
    );
  }

  Widget _createPassword() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 30.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(30),
          )),
          icon: Icon(Icons.lock_outline, color: Colors.green[700]),
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

  Widget _loginButton() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text('Ingresar'),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
        // bottomLeft: Radius.circular(50),
      )),
      elevation: 0.0,
      color: Colors.green[700],
      textColor: Colors.white,
      onPressed: _submit,
    );
  }

  Widget _googleLogin() {
    final _action = Provider.of<AuthState>(context);

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: SignInButton(Buttons.Google, onPressed: () {
        _action.googleLogin();

        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Ingresando')));
      }),
    );
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Ingresando')));
    }
  }
}

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '¿No tienes cuenta?',
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          FlatButton(
            child: Text(
              'Registrate',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'register');
            },
          ),
        ],
      ),
    );
  }
}
