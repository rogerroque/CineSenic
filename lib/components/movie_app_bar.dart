/*

import 'package:flutter/material.dart';
import 'package:login_app/Classes/drawer.dart';
import 'search_bar.dart';
import 'const.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // todo: convert this to it's own widget
        Container(
          width: MediaQuery.of(context).size.width * .15,
          height: 60.0,
          decoration: kRoundedFadedBorder,
          child:
              IconButton(icon: Icon(Icons.menu), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => drawer()));
              }),
        ),
        SearchBar(hint: 'Search Movies..'),
      ],
    );
  }
}

class buildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: drawer()
    );
  }
}
*/
