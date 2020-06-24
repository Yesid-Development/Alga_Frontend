import 'package:cloud_firestore/cloud_firestore.dart';

final _dbRef = Firestore.instance;

//================ TASKS ===============\\
void createTasks(String title, String date, String description) async {
  await _dbRef.collection('task').document().setData({
    'title': title,
    'date': date,
    'description': description,
    'created_at': FieldValue.serverTimestamp(),
  });
}

void editTasks(String title, String date, String description, String id) {
  try {
    _dbRef.collection('task').document('$id').updateData({
      'title': title,
      'date': date,
      'description': description,
    });
  } catch (e) {
    print(e.toString());
  }
}
//=============== TASKS ================\\


//================= PROFILE =====================\\
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
          'created_at': FieldValue.serverTimestamp(),
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
//================== PROFILE ===============\\


//========================CONTACS==========================\\
void createContacts(String name, String lastname, String position, String number, String email) async { 
  await _dbRef.collection("contacts") 
      .document() 
      .setData({ 
        'name' : name , 
        'lastname' : lastname,
        'position': position,
        'number': number,        
        'email': email,
        'created_at': FieldValue.serverTimestamp()
       }); 
}


void editContacts(String name, String lastname, String position, String number, String email, String id) {
  try {
    _dbRef.collection('contacts').document('$id').updateData({
      'name' : name , 
        'lastname' : lastname,
        'position': position,
        'number': number,        
        'email': email,
    });
  } catch (e) {
    print(e.toString());
  }
}
//==================CONTACTS================\\


//==================DOCUMENTS================\\
void createFile(Blob file) async { 
  await _dbRef.collection("files") 
      .document() 
      .setData({ 
        'file': file,
        'created_at': FieldValue.serverTimestamp()
       }); 
}

void editFile(String id, Blob file) {
  try {
    _dbRef.collection('files')
        .document('$id')
        .updateData({
          'file': file
             });
  } catch (e) {
    print(e.toString());
  }
}
//==================DOCUMENTS================\\
