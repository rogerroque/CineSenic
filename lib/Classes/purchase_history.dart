import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/reservasmodel.dart';


class purchase_history extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 29, 41, 113),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[

              /*BACK ARROW*/

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
                      ), alignment: Alignment.topLeft,
                    ),

                    Container(
                      child: Text(
                        'Purchase history',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'UbuntuMedium',
                            color: Colors.white
                        ),
                      ),
                    )

                  ],
                ),
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: reservas.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 90,
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Colors.grey,
                            child: Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        reservas[index].movieName,
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                                      Text(
                                        reservas[index].date,
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        reservas[index].time,
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                                      Text(
                                        reservas[index].butacas.length.toString() + "X tickets",
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        reservas[index].total,
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                                      Text(
                                        reservas[index].menus.length.toString() + "X menus",
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
