
import 'package:flutter/material.dart';
import 'const.dart';

class SearchBar extends StatelessWidget {
 final String hint ;
  
  SearchBar({this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: MediaQuery.of(context).size.width * .80,
      height: 40.0,
      decoration: kRoundedFadedBorder,
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            style: TextStyle(fontSize: 20, color: Colors.white),
            maxLines: 1,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: hint,
                labelStyle: TextStyle(color: Colors.white)),
          )),
          IconButton(
              icon: Icon(
                Icons.search,
                size: 25.0,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
