import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/main/home.dart';

class register extends StatefulWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  bool _showPassword = false;
  var email;
  var password;
  var username;

  Widget _buildPasswordTextField() {
    return TextField(
      onChanged: (text) {
        password = text;
      },
      obscureText: !this._showPassword,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 0.0),
        ),
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            color: this._showPassword ? Colors.grey : Colors.white,
          ),
          onPressed: () {
            setState(() => this._showPassword = !this._showPassword);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color.fromRGBO(75, 75, 75, 1.0), Colors.black],
                    stops: [0.0,0.9],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter
                )
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 5.0, left: 5.0),
                  child: IconButton(
                    icon: const Icon(Icons.cancel),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 35.0,
                  ),
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 25.0, left: 25.0),
                  width: double.infinity,
                  child: TextField(
                    onChanged: (text) {
                      username = text;
                    },
                    obscureText: false,
                    decoration: new InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0.0),
                        ),
                        labelText: 'First Name',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        )),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 25.0, left: 25.0),
                  width: double.infinity,
                  child: TextField(
                    obscureText: false,
                    decoration: new InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0.0),
                        ),
                        labelText: 'Last Name',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        )),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 25.0, left: 25.0),
                  width: double.infinity,
                  child: TextField(
                    onChanged: (text) {
                      email = text;
                    },
                    obscureText: false,
                    decoration: new InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0.0),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        )),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 25.0, left: 25.0),
                  width: double.infinity,
                  child: _buildPasswordTextField(),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  child: MaterialButton(
                    minWidth: 200.0,
                    height: 40.0,
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email, password: password);
                        await FirebaseAuth.instance.currentUser.updateProfile(displayName: username);
                        if (FirebaseAuth.instance.idTokenChanges().isBroadcast) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => home()),
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    color: Color.fromARGB(38, 36, 75, 1),
                    child: Text('CREATE ACCOUNT',
                        style: TextStyle(color: Colors.white)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
