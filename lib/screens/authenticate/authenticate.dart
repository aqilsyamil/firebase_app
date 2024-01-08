import 'package:flutter/material.dart';
import 'package:firebase_app/screens/services/auth.dart';
import 'package:firebase_app/models/user.dart';
import 'package:firebase_app/screens/authenticate/anon_page.dart';
import 'package:firebase_app/screens/authenticate/reg_page.dart';
import 'package:firebase_app/screens/authenticate/sign_in.dart';
class AuthenticateScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication',
          style: TextStyle( color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                User? user = await _auth.signInAnonymously();
                if (user != null) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => AnonymousHomeScreen())
                  );
                }
              },
              child: const Text('Sign In Anonymously'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              child: const Text('Sign In with Email/Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: const Text('Register with Email/Password'),
            ),
            // Add more widgets here as needed
          ],
        ),
      ),
    );
  }
}
