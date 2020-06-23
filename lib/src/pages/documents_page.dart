import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DocumentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documentos'),
      ),
      // drawer: _MenuUsuario(),
      body: _DocumentsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}

class _DocumentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
          // endIndent: 50,
          thickness: 0.9, //grosor de separador
          color: Colors.white24 //color separador
          ),
      itemCount: 3,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          FontAwesomeIcons.filePdf,
          color: Colors.red,
        ), // Icono de archivo
        title: Text('hola, soy un documento'), //Titulo de archivo
        trailing: Icon(Icons.more_vert),
        onTap: () {},
      ),
    );
  }
}
