import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Classes/drawer.dart';

class home extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: Color.fromRGBO(50, 57, 116, 1),
    key: scaffoldKey,
    drawer: buildDrawer(),
    body: SafeArea(
      child: Container(
        child: Stack(children: <Widget>[
          Positioned(
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => scaffoldKey.currentState.openDrawer(),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 60.0),
              child: homeGenereMovieSelection()),
          Container(
            margin: EdgeInsets.fromLTRB(0, 110, 0, 0),
            child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              mainAxisSpacing: 30,
              children: <Widget>[
                Image.network(
                    'https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                Image.network(
                    'https://playmax.xyz/img/c/400/1/1527927502/494.jpg'),
                Image.network(
                    'https://images-na.ssl-images-amazon.com/images/I/91bBsCoK0rL._AC_SL1500_.jpg'),
                Image.network(
                    'https://ohsmagnet.com/wp-content/uploads/2019/04/unnamed-607x900.jpg'),
                Image.network(
                    'https://cdn11.bigcommerce.com/s-cw25miz5h3/images/stencil/1280x1280/products/286559/315166/9780241371664__95157.1560949081.jpg?c=2'),
                Image.network(
                    'https://i.pinimg.com/736x/44/80/b4/4480b4f6b88dc61359a7c33d9a3fb02a.jpg'),
                Image.network(
                    'https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                Image.network(
                    'https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                Image.network(
                    'https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                Image.network(
                    'https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
                Image.network(
                    'https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg'),
              ],
            ),
          )
        ]),
      ),
    ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class buildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: drawer()
    );
  }
}

// ignore: camel_case_types
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
                            color: Colors.white),
                      ),
                    ),
                  ),
                  height: 50.0,
                ),
                SizedBox(
                  width: 50.0,
                ),
                InkWell(
                  child: Text(
                    'Upcoming',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
                InkWell(
                  child: Text(
                    'Kids',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
                InkWell(
                  child: Text(
                    'Clasics',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
                InkWell(
                  child: Text(
                    'Spanish movies',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
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
