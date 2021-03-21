import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/login/register.dart';
import 'package:login_app/main/home.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => register()),
          );},
        label: const Text('NEW ACCOUNT', style: TextStyle(fontSize: 10),),
        icon: const Icon(Icons.add, size: 20,),
        backgroundColor: Color.fromRGBO(212, 175, 55, 1),
      ),

      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(50, 57, 116, 1),
      body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 60,),
                    //CineSeniC foto
                    Align(
                      child: Image.network(
                        'https://i.ibb.co/pjXW9D6/cinesenic.png',
                        scale: 4,
                      ),
                      alignment: Alignment(0,-0.8),
                    ),
                    SizedBox(height: 50,),

                    Container(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5.0
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),

                    SizedBox(height: 30,),
                    //Email Textfield
                    Container(
                      width: double.infinity,
                      child: TextField(
                        obscureText: false,
                        decoration: new InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white, width: 0.0),
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            )
                        ),
                        style: TextStyle(color: Colors.white),),
                    ),

                    SizedBox(height: 10,),

                    //Password Textfield
                    Container(
                      width: double.infinity,
                      child: TextField(
                        obscureText: true,
                        decoration: new InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white, width: 0.0),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            )
                        ),
                        style: TextStyle(color: Colors.white),),
                    ),

                    SizedBox(height: 12,),
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

                    SizedBox(height: 30,),

                    Container(
                      child: MaterialButton(
                        minWidth: 200.0,
                        height: 40.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => home()),
                          );
                        },
                        color: Color.fromRGBO(50, 57, 116, 1),
                        child: Text('LOGIN', style: TextStyle(color: Colors.white)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.white, width: 1),
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container(
                      child: Image.network(
                        'https://i.ibb.co/d6GsSCP/pngegg.png',
                        scale: 25,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Text(
                    'Terms & Conditions',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13
                    ),
                  ),
                )
              ],
            ),
          ),
      );
  }
}
