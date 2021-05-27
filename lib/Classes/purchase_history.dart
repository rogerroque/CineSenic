import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/reservasmodel.dart';


class purchase_history extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Purchase history"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height + 150,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color.fromRGBO(75, 75, 75, 1.0), Colors.black],
                    stops: [0.3,0.7],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter
                )
            ),

            padding: EdgeInsets.only(right: 10, left: 10),
            child: Column(
              children: <Widget>[

                /*BACK ARROW*/
                ListView.builder(
                  primary: false,
                    scrollDirection: Axis.vertical,
                    itemCount: reservas.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      print(reservas[index].imageUrl);
                      return Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.150), BlendMode.dstATop),
                            image: NetworkImage(reservas[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0),
                              topLeft: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0)),
                      ),
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    reservas[index].movieName,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      reservas[index].date,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(top: 15),
                                      child: Text(
                                        'Time: ' + reservas[index].time,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Tickets: ' + reservas[index].butacas.length.toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 40),
                                    child: Text(
                                      'Menus: ' + reservas[index].menus.length.toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'Total: ' + reservas[index].total,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
