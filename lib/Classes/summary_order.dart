import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/login/login.dart';

class summary_order extends StatefulWidget {

  @override
  _summary_orderState createState() => _summary_orderState();
}

enum tarjetas { visa, paypal, mastercard }

class _summary_orderState extends State<summary_order> {
  var movieName = 'Fast & Furious 9';
  var date = 'Thursday 18/03';
  var room = '10';
  var at = '19:30';
  var numberOfTickets = '3';
  var price = '25,90';
  var total = '25,90';
  var checkboxCard = false;
  tarjetas _character = tarjetas.visa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[

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
                        ),alignment: Alignment.topLeft,
                      ),

                      Container(
                        child: Text(
                          'Summary order',
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

                ///////////////////////////////////////////////
                //Container padre, es el cuadro de los bordes//
                ///////////////////////////////////////////////

                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: <Widget>[

                      Container(
                        child: Text(
                          'Sumary of your order',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white
                          ),
                        ),
                      ),

                        //////////////////////////////////////
                        //Container con el nombre de la peli//
                        //////////////////////////////////////

                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            movieName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),

                        ////////////////////////////////////
                        //Container con la date de la peli//
                        ////////////////////////////////////

                       Container(
                         margin: EdgeInsets.only(top: 10),
                         alignment: Alignment.topLeft,
                         child: Row(
                           children: <Widget> [
                             Text(
                               'Date: ',
                               style: TextStyle(
                                   fontSize: 13.5,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white
                               ),
                             ),
                             Text(
                               date,
                               style: TextStyle(
                                   fontSize: 13.5,
                                   fontWeight: FontWeight.normal,
                                   color: Colors.white
                               ),
                             ),
                           ]
                         ),
                       ),

                        ////////////////////////////////////
                        //Container con la room de la peli//
                        ////////////////////////////////////

                        Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: Row(
                              children: <Widget> [
                                Text(
                                  'Room: ',
                                  style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                                Text(
                                  room,
                                  style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white
                                  ),
                                ),
                              ]
                          ),
                        ),

                        ////////////////////////////////////
                        //Container con la hora de la peli//
                        ////////////////////////////////////

                        Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: Row(
                              children: <Widget> [
                                Text(
                                  'At: ',
                                  style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                                Text(
                                  at,
                                  style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white
                                  ),
                                ),
                              ]
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            'Your tickets',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20
                            ),
                          ),
                        ),

                        Row(
                          children: <Widget> [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 10, left: 50),
                                child: Text(
                                  'X' + numberOfTickets + ' tickets',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16
                                  ),
                                ),
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 10, right: 50),
                                alignment: Alignment.topCenter,
                                child: Text(
                                  price + '€',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            'Your food order',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20
                            ),
                          ),
                        ),

                        Row(
                            children: <Widget> [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10, left: 50),
                                  child: Text(
                                    'X1 Children\'s menu',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16
                                    ),
                                  ),
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10, right: 50),
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    price + '€',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),

                        Row(
                            children: <Widget> [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10, left: 50),
                                  child: Text(
                                    'X1 Full Menu ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16
                                    ),
                                  ),
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10, right: 50),
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    price + '€',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),

                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Text(
                                'Apply your discounts',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                              ),
                            ),

                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 50, left: 15, right: 15),
                                child: TextField(
                                  focusNode: FocusNode(),
                                  enableInteractiveSelection: false,
                                  obscureText: true,

                                ),
                              ),
                            )

                          ],
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 40, bottom: 10, right: 10),
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Total: ' + total + '€',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        dense:true,
                        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
                        title: const Text('Visa', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                        leading: Radio<tarjetas>(
                          value: tarjetas.visa,
                          groupValue: _character,
                          onChanged: (tarjetas value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),

                      ListTile(
                        dense:true,
                        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
                        title: const Text('Paypal', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                        leading: Radio<tarjetas>(
                          value: tarjetas.paypal,
                          groupValue: _character,
                          onChanged: (tarjetas value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),

                      ListTile(
                        dense:true,
                        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
                        title: const Text('MasterCard',  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                        leading: Radio<tarjetas>(
                          value: tarjetas.mastercard,
                          groupValue: _character,
                          onChanged: (tarjetas value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                    margin: EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
                    constraints: BoxConstraints.tightFor(height: 40, width: double.infinity),
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => login()))
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'UbuntuMedium'
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                              color: Colors.white,
                              width: 1
                          )
                      ),

                    ),
                  )
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
