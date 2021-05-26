import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_app/Classes/menu.dart';
import 'package:login_app/components/butacas.dart';
import 'package:login_app/components/calendar_day.dart';
import 'package:login_app/components/purchasemodel.dart';
import 'package:login_app/components/show_time.dart';
import 'package:login_app/components/const.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BuyTicket extends StatefulWidget {
  var title;
  var price;
  var director;
  var actor;
  var synopsis;
  var time;
  var videoURL;
  var date;
  var image;
  BuyTicket(this.title, this.price, this.director, this.actor, this.synopsis, this.videoURL, this.image);

  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  int day0 = DateTime.now().day;
  int day1 = DateTime.now().day + 1;
  int day2 = DateTime.now().day + 2;
  int day3 = DateTime.now().day + 3;
  int day4 = DateTime.now().day + 4;
  var selected = {};
  var menuSelected = {};

  @override
  Widget build(BuildContext context) {
    Provider.of<PurchaseModel>(context, listen: false).selected = selected;
    Provider.of<PurchaseModel>(context, listen: false).date = day0.toString() + " " + DateFormat('EEEE').format(DateTime.now());
    Provider.of<PurchaseModel>(context, listen: false).time = "15:00";
    Provider.of<PurchaseModel>(context, listen: false).pay = 0;
    Provider.of<PurchaseModel>(context, listen: false).menuSelected = menuSelected;
    Provider.of<PurchaseModel>(context, listen: false).setData(widget.title, widget.price);
    Butacas butacas = Butacas(price: widget.price, selected: selected);

    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(0, 0, 0, 1.0),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Consumer<PurchaseModel>(
                    builder: (context, pay, child) {
                      return Text(
                        pay.pay.toString() + " €",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      );
                    }),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width >= 720 ? 60 : 25, vertical: MediaQuery.of(context).size.height >= 1280 ? 15 : 6),
                decoration: BoxDecoration(

                    color: kActionColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0))),
                child: InkWell(
                    onTap: () => {
                      Provider.of<PurchaseModel>(context, listen: false).getButacasSelected(selected),
                      Provider.of<PurchaseModel>(context, listen: false).getMovieData(widget.title, widget.image),
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => menu()))
                    },
                    child: Text('Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color.fromRGBO(75, 75, 75, 1.0), Colors.black],
                    stops: [0.3,0.7],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter
                )
            ),
            margin: EdgeInsets.only(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[

                Container(
                  margin: EdgeInsets.only(top: 0),
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
                  height: 85,
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  width: MediaQuery.of(context).size.width * .98,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.center,
                    colors: [
                     Color.fromRGBO(236, 179, 5, 1.0),
                      Colors.yellow[800]
                    ],
                  )
                  ,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: SeleccionFechas(day0: day0, butacas: butacas),
                  ),
                ),
                Container(
                  height: 120,
                  child: SeleccionHoras(widget: widget, butacas: butacas),
                ),
                Center(child: Image.asset('assets/images/screen.png')),
                butacas,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SeleccionHoras extends StatefulWidget {
  const SeleccionHoras({
    Key key,
    @required this.widget, this.butacas,
  }) : super(key: key);

  final Butacas butacas;
  final BuyTicket widget;

  @override
  _SeleccionHorasState createState() => _SeleccionHorasState();
}

class _SeleccionHorasState extends State<SeleccionHoras> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Row(
          children: <Widget>[
            ShowTime(
              isActive: index == selected,
              time: (15 + index).toString() + ":00",
              price: widget.widget.price,
                onSelect: () {
                  setState(() {
                    widget.butacas.refresh();
                    Provider.of<PurchaseModel>(context, listen: false).getTime((15 + index).toString() + ":00");
                    this.selected = index;
                  });
                }
            )
          ],
        );
      },
    );
  }
}

class SeleccionFechas extends StatefulWidget {
  const SeleccionFechas({
    Key key,
    @required this.day0, this.butacas,
  }) : super(key: key);

  final Butacas butacas;
  final int day0;

  @override
  _SeleccionFechasState createState() => _SeleccionFechasState();
}

class _SeleccionFechasState extends State<SeleccionFechas> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Row(
          children: <Widget>[
            CalendarDay(
              isActive: index == selected,
              dayNumber: (widget.day0 + index).toString(),
              dayAbbreviation: DateFormat('E').format(DateTime.now().add(Duration(days: index))),
              onSelect: () {
                setState(() {
                  widget.butacas.refresh();
                  Provider.of<PurchaseModel>(context, listen: false).getDate((widget.day0 + index).toString() + " " + DateFormat('EEEE').format(DateTime.now().add(Duration(days: index))));
                  this.selected = index;
                });
              }
            ),
          ],
        );
      },
    );
  }
}
