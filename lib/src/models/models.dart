import 'package:cloud_firestore/cloud_firestore.dart';

class TasksModels {
  String id;
  String title;
  String date;
  String description;

  TasksModels({
    this.title,
    this.date,
    this.description,
  });
}

class ProfileModels{
  String id;
  String name;
  String lastname;
  String direction;
  String phone;
  String email;
  String emailEmp;

  ProfileModels({
    this.name,
    this.lastname,
    this.direction,
    this.phone,
    this.email,
    this.emailEmp,   
  });
}

class ContactsModels{
  String id;
  String name;
  String lastname;
  String position;
  String number;  
  String email;

  ContactsModels({
    this.name,
    this.lastname,
    this.position,
    this.number,    
    this.email
  });
}
