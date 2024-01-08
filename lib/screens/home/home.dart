import 'package:flutter/material.dart';
import '../authenticate/authenticate.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen',
         style: TextStyle( color: Colors.white, // Sets the text color to white
          fontWeight: FontWeight.bold,
         ),
        ),
        backgroundColor: Colors.purple, // Sets the AppBar color to blue
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20), // Adds a little space between the text and the button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AuthenticateScreen()),
                );
              },
              child: Text('Go to Authenticate Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
