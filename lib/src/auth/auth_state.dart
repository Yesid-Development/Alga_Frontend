import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthState with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  SharedPreferences _prefs;

  // Constructor
  AuthState() {
    authState();
  }

// Validar si el usuario ya esta logueado
  void authState() async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('isLoggedIn')) {
      _user = await _firebaseAuth.currentUser();
      _loggedIn = _user != null;
      _validating = false;
      notifyListeners();
    } else {
      _validating = false;
      notifyListeners();
    }
  }

  //========= Public methods =========\\
  bool _loggedIn = false;
  bool _loading = false;
  bool _validating = true;
  FirebaseUser _user;
  AuthResult _result;

  bool isLoggedIn() => _loggedIn;
  bool isLoading() => _loading;
  bool isValidating() => _validating;
  FirebaseUser currentUser() => _user;

// SingIn with email and password
  void singInWithEmailAndPassword(String _email, String _password) async {
    _loading = true;
    notifyListeners();

    await _signIn(_email, _password);

    _loading = false;
    if (_user != null) {
      _prefs.setBool('isLoggedIn', true);
      _loggedIn = true;
      notifyListeners();
    } else {
      _loggedIn = false;
      notifyListeners();
    }
  }

// SingUn with email and password
  void singUpWithEmailAndPassword(String _email, String _password) async {
    _loading = true;
    notifyListeners();

    await _signUp(_email, _password);
    _loading = false;
  }

// SingIn with Google
  void googleLogin() async {
    _loading = true;
    notifyListeners();

    _user = await _googleSingIn();

    _loading = false;
    if (_user != null) {
      _prefs.setBool('isLoggedIn', true);
      _loggedIn = true;
      notifyListeners();
    } else {
      _loggedIn = false;
      notifyListeners();
    }
  }

  void logout() {
    _loading = true;
    notifyListeners();

    _prefs.clear();
    _loggedIn = false;
    _signOut();
    _loading = false;
    notifyListeners();
  }
  //========= Public methods =========\\

  //========= Private methods =========\\

  // Sign in with Google
  Future<FirebaseUser> _googleSingIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await _firebaseAuth.signInWithCredential(credential);
    return _firebaseAuth.currentUser();
  }

  // Sign in with email and password
  Future<void> _signIn(String email, String password) async {
    try {
      _user = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((result) {
        _result = result;
        FirebaseUser usr = _result.user;
        return usr;
      });
    } catch (e) {
      print(e);
      _user = null;
      _result = null;
    }
  }

  // SignUp - Registro
  Future<void> _signUp(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // SignOut
  Future<void> _signOut() async {
    return Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }

  // Send email verification
  // Future<void> sendEmailVerification() async {
  //   FirebaseUser user = await _firebaseAuth.currentUser();
  //   user.sendEmailVerification();
  // }

  // Future<bool> isEmailVerified() async {
  //   FirebaseUser user = await _firebaseAuth.currentUser();
  //   return user.isEmailVerified;
  // }

  //========= Private methods =========\\

  // Obtener usuario
  // Future<String> _getUser() async {
  //   return (await _firebaseAuth.currentUser()).email;
  // }
}
