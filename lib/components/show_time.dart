import 'package:flutter/material.dart';

import 'const.dart';

class ShowTime extends StatefulWidget {
  bool isActive;
  final double price;
  final String time;
  var onSelect;

  ShowTime(
      {@required this.time,
      @required this.price,
      this.isActive = false,
      this.onSelect});

  @override
  _ShowTimeState createState() => _ShowTimeState();
}

class _ShowTimeState extends State<ShowTime> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        widget.onSelect();
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 20, bottom: 30),
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.isActive ? kPimaryColor : Colors.white12),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            Text(
              widget.time,
              style: TextStyle(
                  color: widget.isActive ? kPimaryColor : Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            Text('From \$${widget.price}',
                style: TextStyle(color: Colors.white, fontSize: 18.0))
          ],
        ),
      ),
    );
  }
}
