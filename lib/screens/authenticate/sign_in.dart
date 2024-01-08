import 'package:flutter/material.dart';
import 'package:firebase_app/screens/services/auth.dart';
import 'package:firebase_app/screens/authenticate/anon_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In',
          style: TextStyle( color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                onChanged: (val) {
                  setState(() => email = val);
                },
                // Other properties for email
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
                onChanged: (val) {
                  setState(() => password = val);
                },
                // Other properties for password
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Sign In'),
                onPressed: () async {
                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                  if (result != null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => AnonymousHomeScreen()),
                    );
                  } else {
                    setState(() => error = 'Failed to sign in with Email/Password');
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
