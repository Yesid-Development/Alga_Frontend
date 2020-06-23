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

//Perfil

void createProfile(String name, String lastname, String direction, String phone, String email, String emailEmp, String id) async {
  await _dbRef
        .collection('profile')
        .document()
        .setData({
          'name': name, 
          'lastname': lastname, 
          'direction': direction,
          'phone': phone,
          'email': email,
          'emailEmp': emailEmp,
        });
}

void editProfile(String name, String lastname, String direction, String phone, String email, String emailEmp, String id) {
  try {
    _dbRef
        .collection('profile')
        .document('$id')
        .updateData({'name': name, 'lastname': lastname, 'direction': direction,'phone': phone,'email': email,'emailEmp': emailEmp,});
  } catch (e) {
    print(e.toString());
  }
}
