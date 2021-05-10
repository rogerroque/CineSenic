import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_app/Classes/menu.dart';
import 'package:login_app/components/calendar_day.dart';
import 'package:login_app/components/cienma_seat.dart';
import 'package:login_app/components/show_time.dart';
import 'package:login_app/components/const.dart';
import 'package:login_app/main/home.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BuyTicket extends StatelessWidget {
  var title;
  var price;
  var director;
  var actor;
  var synopsis;
  var videoURL;

  int day0 = DateTime.now().day;
  int day1 = DateTime.now().day + 1;
  int day2 = DateTime.now().day + 2;
  int day3 = DateTime.now().day + 3;
  int day4 = DateTime.now().day + 4;

  BuyTicket(this.title, this.price, this.director, this.actor, this.synopsis,
      this.videoURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1270,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * .12,
                        height: MediaQuery.of(context).size.width * .12,
                        decoration: kRoundedFadedBorder,
                        child: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_left,
                              size: 28.0,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .75,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.5,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: videoURL,
                        flags: YoutubePlayerFlags(
                            autoPlay: true, hideControls: true),
                      ),
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.white,
                    )),
                // ESTO ES LO QUE TIENES QUE DECORAR ROQUE,
                // DESDE AQUI HASTA LA LINEA 166, ES LO DEL DIRECTOR, ACTOR, SINOPSIS,
                // ENCIMA DE ESTO ESTA EL VIDEO DE YOUTUBE POR SI QUIERES TOQUETEAR TODO
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "\nDirector",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    director + "\n",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                        color: Colors.white),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Actores",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    actor + "\n",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                        color: Colors.white),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Synopsis",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    synopsis + "\n",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  width: MediaQuery.of(context).size.width * .98,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      topLeft: Radius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          CalendarDay(
                            dayNumber: day0.toString(),
                            dayAbbreviation:
                                DateFormat('E').format(DateTime.now()),
                            isActive: true,
                          ),
                          CalendarDay(
                            dayNumber: day1.toString(),
                            dayAbbreviation: DateFormat('E')
                                .format(DateTime.now().add(Duration(days: 1))),
                          ),
                          CalendarDay(
                            dayNumber: day2.toString(),
                            dayAbbreviation: DateFormat('E')
                                .format(DateTime.now().add(Duration(days: 2))),
                          ),
                          CalendarDay(
                            dayNumber: day3.toString(),
                            dayAbbreviation: DateFormat('E')
                                .format(DateTime.now().add(Duration(days: 3))),
                          ),
                          CalendarDay(
                            dayNumber: day4.toString(),
                            dayAbbreviation: DateFormat('E')
                                .format(DateTime.now().add(Duration(days: 4))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      ShowTime(
                        time: '16:00',
                        price: 5,
                        isActive: false,
                      ),
                      ShowTime(
                        time: '17:00',
                        price: 10,
                        isActive: false,
                      ),
                      ShowTime(
                        time: '18:00',
                        price: 10,
                        isActive: false,
                      ),
                      ShowTime(
                        time: '19:00',
                        price: 10,
                        isActive: false,
                      ),
                      ShowTime(
                        time: '20:00',
                        price: 15,
                        isActive: false,
                      ),
                    ],
                  ),
                ),
                Center(child: Image.asset('assets/images/screen.png')),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      // First Seat Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                        ],
                      ),
                      // Second Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                        ],
                      ),
                      // Third  Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                        ],
                      ),
                      // 4TH Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                        ],
                      ),
                      // 5TH Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                        ],
                      ),
                      // 6TH Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                        ],
                      ),
                      // final Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20) * 2,
                          ),
                          CienmaSeat(),
                          CienmaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text(
                          price + "€",
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            color: kActionColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0))),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => menu()),
                              );
                            },
                            child: Text('Continue',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
