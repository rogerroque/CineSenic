import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Classes/making_payment_alert_dialog.dart';
import 'package:login_app/components/purchasemodel.dart';
import 'package:provider/provider.dart';

class payment_method extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future<void> reserved() {
      return FirebaseFirestore.instance.collection("Reservas").add({
        'butaca': Provider.of<PurchaseModel>(context, listen: false).selected,
        'menus' : Provider.of<PurchaseModel>(context, listen: false).menuSelected,
        'movieName' : Provider.of<PurchaseModel>(context, listen: false).movieName,
        'date' : Provider.of<PurchaseModel>(context, listen: false).date,
        'time' : Provider.of<PurchaseModel>(context, listen: false).time,
        'total' : Provider.of<PurchaseModel>(context, listen: false).pay,
        'uid' : FirebaseAuth.instance.currentUser.uid
      });
    }

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
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
                            'Payment method',
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

                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text('Paymeny methodd', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  ),

                  Container(
                    margin: const EdgeInsets.only(right: 25.0, left: 25.0, top: 50),
                    width: double.infinity,
                    child: TextField(
                      obscureText: false,
                      decoration: new InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                          ),
                          labelText: 'Card Owner',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25.0, left: 25.0, top: 50),
                    width: double.infinity,
                    child: TextField(
                      obscureText: false,
                      decoration: new InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                          ),
                          labelText: 'Card number',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25.0, left: 25.0, top: 50),
                    width: double.infinity,
                    child: TextField(
                      obscureText: false,
                      decoration: new InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                          ),
                          labelText: 'Security code',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25.0, left: 25.0, top: 50),
                    width: double.infinity,
                    child: TextField(
                      obscureText: false,
                      decoration: new InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                          ),
                          labelText: 'Expiration code',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          )),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  Container(
                      margin: EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
                      constraints: BoxConstraints.tightFor(height: 40, width: double.infinity),
                      child: ElevatedButton(
                        onPressed: () => {
                          reserved(),
                          showDialog(context: context, builder: (context) => payment_alert_dialog())
                          /*Navigator.push(context, MaterialPageRoute(builder: (context) => payment_alert_dialog()))*/
                        },
                        child: Text(
                          'Finalize purchase',
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
      ),
    );
  }
}
