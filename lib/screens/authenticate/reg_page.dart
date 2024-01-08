import 'package:flutter/material.dart';
import 'package:firebase_app/screens/services/auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration',
          style: TextStyle( color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(
          color: Colors.white, // Sets the color of the back icon to white
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email', // Label text
                  hintText: 'Enter your email', // Hint text
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
                  labelText: 'Password', // Label text
                  hintText: 'Enter your password', // Hint text
                ),
                onChanged: (val) {
                  setState(() => password = val);
                },
                // Other properties for password
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Register'),
                // Inside the onPressed of the ElevatedButton in RegisterPage

                onPressed: () async {
                  try {
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if (result != null) {
                      print('User successfully registered in Firebase with UID: ${result.uid}');
                      // You can also navigate to another screen if needed
                    } else {
                      setState(() => error = 'Registration failed');
                    }
                  } catch (e) {
                    print('Error during registration: $e');
                    setState(() => error = e.toString());
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
