
import 'package:flutter/material.dart';

import 'const.dart';

class CinemaSeat extends StatefulWidget {
  bool isReserved;
  bool isSelected;
  var onTap2;
  var butaca;

  CinemaSeat({this.isSelected = false, this.isReserved, this.onTap2, this.butaca});

  @override
  _CinemaSeatState createState() => _CinemaSeatState();
}

class _CinemaSeatState extends State<CinemaSeat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          !widget.isReserved ? widget.isSelected = !widget.isSelected : null;
          widget.onTap2(widget.isReserved, widget.isSelected, widget.butaca);
        });
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
          width: MediaQuery.of(context).size.width / 15,
          height: MediaQuery.of(context).size.width / 15,
          decoration: BoxDecoration(
              color: widget.isSelected ? kPimaryColor : widget.isReserved ? Colors.white : null,
              border: !widget.isSelected && !widget.isReserved ? Border.all(color: Colors.white, width: 1.0) : null,
              borderRadius: BorderRadius.circular(5.0))),
    );
  }
}