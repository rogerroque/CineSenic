import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/purchasemodel.dart';
import 'package:provider/provider.dart';
import 'cinema_seat.dart';

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

    return Padding(
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
                            Provider.of<PurchaseModel>(context, listen: false).add(widget.price);
                          } else {
                            widget.selected.remove(butaca);
                            print(widget.selected);
                            Provider.of<PurchaseModel>(context, listen: false).remove(widget.price);
                          }
                        },),
                      SizedBox(width: (MediaQuery.of(context).size.width / 20) * 2,),
                      for (var i = 0; i <= document.data()['ButacasDer'] - 1; i++)
                        CinemaSeat(butaca: "fila-der: " + document.id + " butaca: " + (i+1).toString(), isSelected: widget.selected.containsKey( "fila-der: " + document.id + " butaca: " + (i+1).toString()), onTap2: (isSelected, butaca) {
                          if(isSelected) {
                            widget.selected[butaca] = true;
                            print(widget.selected);
                            Provider.of<PurchaseModel>(context, listen: false).add(widget.price);
                          } else {
                            widget.selected.remove(butaca);
                            print(widget.selected);
                            Provider.of<PurchaseModel>(context, listen: false).remove(widget.price);
                          }
                        },),
                      SizedBox(width: (MediaQuery.of(context).size.width / 20),),
                    ]
                );
              }).toList(),
            );
          }),
    );
  }
}

