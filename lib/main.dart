import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/const.dart';
import 'package:login_app/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('Error');
          return login();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print('Conectado a Firebase');
          return login();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        print('Conectando');
        return login();
      },
      ),
    );
  }
}