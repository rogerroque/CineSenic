import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/promotionsmodel.dart';

class promotions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promotions"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(

              children: <Widget>[

                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: promotionsList.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 80,
                        color: Colors.yellow[600],
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: Container(
                              padding: EdgeInsets.only(right: 10, bottom: 10),
                              child: Text("Code: " + promotionsList[index].code, style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white
                              ),)
                          ),
                        )
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
