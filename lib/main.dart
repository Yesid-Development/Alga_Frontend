import 'package:alga_frontend/src/pages/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Routes
import 'package:alga_frontend/src/auth/auth_state.dart';
import 'package:alga_frontend/src/pages/contacts_page.dart';
import 'package:alga_frontend/src/pages/documents_page.dart';
import 'package:alga_frontend/src/pages/home_page.dart';
import 'package:alga_frontend/src/pages/login_page.dart';
import 'package:alga_frontend/src/pages/meetings_page.dart';
import 'package:alga_frontend/src/pages/profile_page.dart';
import 'package:alga_frontend/src/pages/register_page.dart';
import 'package:alga_frontend/src/pages/requests_page.dart';
import 'package:alga_frontend/src/pages/edit_profile_page.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new AuthState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: {
          '/': (BuildContext context) {
            final state = Provider.of<AuthState>(context);
            if (state.isLoggedIn()) {
              return  Navigation();
            } else {
              return  LoginPage();
            }
          },
          'login'     : (BuildContext context) => LoginPage(),
          'register'  : (BuildContext context) => RegisterPage(),
          'home'      : (BuildContext context) => HomePage(),
          'documents' : (BuildContext context) => DocumentsPage(),
          'meetings'  : (BuildContext context) => MeetingsPage(),
          'requests'  : (BuildContext context) => RequestsPage(),
          'contacts'  : (BuildContext context) => ContactsPage(),
          'profile'   : (BuildContext context) => ProfilePage(),
          'edit'      : (BuildContext context) => EditProfilePage(),
        },
      ),
    );
  }
}


//adb connect 127.0.0.1:62001