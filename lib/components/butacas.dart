import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/paymodel.dart';
import 'package:provider/provider.dart';
import 'cinema_seat.dart';
import 'const.dart';

class Butacas extends StatefulWidget {
  var price;
  var selected = {};


  Butacas({this.price, this.selected});

  @override
  _butacaState createState() => _butacaState();
}

class _butacaState extends State<Butacas> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
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

                if (snapshot.connectionState == ConnectionState.waiting) {
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
                            CinemaSeat(butaca: "fila-izq: " + document.id + " butaca: " + (i+1).toString(), isSelected: widget.selected.containsKey( "fila-izq: " + document.id + " butaca: " + (i+1).toString()), onTap2: (isSelected, butaca) {
                              if(isSelected) {
                                widget.selected[butaca] = true;
                                print(widget.selected);
                                Provider.of<PayModel>(context, listen: false).add(widget.price);
                              } else {
                                widget.selected.remove(butaca);
                                print(widget.selected);
                                Provider.of<PayModel>(context, listen: false).remove(widget.price);
                              }
                            },),
                          SizedBox(width: (MediaQuery.of(context).size.width / 20) * 2,),
                          for (var i = 0; i <= document.data()['ButacasDer'] - 1; i++)
                            CinemaSeat(butaca: "fila-der: " + document.id + " butaca: " + (i+1).toString(), isSelected: widget.selected.containsKey( "fila-der: " + document.id + " butaca: " + (i+1).toString()), onTap2: (isSelected, butaca) {
                              if(isSelected) {
                                widget.selected[butaca] = true;
                                print(widget.selected);
                                Provider.of<PayModel>(context, listen: false).add(widget.price);
                              } else {
                                widget.selected.remove(butaca);
                                print(widget.selected);
                                Provider.of<PayModel>(context, listen: false).remove(widget.price);
                              }
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
                child: Consumer<PayModel>(
                  builder: (context, pay, child) {
                    return Text(
                      pay.pay.toString() + " €",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    );
                  }
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
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
    );
  }
}

