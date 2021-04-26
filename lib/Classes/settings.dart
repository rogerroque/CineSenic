import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 29, 41, 113),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        'Settings',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'UbuntuMedium',
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  children: <Widget> [

                    Container(
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'UbuntuBold'
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 15, bottom: 12.5),
                    ),

                    Row(
                      children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.notifications_none, color: Colors.white, size: 25,),
                          onPressed: () => {}
                      ),
                      InkWell(
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                              fontFamily: 'UbuntuMedium',
                              fontSize: 18,
                              color: Colors.white
                          ),
                        ),
                      )
                    ],
                    ),

                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.lock_outline, color: Colors.white, size: 25,),
                            onPressed: () => {}
                        ),
                        InkWell(
                          child: Text(
                            'Privacy',
                            style: TextStyle(
                                fontFamily: 'UbuntuMedium',
                                fontSize: 18,
                                color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.security, color: Colors.white, size: 25,),
                            onPressed: () => {}
                        ),
                        InkWell(
                          child: Text(
                            'Security',
                            style: TextStyle(
                                fontFamily: 'UbuntuMedium',
                                fontSize: 18,
                                color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.help, color: Colors.white, size: 25,),
                            onPressed: () => {}
                        ),
                        InkWell(
                          child: Text(
                            'Help',
                            style: TextStyle(
                                fontFamily: 'UbuntuMedium',
                                fontSize: 18,
                                color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.info, color: Colors.white, size: 25,),
                            onPressed: () => {}
                        ),
                        InkWell(
                          child: Text(
                            'About',
                            style: TextStyle(
                                fontFamily: 'UbuntuMedium',
                                fontSize: 18,
                                color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),

                    Container(
                      child: Text(
                        'Customization',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'UbuntuBold'
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 15, bottom: 12.5, top: 10),
                    ),

                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.format_paint, color: Colors.white, size: 25,),
                            onPressed: () => {}
                        ),
                        InkWell(
                          child: Text(
                            'Theme',
                            style: TextStyle(
                                fontFamily: 'UbuntuMedium',
                                fontSize: 20,
                                color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),

                  ]
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
