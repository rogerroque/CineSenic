import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 29, 41, 113),
      body: SafeArea(
        child: Column(
          children: <Widget>[

            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: <Widget>[

                  Container(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_sharp),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 30.0,
                    ),alignment: Alignment.topLeft,
                  ),

                  Container(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'UbuntuMedium',
                          color: Colors.white
                      ),
                    ),
                  )

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
