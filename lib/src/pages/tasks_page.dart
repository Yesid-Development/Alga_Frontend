import 'package:alga_frontend/src/models/models.dart';
import 'package:alga_frontend/src/pages/crud_tasks/new_tasks_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final _dbRef = Firestore.instance;
  TasksModels tasks = new TasksModels();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tareas'),
        backgroundColor: Colors.blue,
      ),
      body: Container(margin: EdgeInsets.only(top: 5.0), child: _buildList()),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _dbRef
          .collection("task")
          .orderBy("created_at", descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        final int _taskCount = snapshot.data.documents.length;

        return ListView.builder(
          itemCount: _taskCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];
            tasks.id = document.documentID;
            tasks.title = document['title'].toString();
            tasks.date = document['date'].toString();
            tasks.description = document['description'].toString();

            final String _title = tasks.title;
            final String _date = tasks.date;
            final String _description = tasks.description;

            return Column(
              children: <Widget>[
                ListTile(
                    trailing: IconButton(
                      onPressed: () => document.reference.delete(),
                      icon: Icon(Icons.delete),
                    ),
                    title: Text(
                      tasks.title != null
                          ? '$_title'
                          : '<No hay titulo disponible>',
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10.0,),
                      child: Text(tasks.description != null
                          ? '''$_date \n\n$_description'''
                          : '<sin descripción>'),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('editTask', arguments: tasks);
                    }),
                    Divider()
              ],
            );
          },
        );
      },
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.add, size: 35, color: Colors.blue),
        onPressed: () {
          final route = MaterialPageRoute(builder: (context) => NewTaskPage());
          Navigator.push(context, route);
        });
  }
}
