import 'package:alga_frontend/src/pages/crud_profile/edit_profile_page.dart';
import 'package:alga_frontend/src/pages/crud_tasks/edit_tasks_page.dart';
import 'package:alga_frontend/src/pages/crud_tasks/new_tasks_page.dart';
import 'package:alga_frontend/src/pages/navigation.dart';
import 'package:alga_frontend/src/pages/tasks_page.dart';
import 'package:alga_frontend/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Routes
import 'package:alga_frontend/src/auth/auth_state.dart';
import 'package:alga_frontend/src/pages/contacts_page.dart';
import 'package:alga_frontend/src/pages/documents_page.dart';
import 'package:alga_frontend/src/pages/home_page.dart';
import 'package:alga_frontend/src/pages/login_page.dart';
import 'package:alga_frontend/src/pages/meetings_page.dart';
import 'package:alga_frontend/src/pages/profile_page.dart';
import 'package:alga_frontend/src/pages/register_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new AuthState(),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('es', 'ES'), //Español
        ],
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: {
          '/': (BuildContext context) {
            final state = Provider.of<AuthState>(context);
            if (state.isLoggedIn()) {
              print(state);
              return Navigation();
            } else {
              print(state);
              return LoginPage();
            }
          },
          'login'      : (BuildContext context) => LoginPage(),
          'register'   : (BuildContext context) => RegisterPage(),
          'home'       : (BuildContext context) => HomePage(),
          'documents'  : (BuildContext context) => DocumentsPage(),
          'meetings'   : (BuildContext context) => MeetingsPage(),
          'contacts'   : (BuildContext context) => ContactsPage(),
          'profile'    : (BuildContext context) => ProfilePage(),
          'editProfile': (BuildContext context) => EditProfilePage(),
          'tasks'      : (BuildContext context) => TasksPage(),
          'newTask'    : (BuildContext context) => NewTaskPage(),
          'editTask'   : (BuildContext context) => EditTaskPage()
        },
        theme: myTheme,
      ),
    );
  }
}

//adb connect 127.0.0.1:62001
