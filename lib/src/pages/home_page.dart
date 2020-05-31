import 'package:alga_frontend/src/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  
  final _action = Provider.of<AuthState>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('HomePage'),
              RaisedButton(
                child: Text('Cerrar Sesion'),
                onPressed: () => _action.logout(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
