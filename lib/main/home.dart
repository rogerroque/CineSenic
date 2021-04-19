import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/red_rounded_action_button.dart';
import 'package:login_app/components//const.dart';
import 'package:login_app/main/buy_ticket.dart';
import 'package:login_app/components/background_gradient_image.dart';
import 'package:login_app/components/movie_app_bar.dart';
import 'package:login_app/components/primary_rounder_button.dart';
import 'package:login_app/components/model.dart';

class home extends StatefulWidget {
  int index = 1;
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    List<Movie> movies;

    void _loadMovies() {
      FirebaseFirestore.instance.collection("Peliculas").get().then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          movies = [
            Movie(
              title: result.get("Name"),
              categories: result.get("Gender"),
              imageURL: result.get("Img"),
              logo: result.get("Logo"),
              rating: result.get("Rating"),
              date: result.get("Year"),
            )
          ];
          print(result.get("Name"));
          print(result.get("Gender"));
          print(result.get("Img"));
          print(result.get("Logo"));
          print(result.get("Rating"));
          print(result.get("Year"));
        });
      });
    }

    final String backgroundImage = movies[widget.index].imageURL;
    final String rating = movies[widget.index].rating.toString();
    final String year = movies[widget.index].date.year.toString();
    final String categories = movies[widget.index].categories;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BackgroundGradientImage(
            image: Image.network(
              backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10.0)),
                MovieAppBar(),
                Padding(padding: EdgeInsets.symmetric(vertical: 50.0)),
                Image.asset(movies[widget.index].logo),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    PrimaryRoundedButton(
                      text: rating,
                      callback: () {
                        _loadMovies();
                      },
                    ),
                  ],
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        year,
                        style: kSmallMainTextStyle,
                      ),
                      Text('•', style: kPromaryColorTextStyle),
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
                              BuyTicket(movies[widget.index].title),
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
          ),
        ],
      ),
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
        Padding(
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
        Text(active ? title : '',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),

      ],
    );
  }
}


