import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/purchasemodel.dart';
import 'package:provider/provider.dart';
import 'cinema_seat.dart';

class Butacas extends StatefulWidget {
  var price;
  var selected = {};

  final _butacaState bs = new _butacaState();

  void refresh() {
    bs.refresh();
  }
  Butacas({this.price, this.selected});

  @override
  _butacaState createState() => bs;
}

class _butacaState extends State<Butacas> {
  var butacasReservadas = {};
  var butacas = {};

  void refresh() {
    setState(() {
      Provider.of<PurchaseModel>(context, listen: false).remove(widget.price * Provider.of<PurchaseModel>(context, listen: false).selected.length);
      Provider.of<PurchaseModel>(context, listen: false).selected.clear();
      butacasReservadas.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    void reserves() {
      FirebaseFirestore.instance
          .collection("Reservas")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          print(result.get("date"));
          print(Provider.of<PurchaseModel>(context, listen: false).date);
          if (result.get("date") ==  Provider.of<PurchaseModel>(context, listen: false).date && result.get("time") ==  Provider.of<PurchaseModel>(context, listen: false).time && result.get("movieName") ==  Provider.of<PurchaseModel>(context, listen: false).movieName) {
          butacas = result.get("butaca");
          for (var entry in butacas.entries) {
            butacasReservadas[entry.key] = entry.value;
          }
          }
        });
      });
    }

    bool isReserved(String butaca) {
      for (var entry in butacasReservadas.entries) {
        if (entry.key == butaca) {
          print("Base de Datos => " + entry.key);
          print("Bucle Cinemaseat => " + butaca);
          return true;
        }
      }
      return false;
    }

    return Padding(
      padding: EdgeInsets.all(5.0),
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Filas").snapshots(),
          builder: (context, snapshot) {
            reserves();
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
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                      for (var i = 0; i <= document.data()['ButacasIzq'] - 1; i++)
                        CinemaSeat(butaca: "fila-izq: " + document.id + " butaca: " + (i + 1).toString(), isReserved: isReserved("fila-izq: " + document.id + " butaca: " + (i + 1).toString()), isSelected: widget.selected.containsKey("fila-izq: " + document.id + " butaca: " + (i + 1).toString()), onTap2: (isReserved, isSelected, butaca) {
                          if (isReserved == false) {
                            if (isSelected) {
                              widget.selected[butaca] = true;
                              print(widget.selected);
                              Provider.of<PurchaseModel>(context, listen: false)
                                  .add(widget.price);
                            } else {
                              widget.selected.remove(butaca);
                              print(widget.selected);
                              Provider.of<PurchaseModel>(context, listen: false)
                                  .remove(widget.price);
                            }
                          }
                          },
                        ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      for (var i = 0; i <= document.data()['ButacasDer'] - 1; i++)
                        CinemaSeat(butaca: "fila-der: " + document.id + " butaca: " + (i + 1).toString(), isReserved: isReserved("fila-der: " + document.id + " butaca: " + (i + 1).toString()), isSelected: widget.selected.containsKey("fila-der: " + document.id + " butaca: " + (i + 1).toString()), onTap2: (isReserved, isSelected, butaca) {
                          if (isReserved == false) {
                            if (isSelected) {
                              widget.selected[butaca] = true;
                              print(widget.selected);
                              Provider.of<PurchaseModel>(context, listen: false)
                                  .add(widget.price);
                            } else {
                              widget.selected.remove(butaca);
                              print(widget.selected);
                              Provider.of<PurchaseModel>(context, listen: false)
                                  .remove(widget.price);
                            }
                          }
                          },
                        ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                    ]);
              }).toList(),
            );
          }),
    );
  }
}
