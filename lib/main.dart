import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp3/screens/browse_screen.dart';
import 'package:myapp3/screens/login_screen.dart';
import 'package:myapp3/screens/registration_screen.dart';
import 'package:myapp3/screens/home_screen.dart';

void main() {
  runApp(EBookReader());
}

class EBookReader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      home: BrowseScreen(),
      initialRoute: BrowseScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        BrowseScreen.id: (context) => BrowseScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}
