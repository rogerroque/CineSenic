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
                          padding: EdgeInsets.only(right: 10, bottom: 10, top: 10, left: 10),
                          alignment: Alignment.bottomRight,
                          child: Row(
                            children: <Widget> [

                              Container(
                                child: Text(promotionsList[index].name, style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[750]
                                ),),
                              ),

                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Column(
                                      children: <Widget> [
                                        Expanded(
                                          child: Text("Code: " + promotionsList[index].code, style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.grey[650]
                                          ),),
                                        ),
                                        Text("Discount: " + promotionsList[index].percentage.toString() + "%", style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.grey[650]
                                        ),)
                                      ]
                                  ),
                                ),
                              ),
                            ]
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
