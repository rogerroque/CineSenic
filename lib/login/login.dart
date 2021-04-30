import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/Classes/politicas.dart';
import 'package:login_app/login/register.dart';
import 'package:login_app/main/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var email;
  var password;
  bool accepted = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // ignore: missing_return
    Future<UserCredential> signInWithGoogle() async {
      try {
        final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final GoogleAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        accepted = true;
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } on MissingPluginException catch (e) {
        print(e.message);
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => register()),
          );
        },
        label: const Text(
          'NEW ACCOUNT',
          style: TextStyle(fontSize: 10),
        ),
        icon: const Icon(
          Icons.add,
          size: 20,
        ),
        backgroundColor: Color.fromRGBO(212, 175, 55, 1),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(50, 57, 116, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //CineSeniC foto
              Container(
                margin: EdgeInsets.only(top: 70, bottom: 70),
                child: Align(
                  child: Image.asset(
                    'assets/img/CineSenicLogo.png',
                    scale: 8,
                  ),
                  alignment: Alignment(0, -0.8),
                ),
              ),

              Container(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0),
                ),
                alignment: Alignment.centerLeft,
              ),

              SizedBox(
                height: 30,
              ),
              //Email Textfield
              Container(
                width: double.infinity,
                child: TextField(
                  onChanged: (text) {
                    email = text;
                  },
                  obscureText: false,
                  decoration: new InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.white, width: 0.0),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )),
                  style: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //Password Textfield
              Container(
                width: double.infinity,
                child: TextField(
                  onChanged: (text) {
                    password = text;
                  },
                  obscureText: true,
                  decoration: new InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.white, width: 0.0),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )),
                  style: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(
                height: 12,
              ),
              Container(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
                alignment: Alignment.centerRight,
              ),

              SizedBox(
                height: 30,
              ),

              Container(
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 40.0,
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: email, password: password);
                      if (FirebaseAuth.instance
                          .idTokenChanges()
                          .isBroadcast) {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => home()),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  },
                  color: Color.fromRGBO(50, 57, 116, 1),
                  child:
                  Text('LOGIN', style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.white, width: 1),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                  child: InkWell(
                    onTap: () async {
                      signInWithGoogle();
                      if (FirebaseAuth.instance.idTokenChanges().isBroadcast) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => home()),
                        );
                      }
                    },
                    child: Image.asset(
                      'assets/img/google.png',
                      width: 50,
                      height: 50,
                    ),
                  )),

              Container(
                child: Text(
                    'Finish him'
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
