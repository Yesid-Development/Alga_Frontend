import 'package:flutter/material.dart';
import 'package:alga_frontend/src/pages/new_request_page.dart';
import 'package:alga_frontend/src/pages/open_request_page.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

final solicitudes = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis'];

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tareas'), backgroundColor: Colors.blue,),
      body: ListView(
        children: _buildList(),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  List<Widget> _buildList() {
    return solicitudes.map(
      (item) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(item),
              trailing: Icon(
                Icons.arrow_forward_ios,
// La idea es que se ponga el color segun el estado de la solicitud, Verde aceptado, Oro en espera y Rojo negado
                // color: Color(0xff32a05f),
                // color: Color.fromRGBO(255, 191, 0, 1)
                // color: Colors.red
              ),
              onTap: () {
                final route =
                    MaterialPageRoute(builder: (context) => OpenRequestPage());
                Navigator.push(context, route);

                // Navigator.pushReplacementNamed(context, 'newR');
              },
            ),
            Divider(),
          ],
        );
      },
    ).toList();
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.add, size: 35, color: Colors.blue),
        onPressed: () {
          final route =
              MaterialPageRoute(builder: (context) => NewRequestPage());
          Navigator.push(context, route);
        });
  }
}