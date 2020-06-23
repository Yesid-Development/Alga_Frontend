import 'package:cloud_firestore/cloud_firestore.dart';

class TasksModels {
  String id;
  String title;
  String date;
  String description;
  DocumentReference document;

  TasksModels({
    this.title,
    this.date,
    this.description,
    this.document
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
  DocumentReference documentP;

  ProfileModels({
    this.name,
    this.lastname,
    this.direction,
    this.phone,
    this.email,
    this.emailEmp,   
    this.documentP 
  });
}

class ContacsModels{
  String name;
  String lastname;
  String number;
  String address;
  String email;

  ContacsModels({
    this.name,
    this.lastname,
    this.number,
    this.address,
    this.email
  });
}
