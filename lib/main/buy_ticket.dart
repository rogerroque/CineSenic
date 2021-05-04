import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_app/components/calendar_day.dart';
import 'package:login_app/components/cinema_seat.dart';
import 'package:login_app/components/show_time.dart';
import 'package:login_app/components/const.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BuyTicket extends StatefulWidget {
  var title;
  var price;
  var director;
  var actor;
  var synopsis;
  var videoURL;

  BuyTicket(this.title, this.price, this.director, this.actor, this.synopsis, this.videoURL);

  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  var pay = "0";
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  int day0 = DateTime.now().day;
  int day1 = DateTime.now().day + 1;
  int day2 = DateTime.now().day + 2;
  int day3 = DateTime.now().day + 3;
  int day4 = DateTime.now().day + 4;

  var selected = {};

  @override
  Widget build(BuildContext context) {

    Future<void> _updatePay() async {
      setState(() {
        pay = (widget.price * selected.length).toString();
      });
    }
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          size: 28.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: widget.videoURL,
                      flags: YoutubePlayerFlags(
                          autoPlay: false, hideControls: false),
                    ),
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 10),
                  child: Column(
                    children: <Widget>[
                      /*DIRECTOR*/

                      Container(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        margin: EdgeInsets.only(bottom: 15),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Director: ',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.director,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),

                      /*DIRECTOR*/

                      Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Actors: ',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.actor,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Synopsis: ',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 50),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.synopsis,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  width: MediaQuery.of(context).size.width * .98,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
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
                            isActive: false,
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
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("Filas")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return Column(
                          children: snapshot.data.docs.map((document) {
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: (MediaQuery.of(context).size.width / 20),),
                                  for (var i = 0; i <= document.data()['ButacasIzq'] - 1; i++)
                                    CinemaSeat(butaca: "fila-izq" + document.id + "butaca" + (i+1).toString(), isSelected: selected.containsKey( "fila-izq" + document.id + "butaca" + (i+1).toString()), onTap2: (isSelected, butaca) {
                                      if(isSelected) {
                                        selected[butaca] = true;
                                        print(selected);
                                      } else {
                                        selected.remove(butaca);
                                        print(selected);
                                      }
                                      _updatePay();
                                      print(pay);
                                    },),
                                  SizedBox(width: (MediaQuery.of(context).size.width / 20) * 2,),
                                  for (var i = 0; i <= document.data()['ButacasDer'] - 1; i++)
                                    CinemaSeat(butaca: "fila-der" + document.id + "butaca" + (i+1).toString(), isSelected: selected.containsKey( "fila-der" + document.id + "butaca" + (i+1).toString()), onTap2: (isSelected, butaca) {
                                      if(isSelected) {
                                        selected[butaca] = true;
                                        print(selected);
                                      } else {
                                        selected.remove(butaca);
                                        print(selected);
                                      }
                                      _updatePay();
                                      print(pay);
                                    },),
                                  SizedBox(width: (MediaQuery.of(context).size.width / 20),),
                                ]
                            );
                          }).toList(),
                        );
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text(
                          pay + "€",
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 10.0
                        ),
                        decoration: BoxDecoration(
                            color: kActionColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0)
                            )
                        ),
                        child: InkWell(
                            child: Text('Pay',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold
                                )
                            )
                        ),
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
