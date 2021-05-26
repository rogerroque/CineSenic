import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/main.dart';

class points extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CSC Points",),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromRGBO(75, 75, 75, 1.0), Colors.black],
                  stops: [0.3,0.7],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter
              )
          ),
          height: MediaQuery.of(context).size.height
          ,
          child: Column(
            children: <Widget> [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 50),
                child: Text("CSC Points", style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  color: Colors.white
                ),),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text("160", style: TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(236, 179, 5, 1.0),
                ),),
              ),

              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Divider(
                  color: Colors.white,
                  thickness: 1.0,
                ),
              ),

              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width / 1.15,
                  child: Text("Puedes conseguir CSC points mediante tus compras \n\n" +
                      "La cantidad de puntos que recibiras dependera de la cantidad de dinero que gastes en una compra \n\n" +
                      "Estos puntos nunca caducan, y puedes usarlos para canjear entradas o tener algun otro tipo de descuento",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
