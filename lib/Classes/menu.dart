import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:login_app/components/const.dart';


// ignore: must_be_immutable, camel_case_types

class menu extends StatefulWidget {

  @override
  _menu createState() => _menu();
}
class _menu extends State<menu> {
  var title = "Menus";
  int contador1 = 0;
  int contador2 = 0;
  int contador3 = 0;
  int contador4 = 0;
  int contador5 = 0;
  int contador6 = 0;
  int contador7 = 0;
  int contador8 = 0;
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

              GridView.count(
                primary: false,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 40,
                crossAxisCount: 2,

                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Expanded(
                        child :Image(
                          image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
                                    contador1++;
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
                                    if(contador1 > 0){
                                      contador1--;
                                    }
                                  });
                                }
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  child: Text(
                                    contador1.toString(),
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
                  ),

                  Container(
                      child: Column(
                        children: [
                          Expanded(
                            child :Image(
                              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
                                      contador2++;
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
                                      if(contador2 > 0){
                                        contador2--;
                                      }
                                    });
                                  }
                              ),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    child: Text(
                                      contador2.toString(),
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
                  ),

                  Container(
                      child: Column(
                        children: [
                          Expanded(
                            child :Image(
                              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
                                      contador3++;
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
                                      if(contador3 > 0){
                                        contador3--;
                                      }
                                    });
                                  }
                              ),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    child: Text(
                                      contador3.toString(),
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
                  ),
                  Container(
                      child: Column(
                        children: [
                          Expanded(
                            child :Image(
                              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
                                      contador4++;
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
                                      if(contador4 > 0){
                                        contador4--;
                                      }
                                    });
                                  }
                              ),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    child: Text(
                                      contador4.toString(),
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
                  ),

                  Container(
                      child: Column(
                        children: [
                          Expanded(
                            child :Image(
                              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
                                      contador5++;
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
                                      if(contador5 > 0){
                                        contador5--;
                                      }
                                    });
                                  }
                              ),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    child: Text(
                                      contador5.toString(),
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
                  ),
                  Container(
                      child: Column(
                        children: [
                          Expanded(
                            child :Image(
                              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
                                      contador6++;
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
                                      if(contador6 > 0){
                                        contador6--;
                                      }
                                    });
                                  }
                              ),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    child: Text(
                                      contador6.toString(),
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
                  ),
                  Container(
                      child: Column(
                        children: [
                          Expanded(
                            child :Image(
                              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
                                      contador7++;
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
                                      if(contador7 > 0){
                                        contador7--;
                                      }
                                    });
                                  }
                              ),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    child: Text(
                                      contador7.toString(),
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
                  ),
                  Container(
                      child: Column(
                        children: [
                          Expanded(
                            child :Image(
                              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
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
                                      contador8++;
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
                                      if(contador8 > 0){
                                        contador8--;
                                      }
                                    });
                                  }
                              ),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    child: Text(
                                      contador8.toString(),
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
                  ),
                ],
              )
            ],
          ),
        ),

      ),
    );

  }


}

