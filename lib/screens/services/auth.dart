import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_app/models/user.dart';

class AuthService {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;

  // Convert a Firebase User to a custom User
  User? _userFromFirebase(firebase_auth.User? user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<User?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

// Sign in anonymously
  Future<User?> signInAnonymously() async {
    try {
      firebase_auth.UserCredential authResult = await _auth.signInAnonymously();
      User? user = _userFromFirebase(authResult.user);
      if (user != null) {
        print('User signed in anonymously with UID: ${user.uid}');
      }
      return user;
    } catch (e) {
      print('Error signing in anonymously: $e');
      return null;
    }
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      firebase_auth.UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(authResult.user);
    } catch (e) {
      print('Error signing in with email/password: $e');
      return null;
    }
  }

  // Register with email and password
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      firebase_auth.UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(authResult.user);
    } catch (e) {
      print('Error registering with email/password: $e');
      return null;
    }
  }

  // Sign out method
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
