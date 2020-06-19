import 'package:cloud_firestore/cloud_firestore.dart';

final dbRef = Firestore.instance;

// Guardar tareas en firestore
void createTasks(String title, String date, String description) async {
  await dbRef.collection('task')
        .document()
        .setData({
          'title': title,
          'date': date,
          'description': description
        });
}

void createProfile(String nombre, String apellido, String direccion, String telefono, String correo, String correoP, String sede) async {
  await dbRef.collection('profile')
        .document()
        .setData({
          'nombre': nombre,
          'apellido': apellido,
          'direccion': direccion,
          'telefono': telefono,
          'correo': correo,
          'correoP': correoP,
          'sede': sede,
        });
}