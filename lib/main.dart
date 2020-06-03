import 'package:alga_frontend/src/auth/auth_state.dart';
import 'package:alga_frontend/src/pages/home_page.dart';
import 'package:alga_frontend/src/pages/login_page.dart';
import 'package:alga_frontend/src/pages/profile_page.dart';
import 'package:alga_frontend/src/pages/register_page.dart';
import 'package:alga_frontend/src/pages/settings_page.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
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
              return BounceInRight(child: HomePage());
            } else {
              return BounceInRight(child: LoginPage());
            }
          },
          'home'    : (BuildContext context) => HomePage(),
          'login'   : (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'settings': (BuildContext context) => SettingsPage(),
          'profile' : (BuildContext context) => ProfilePage(),
        },
      ),
    );
  }
}


//adb connect 127.0.0.1:62001