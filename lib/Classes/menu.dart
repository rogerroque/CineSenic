import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:login_app/Classes/summary_order.dart';
import 'package:login_app/components/const.dart';
import 'package:login_app/components/menumodel.dart';
import 'package:login_app/components/purchasemodel.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable, camel_case_types
class menu extends StatefulWidget {
  int index = 0;

  @override
  _menu createState() => _menu();
}
class _menu extends State<menu> {
  var title = "Menus";
  var menuSelected = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 49,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kBackgroundColor,
        ),
        child: Container(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Consumer<PurchaseModel>(
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
                            onTap: () => {
                              Provider.of<PurchaseModel>(context, listen: false).getMenusSelected(menuSelected),
                              Navigator.push(context, MaterialPageRoute(builder: (context) => summary_order()))
                            },
                            child: Text('Continue',
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
            ),
          ),
        ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
          title: Text('Menus'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color.fromRGBO(75, 75, 75, 1.0), Colors.black],
                        stops: [0.3,0.7],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[

                    GridView.builder(
                      primary: false,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(10),
                      itemCount: menus.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 40,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            child: Column(
                              children: [
                                Expanded(
                                  child :Container(
                                    child: Image(
                                      image: NetworkImage(menus[index].imageURL),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        icon: Padding(
                                          child: Align(
                                            child: Icon(
                                              Icons.add_circle_outline,
                                              size: 30.0,
                                            ),
                                            alignment: Alignment.centerLeft,
                                          ),
                                          padding: const EdgeInsets.only(left: 12),

                                        ),
                                        onPressed: () {
                                          setState(() {
                                            menus[index].contador++;
                                            Provider.of<PurchaseModel>(context, listen: false).add(double.parse(menus[index].price));
                                            menuSelected[menus[index].name] = menus[index].contador;
                                            print(menuSelected);
                                          });
                                        }
                                    ),
                                    IconButton(
                                        icon: Padding(
                                          child: Align(
                                            child: Icon(
                                              Icons.remove_circle_outline,
                                              size: 30.0,
                                            ),
                                            alignment: Alignment.centerLeft,
                                          ),
                                          padding: const EdgeInsets.only(left: 0),

                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if(menus[index].contador > 0){
                                              menus[index].contador--;
                                              Provider.of<PurchaseModel>(context, listen: false).remove(double.parse(menus[index].price));
                                              menuSelected[menus[index].name] = menus[index].contador;
                                              if (menus[index].contador == 0) {
                                                menuSelected.remove(menus[index].name);
                                              }
                                              print(menuSelected);
                                            }
                                          });
                                        }
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Text(
                                          menus[index].contador.toString(),
                                          style: TextStyle( fontSize: 30 ,color: Colors.white),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                        );
                      },
                    ),

                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}

