import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color.fromRGBO(50, 57, 116, 1),
            key: scaffoldKey,
            drawer: buildDrawer(),
            body: Stack(
                children: <Widget>[
                  Positioned(
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white
                      ),
                      onPressed: () => scaffoldKey.currentState.openDrawer(),
                    ),
                  ),

                  Column(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 60.0),
                          child: homeGenereMovieSelection()
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 30,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              children: <Widget> [

                                Image.network('https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                                Image.network('https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                                Image.network('https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                                Image.network('https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                                Image.network('https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                                Image.network('https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                                Image.network('https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                                Image.network('https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                                Image.network('https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                                Image.network('https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                                Image.network('https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ]
            ),
          ),
          debugShowCheckedModeBanner: false,
        )
    );
  }
}


class buildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          Text('Hola'),
          Text('Hello'),
          Text('Hallo'),
          Text('Bonjour')
        ],
      ),
    );
  }
}

class homeGenereMovieSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                SizedBox(
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Text(
                        'Premieres',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  height: 50.0,
                ),
                SizedBox(width: 50.0,),
                InkWell(
                  child: Text(
                    'Upcoming',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white
                    ),
                  ),
                ),
                SizedBox(width: 50.0,),
                InkWell(
                  child: Text(
                    'Kids',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white
                    ),
                  ),
                ),
                SizedBox(width: 50.0,),
                InkWell(
                  child: Text(
                    'Clasics',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white
                    ),
                  ),
                ),
                SizedBox(width: 50.0,),
                InkWell(
                  child: Text(
                    'Spanish movies',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


