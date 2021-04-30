import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class summary_order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Summary order',
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

            Container(
              padding: EdgeInsets.only(top: 50, left: 50),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue
                )
              ),
              child: Column(
                children: <Widget>[



                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
