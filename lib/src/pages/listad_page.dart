import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ListasDPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
        appBar: AppBar(
        title:  Text('Documentos'),
        backgroundColor: Colors.lightGreen,
        ),
        // drawer: _MenuUsuario(),
        body: _ListaDocs(),
   ),
    );
  }
}

class _ListaDocs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
      onPressed: null, 
      backgroundColor: Colors.lightGreen,
      child: Icon
      (Icons.add),
      ),
         
         
          body: Center(
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
        separatorBuilder: (context, i)=> Divider(
          // endIndent: 50,
          thickness: 0.9, //grosor de separador
          color: Colors.white24 //color separador
        ),
        itemCount: 10,
        itemBuilder: (context, i)=> ListTile(
          leading: FaIcon(FontAwesomeIcons.fileWord, color: Colors.blue,), // Icono de archivo
          title: Text('hola, soy un documento'),  //Titulo de archivo
          trailing: Icon(Icons.more_vert),
          onTap: (){           
          },
        ),
        ),
      ),
    );
  }
}