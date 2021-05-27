import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/reservasmodel.dart';

import 'package:login_app/login/login.dart';

class profile extends StatefulWidget {

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {

  bool stateFacebook = false;
  bool stateNotifications = false;
  var cinesenicPoints = 0;

  bool editUsername = false;
  String username = FirebaseAuth.instance.currentUser.displayName;

  @override
  Widget build(BuildContext context) {

    String cscpoints() {
      for (var entry in reservas) {
        cinesenicPoints += entry.cscpoints;
      }
      return cinesenicPoints.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromRGBO(75, 75, 75, 1.0), Colors.black],
                  stops: [0.0,5.6],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter
              )
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 5.0, right: 10.0),
            child: Column(
              children: <Widget> [

                /***************  Container para la Imagen de usuario *****************/
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 30),
                  child: CircleAvatar(
                    radius: 52,
                    backgroundColor: Color.fromRGBO(255, 246, 17, 1.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://static.wikia.nocookie.net/leagueoflegends/images/d/de/Champie_Akali_profileicon.png/revision/latest/scale-to-width-down/300?cb=20190515110201'),
                      radius: 50,
                    ),
                  ),
                ),

                /***************  Container para el nombre de usuario *****************/

                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    username,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      letterSpacing: 0.0,
                      fontFamily: 'UbuntuBold'
                    ),
                  ),
                  alignment: Alignment.center,
                ),

                /***************  Container para el ID de usuario *****************/

                Container(
                  child: Text(
                    '#00001',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 12,
                        letterSpacing: 0.0,
                        fontFamily: 'UbuntuBold'
                    ),
                  ),
                  alignment: Alignment.center,
                ),

                /*********----------------------************/
                /******** Account settings fields **********/
                /*********----------------------************/

                Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Text(
                    'Account Settings',
                    style: TextStyle(
                        fontFamily: 'UbuntuBold',
                        color: Colors.white,
                        fontSize: 23,
                        letterSpacing: 0.0
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                ),

                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Username',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.0,
                            fontFamily: 'UbuntuLight'
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    Spacer(),
                    Container(
                        margin: EdgeInsets.only(right: 5),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.edit),
                          color: Colors.yellow,
                          onPressed: () {

                          },
                          iconSize: 25.0,
                        )
                      )
                    )

                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: Text(
                    username,
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                        letterSpacing: 0.0,
                        fontFamily: 'UbuntuLight'
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                ),

                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.0,
                            fontFamily: 'UbuntuLight'
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    Spacer(),
                    Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.yellow,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 25.0,
                          )
                        )
                    )
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    '***********',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                        letterSpacing: 0.0,
                        fontFamily: 'UbuntuLight'
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'E-mail',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.0,
                        fontFamily: 'UbuntuLight'
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                ),

                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    FirebaseAuth.instance.currentUser.email,
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                        letterSpacing: 0.0,
                        fontFamily: 'UbuntuLight'
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'CSC Points',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.0,
                        fontFamily: 'UbuntuLight'
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                ),

                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    cscpoints(),
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                        letterSpacing: 0.0,
                        fontFamily: 'UbuntuLight'
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                ),

                /*********---------------************/
                /******** Facebook fields **********/
                /*********---------------************/

                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Text(
                    'Facebook',
                    style: TextStyle(
                        fontFamily: 'UbuntuBold',
                        color: Colors.white,
                        fontSize: 23,
                        letterSpacing: 0.0
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                ),

                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Text(
                        'Link with Facebook',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.0,
                            fontFamily: 'UbuntuLight'
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    Spacer(),
                    Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Switch(
                          activeColor: Colors.yellow,
                          inactiveThumbColor: Colors.yellow,
                          value: stateFacebook,
                          onChanged: (bool s_facebook) {
                            setState(() {
                              stateFacebook = s_facebook;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),

                /*********---------------------************/
                /******** Notifications fields ************/
                /*********---------------------************/

                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                        fontFamily: 'UbuntuBold',
                        color: Colors.white,
                        fontSize: 23,
                        letterSpacing: 0.0
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                ),

                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Text(
                        'Enable notifications',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.0,
                            fontFamily: 'UbuntuLight'
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    Spacer(),
                    Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Switch(
                          activeColor: Colors.yellow,
                          inactiveThumbColor: Colors.yellow,
                          value: stateNotifications,
                          onChanged: (bool s_notifications) {
                            setState(() {
                              stateNotifications = s_notifications;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),

                /**********--------------****************/
                /********** LEGAL fields ***************/
                /**********--------------****************/

                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Text(
                    'Legal',
                    style: TextStyle(
                        fontFamily: 'UbuntuBold',
                        color: Colors.white,
                        fontSize: 23,
                        letterSpacing: 0.0
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                ),


                /**** Legal notice ****/
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Legal notice',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.0,
                            fontFamily: 'UbuntuLight'
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.arrow_forward_ios, color: Colors.yellow,),
                        )
                      ),
                    )
                  ],
                ),


                /**** Privacy politics ****/
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        'Privacy politics',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.0,
                            fontFamily: 'UbuntuLight'
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.arrow_forward_ios, color: Colors.yellow,),
                          )
                      ),
                    )
                  ],
                ),


                /**** cookies politics ****/
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        'Cookies politics',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.0,
                            fontFamily: 'UbuntuLight'
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.arrow_forward_ios, color: Colors.yellow,),
                          )
                      ),
                    )
                  ],
                ),



                Align(
                  alignment: Alignment.bottomCenter ,
                  child: Container(
                    margin: EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
                    constraints: BoxConstraints.tightFor(height: 40, width: double.infinity),
                    child: Container(

                      child: ElevatedButton(
                        onPressed: () => {
                          FirebaseAuth.instance.signOut(),
                          Navigator.push(context, MaterialPageRoute(builder: (context) => login()))
                        },
                        child: Text(
                          'Log out',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'UbuntuMedium'
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.white,
                              width: 1.5
                            )
                          ),

                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}
