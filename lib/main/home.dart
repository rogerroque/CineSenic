import 'package:flutter/material.dart';

class home extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
          home: Scaffold(
            key: scaffoldKey,
            drawer: new Drawer(
              child: new ListView(
                children: <Widget>[
                  Text('Hola'),
                  Text('Hello'),
                  Text('Hallo'),
                  Text('Bonjour')
                ],
              ),
            ),
            body: Stack(
                children: <Widget>[
                  Positioned(
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () => scaffoldKey.currentState.openDrawer(),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 60.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                child: Text('Uno'),
                              ),
                              SizedBox(width: 50.0,),
                              InkWell(
                                child: Text('Dos'),
                              ),
                              SizedBox(width: 50.0,),
                              InkWell(
                                child: Text('Tres'),
                              ),
                              SizedBox(width: 50.0,),
                              InkWell(
                                child: Text('Cuatro'),
                              ),
                              SizedBox(width: 50.0,),
                              InkWell(
                                child: Text('Cuatro'),
                              ),
                              SizedBox(width: 50.0,),
                              InkWell(
                                child: Text('Cuatro'),
                              ),
                              SizedBox(width: 50.0,),
                              InkWell(
                                child: Text('Cuatro'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50.0,),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text('gggggggg'),
                        )
                      ],
                    )
                  ),
                ]
            ),
          ),
          debugShowCheckedModeBanner: false,
        )

    );
  }
}

