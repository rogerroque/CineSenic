import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  var peliculaClicada = "ninguna";

  var pelis = [
    'https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg',
    'https://playmax.xyz/img/c/400/1/1527927502/494.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/91bBsCoK0rL._AC_SL1500_.jpg',
    'https://ohsmagnet.com/wp-content/uploads/2019/04/unnamed-607x900.jpg',
    'https://cdn11.bigcommerce.com/s-cw25miz5h3/images/stencil/1280x1280/products/286559/315166/9780241371664__95157.1560949081.jpg?c=2',
    'https://i.pinimg.com/736x/44/80/b4/4480b4f6b88dc61359a7c33d9a3fb02a.jpg',
    'https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg',
    'https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg',
    'https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg',
    'https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg',
    'https://pics.filmaffinity.com/Fast_Furious_8-817339169-large.jpg',
  ];
  
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
        body: Stack(children: <Widget>[

          Positioned(
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => scaffoldKey.currentState.openDrawer(),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Text(peliculaClicada,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              )
          ),
          Container(
              margin: const EdgeInsets.only(top: 100.0),
              child: homeGenereMovieSelection()),
          ListaDeAlgo(
              pelis: pelis,
              cuandoCliquenEnUnElemento: (elemento){
                setState(() {
                  peliculaClicada = elemento;
                });
              })
        ]),
      ),
      debugShowCheckedModeBanner: false,
    ));
  }
}

class ListaDeAlgo extends StatefulWidget {
  const ListaDeAlgo({
    Key key,
    @required this.pelis,
    this.cuandoCliquenEnUnElemento
  }) : super(key: key);

  final List<String> pelis;
  final cuandoCliquenEnUnElemento;

  @override
  _ListaDeAlgoState createState() => _ListaDeAlgoState();
}

class _ListaDeAlgoState extends State<ListaDeAlgo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
      child: ListView.builder(
        itemCount: widget.pelis.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: () => {
              widget.cuandoCliquenEnUnElemento(widget.pelis[index])
            },
            child: Image.network(widget.pelis[index]),
          );
        },
      ),
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
