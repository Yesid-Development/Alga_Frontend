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
