import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/purchasemodel.dart';
import 'package:provider/provider.dart';

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
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(

              children: <Widget>[

                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.150), BlendMode.dstATop),
                      image: NetworkImage(Provider.of<PurchaseModel>(context, listen: false).imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: EdgeInsets.only(right: 10, bottom: 10),
                      child: Text("Coupon: ABC123", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white
                      ),)
                    ),
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.150), BlendMode.dstATop),
                      image: NetworkImage(Provider.of<PurchaseModel>(context, listen: false).imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          padding: EdgeInsets.only(right: 10, bottom: 10),
                          child: Text("Coupon: ABC123", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white
                          ),)
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.150), BlendMode.dstATop),
                      image: NetworkImage(Provider.of<PurchaseModel>(context, listen: false).imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          padding: EdgeInsets.only(right: 10, bottom: 10),
                          child: Text("Coupon: ABC123", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white
                          ),)
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
