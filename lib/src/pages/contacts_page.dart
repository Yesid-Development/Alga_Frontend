import 'package:alga_frontend/src/models/models.dart';
import 'package:alga_frontend/src/pages/crud_contacts/new_contacts_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final _dbRef = Firestore.instance;
  ContactsModels contacts = new ContactsModels();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactos'),
      ),
      body: Container(margin: EdgeInsets.only(top: 5.0), child: _buildList()),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _dbRef
          .collection("contacts")
          .orderBy("created_at", descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        final int _contactCount = snapshot.data.documents.length;

        return ListView.builder(
          itemCount: _contactCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];
            contacts.id = document.documentID;
            contacts.name = document['name'].toString();
            contacts.lastname = document['lastname'].toString();
            contacts.position = document['position'].toString();
            contacts.number = document['number'].toString();
            contacts.email = document['email'].toString();

            final String _name = contacts.name;
            final String _lastname = contacts.lastname;
            final String _position = contacts.position;
            final String _number = contacts.number;
            final String _email = contacts.email;

            return Column(
              children: <Widget>[
                ListTile(
                    trailing: IconButton(
                      onPressed: () => document.reference.delete(),
                      icon: Icon(Icons.delete),
                    ),
                    title: Text(
                      contacts.name != null
                          ? '$_name $_lastname'
                          : '<No hay nombre disponible>',
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10.0,),
                      child: Text(contacts.position != null
                          ? '''$_position \n\n$_number \n\n$_email'''
                          : '<sin descripción>'),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('editcontacts', arguments: contacts);
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
        child: Icon(Icons.add, size: 35, color: Colors.deepPurple),
        onPressed: () {
          final route = MaterialPageRoute(builder: (context) => NewContactsPage());
          Navigator.push(context, route);
        });
  }
}
