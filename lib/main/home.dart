import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Classes/drawer.dart';
import 'package:login_app/components//const.dart';
import 'package:login_app/components/background_gradient_image.dart';
import 'package:login_app/components/moviemodel.dart';
import 'package:login_app/components/primary_rounder_button.dart';
import 'package:login_app/components/red_rounded_action_button.dart';
import 'package:login_app/components/reservasmodel.dart';
import 'package:login_app/main/buy_ticket.dart';

// ignore: must_be_immutable, camel_case_types
class home extends StatefulWidget {
  int index = 0;

  @override
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  final homeKey = GlobalKey<_homeState>();

  @override
  Widget build(BuildContext context) {

    void reserves() {
      reservas.clear();
      FirebaseFirestore.instance
          .collection("Reservas")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          if (result.get("uid") == FirebaseAuth.instance.currentUser.uid) {
            reservas.add(
                new Reservas(
                    movieName: result.get("movieName"),
                    butacas: result.get("butaca"),
                    date: result.get("date"),
                    time: result.get("time"),
                    menus: result.get("menus"),
                    total: result.get("total").toString(),
                    cscpoints: result.get("points"),
                    imageUrl: result.get("image")
                )
            );
            print(result.get("movieName"));
          }
        });
      });
    }

    final String backgroundImage = movies[widget.index].imageURL;
    final String logoImage = movies[widget.index].logo;
    final String rating = movies[widget.index].rating.toString();
    final String year = movies[widget.index].date.year.toString();
    final String categories = movies[widget.index].categories;
    var drawerKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      /*resizeToAvoidBottomInset: false,*/
      key: drawerKey,
      drawer: buildDrawer(),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget> [

              Stack(
                key: homeKey,
                fit: StackFit.expand,
                children: <Widget>[
                  BackgroundGradientImage(
                    image: Image.network(
                      backgroundImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.all(10.0)),

                      /*MovieAppBar(),*/
                      Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                      Image.network(logoImage, height: 120),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          PrimaryRoundedButton(
                            text: rating,
                            callback: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              year,
                              style: kSmallMainTextStyle,
                            ),
                            Text('???', style: kPromaryColorTextStyle),
                            Text(categories, style: kSmallMainTextStyle),
                          ],
                        ),
                      ),
                      Image.asset('assets/images/divider.png'),
                      RedRoundedActionButton(
                          text: 'BUY TICKET',
                          callback: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BuyTicket(
                                        movies[widget.index].title,
                                        movies[widget.index].price,
                                        movies[widget.index].director,
                                        movies[widget.index].actor,
                                        movies[widget.index].synopsis,
                                        movies[widget.index].videoURL,
                                        movies[widget.index].imageURL
                                    ),
                              ),
                            );
                          }),
                      Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: movies.length,
                              itemBuilder: (context, index) {
                                return MovieCard(
                                    title: movies[index].title,
                                    imageLink: movies[index].imageURL,
                                    active: index == widget.index ? true : false,
                                    callBack: () {
                                      setState(() {
                                        widget.index = index;
                                      });
                                    });
                              })),
                            ],
                          ),
                        ],
                      ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 5),
                child: Row(
                    children: <Widget> [
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.white),
                        onPressed: () => {
                            reserves(),
                            drawerKey.currentState.openDrawer(),
                        }
                      ),

                      /*SearchBar(hint: 'Search Movies..',),*/
                    ]
                ),
              ),],
    ),
    ),
      ),
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

class MovieCard extends StatelessWidget {
  final String imageLink;
  final String title;
  final Function callBack;
  final bool active;

  MovieCard(
      {@required this.title,
      @required this.imageLink,
      @required this.callBack,
      @required this.active});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(active ? title : '',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width >= 720 ? 28.0 : 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: InkWell(
              onTap: callBack,
              child: SizedBox(
                width: active
                    ? MediaQuery.of(context).size.width / 3
                    : MediaQuery.of(context).size.width / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.network(imageLink),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
