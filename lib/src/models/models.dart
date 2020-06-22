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
