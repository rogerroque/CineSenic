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
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          size: 28.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'UbuntuMedium',
                          color: Colors.white
                    ),
                    )],
                ),
              ),

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
                            child :Image(
                              image: NetworkImage(menus[index].imageURL),
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
                                    padding: const EdgeInsets.only(left: 12),

                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if(menus[index].contador > 0){
                                        menus[index].contador--;
                                        Provider.of<PurchaseModel>(context, listen: false).remove(double.parse(menus[index].price));
                                        menuSelected[menus[index].name] = menus[index].contador;
                                        print(menuSelected);
                                      }
                                    });
                                  }
                              ),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    child: Text(
                                      menus[index].contador.toString(),
                                      style: TextStyle( fontSize: 30 ,color: Colors.white),
                                    ),
                                    padding: const EdgeInsets.only(left: 40, bottom: 3),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                  );
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
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
                            for (var entry in menuSelected.entries) {
                              if (entry.value == 0) {
                                menuSelected.remove(entry)
                              }
                            },
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
    );
  }
}

