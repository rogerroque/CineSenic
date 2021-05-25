import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/main.dart';

class points extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CSC Points"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget> [
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 50),
              child: Text("CSC Points", style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20
              ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text("160", style: TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold
              ),),
            )
          ]
        ),
      ),
    );
  }
}
