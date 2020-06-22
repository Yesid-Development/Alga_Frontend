import 'package:cloud_firestore/cloud_firestore.dart';

final _dbRef = Firestore.instance;

// Guardar tareas en firestore
void createTasks(String title, String date, String description) async {
  await _dbRef
      .collection('task')
      .document()
      .setData({'title': title, 'date': date, 'description': description, 'created_at': FieldValue.serverTimestamp(),});
}

// Mostrar tareas de firestore
void showTasks() {
  _dbRef
      .collection('task')
      .snapshots()
      .listen((data) => data.documents.forEach((doc) => print(doc["title"])));
}

void editTasks(String title, String date, String description, String id) {
  try {
    _dbRef
        .collection('task')
        .document('$id')
        .updateData({'title': title, 'date': date, 'description': description,});
  } catch (e) {
    print(e.toString());
  }
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