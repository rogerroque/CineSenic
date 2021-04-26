import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Classes/contact.dart';
import 'package:login_app/Classes/politicas.dart';
import 'package:login_app/Classes/profile.dart';
import 'package:login_app/Classes/promotions.dart';
import 'package:login_app/Classes/purchase_history.dart';
import 'package:login_app/Classes/settings.dart';
import 'package:login_app/Classes/write_review.dart';

import 'help.dart';

class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Color.fromRGBO(29, 85, 168, 1.0),
        child: Column(
          children: <Widget>[

            /**** User photo *****/

            Container(
              margin: EdgeInsets.only(top: 40, left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  radius: 36,
                  backgroundColor: Color.fromRGBO(255, 246, 17, 1.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://static.wikia.nocookie.net/leagueoflegends/images/d/de/Champie_Akali_profileicon.png/revision/latest/scale-to-width-down/300?cb=20190515110201'),
                    radius: 34,
                  ),
                ),
              ),
            ),

            /**** Username *****/

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 10, left: 25),
              child: Text(
                'Teemo',
                style: TextStyle(
                    fontFamily: 'UbuntuBold',
                    fontSize: 25,
                    color: Colors.white
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 0, left: 25, bottom: 20),
              child: Text(
                '#00001',
                style: TextStyle(
                    fontFamily: 'UbuntuBold',
                    fontSize: 11,
                    color: Colors.grey
                ),
              ),
            ),

            Divider(height: 5, thickness: 0.5, color: Colors.white,),

            /***************************************
             * Profile icon and text
             * **************************************/

            Container(
              margin: EdgeInsets.only(top: 10, left: 0),
              child: Row(
                children: <Widget>[

                  IconButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => profile()),
                      )
                    },
                    icon: Icon(
                      Icons.person_rounded,
                      size: 27,
                      color: Colors.yellow,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => profile()),
                        )
                      },
                      child: Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'UbuntuMedium',
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            /***************************************
             * Purchase history icon and text
             * **************************************/

            Container(
              margin: EdgeInsets.only(top: 0, left: 0),
              child: Row(
                children: <Widget>[

                  IconButton(
                    icon: Icon(
                      Icons.bookmarks,
                      size: 23,
                      color: Colors.yellow,
                    ), onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => purchase_history()),
                    );
                  },
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => purchase_history()),
                        )
                      },
                      child: Text(
                        'Purchase history',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'UbuntuMedium',
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            /***************************************
             * Promotions icon and text
             * **************************************/

            Container(
              margin: EdgeInsets.only(top: 0, left: 0),
              child: Row(
                children: <Widget>[

                  IconButton(
                    icon: Icon(
                      Icons.local_offer,
                      size: 22,
                      color: Colors.yellow,
                    ), onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => promotions()));
                  },
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => promotions())
                        )},
                      child: Text(
                        'Promotions',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'UbuntuMedium',
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            /***************************************
             * CSC points icon and text
             * **************************************/

            Container(
              margin: EdgeInsets.only(top: 0, left: 0, bottom: 10),
              child: Row(
                children: <Widget>[

                  IconButton(
                    icon: Icon(
                      Icons.fiber_smart_record_sharp,
                      size: 22,
                      color: Colors.yellow,
                    ), onPressed: () {},
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 0),
                    child: InkWell(
                      child: Text(
                        'CSC points',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'UbuntuMedium',
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Divider(height: 10, thickness: 0.5, color: Colors.white,),

            /***************************************
             * Settings
             * **************************************/

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 20, left: 15),
              child: InkWell(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => settings()))
                },
                child: Text(
                  'Settings',
                  style: TextStyle(
                      fontFamily: 'UbuntuMedium',
                      fontSize: 17,
                      color: Colors.white
                  ),
                ),
              ),
            ),

            /***************************************
             * Write your review
             * **************************************/

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15, left: 15),
              child: InkWell(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => write_review()))
                },
                child: Text(
                  'Write your review',
                  style: TextStyle(
                      fontFamily: 'UbuntuMedium',
                      fontSize: 17,
                      color: Colors.white
                  ),
                ),
              ),
            ),

            /***************************************
             * Privacy policy
             * **************************************/

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15, left: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => politicas())
                    ,);
                },
                child: Text(
                  'Rate us',
                  style: TextStyle(
                      fontFamily: 'UbuntuMedium',
                      fontSize: 17,
                      color: Colors.white
                  ),
                ),
              ),
            ),

            /***************************************
             * Contact
             * **************************************/

            /*Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15, left: 15),
              child: InkWell(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => contact())
                  )},
                child: Text(
                  'Contact',
                  style: TextStyle(
                      fontFamily: 'UbuntuMedium',
                      fontSize: 17,
                      color: Colors.white
                  ),
                ),
              ),
            ),*/

            /***************************************
             * Help
             * **************************************/

            /*Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15, left: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => help()),
                  );
                },
                child: Text(
                  'Help',
                  style: TextStyle(
                      fontFamily: 'UbuntuMedium',
                      fontSize: 17,
                      color: Colors.white
                  ),
                ),
              ),
            ),*/

            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Socials',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'UbuntuMedium',
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                children: <Widget>[
                  Container(
                    /*child: Icon(Icons.fiber_smart_record_sharp, size: 45, color: Colors.white,),*/
                    child: Icon(Icons.fiber_smart_record_sharp, size: 45, color: Colors.white,),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    child: Icon(Icons.fiber_smart_record_sharp, size: 45, color: Colors.white,),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    child: Icon(Icons.fiber_smart_record_sharp, size: 45, color: Colors.white,),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}
