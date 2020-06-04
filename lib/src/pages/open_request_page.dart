import 'package:flutter/material.dart';

class OpenRequestPage extends StatefulWidget {
  @override
  _OpenRequestPageState createState() => _OpenRequestPageState();
}

class _OpenRequestPageState extends State<OpenRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitud Desada"),
      ),
       floatingActionButton: FloatingActionButton(
// La idea es que se ponga el color segun el estado de la solicitud, Verde aceptado, Oro en espera y Rojo negado
        // backgroundColor: Color(0xff32a05f),
        // child: Icon(Icons.check, size: 35, color:  Colors.white)
        // backgroundColor: Color.fromRGBO(255, 191, 0, 1),
        // child: Icon(Icons.access_time, size: 35, color:  Colors.white)
        backgroundColor: Colors.red,
        child: Icon(Icons.close, size: 35, color:  Colors.white),
        onPressed: (){},
      ),
      body: Stack(
        children: <Widget>[
          _fondo(),
        ],
      ),
    );
  }

   Widget _fondo(){
    final size = MediaQuery.of(context).size;
    
    return Container(
      height: size.height * 0.6,
      margin:  EdgeInsets.only(left: 24,right: 24, top: 60, bottom: 40),      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white ,  
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 20.0,
          )
        ]
      ),
      child: _titulo(),
    );
  }

  Widget _titulo(){
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 23, bottom: 23),
      child: Stack(
        children: <Widget>[        
          Column(          
            children: <Widget>[
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 320,
                    height: 70,
 //Tamaño normal//
                    child: Text("Cancelar el proyecto de GreenApp", style: TextStyle(color: Color.fromRGBO(110, 214, 88, 1), fontSize: 21,fontWeight: FontWeight.bold)),
//Tamaño maximo de caracteres//
                    // child: Text("Útil para tus comentarios en Twitter, así como para muchas otras aplicaciones, esta es una calculada", style: TextStyle(color: Color.fromRGBO(110, 214, 88, 1), fontSize: 18,fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              Divider(height: 25,),              
              SizedBox(height: 8,),
              Row(
                children: <Widget>[
                  Text("Motivo: "),
                  Text("Opinión")
                ],
              ),              
              Divider( height: 45, indent: 20, endIndent: 20,),              
              Row(
                children: <Widget>[
                  Text("Fecha Propuesta: "),
                  Text("28/05/2020")
                ],
              ),
              Divider(height: 45, indent: 40, endIndent: 40, ),
              Row(
                children: <Widget>[
                  Text("Descripción: "),                      
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 320,
                    height: 160,
                    child: Text("No se consiguen muchas ganancias y despues de pensarlo con el equipo de trabajo, hemos decidido que la mejor opción es cancelarlo"),                    
                  )
                ],
              )         
            ],
          )       
        ],
      ),
    );
  }  


}