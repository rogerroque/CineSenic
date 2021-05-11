import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/const.dart';
import 'package:login_app/components/purchasemodel.dart';
import 'package:login_app/login/login.dart';
import 'package:provider/provider.dart';
import 'components/menumodel.dart';
import 'components/moviemodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => PurchaseModel(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {

    void _loadMenus() {
      FirebaseFirestore.instance
          .collection("Menus")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          menus.add(
            new Menu(
                name: result.get("Name"),
                price: result.get("Price"),
                imageURL: result.get("Img"),
                contador: result.get("Contador")
            ),
          );
          print(result.get("Name"));
        });
      });
    }

    void _loadMovies() {
      FirebaseFirestore.instance
          .collection("Peliculas")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          movies.add(
            new Movie(
              title: result.get("Name"),
              categories: result.get("Gender"),
              imageURL: result.get("Img"),
              logo: result.get("Logo"),
              rating: double.parse(result.get("Rating")),
              date: DateTime(int.parse(result.get("Year"))),
              director: result.get("Director"),
              actor: result.get("Actor"),
              synopsis: result.get("Synopsis"),
              price: double.parse(result.get("Price")),
              videoURL: result.get("Trailer")
            ),
          );
          print(result.get("Name"));
        });
      });
    }

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
            _loadMovies();
            _loadMenus();
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
