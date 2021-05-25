import 'package:flutter/material.dart';
import 'const.dart';

class CalendarDay extends StatefulWidget {
  final String dayAbbreviation;
  final String dayNumber;
  bool isActive;
  var onSelect;

  CalendarDay(
      {@required this.dayNumber, this.dayAbbreviation, this.isActive = false, this.onSelect});

  @override
  _CalendarDayState createState() => _CalendarDayState();
}

class _CalendarDayState extends State<CalendarDay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 15),
        child: InkWell(
          onTap: () {
            widget.onSelect();
            // setState(() {
            //   widget.isActive = !widget.isActive;
            // });
          },
          child: Container(
            width: 50.0,
            height: 55.0,
            decoration: BoxDecoration(
                color: widget.isActive ? kPimaryColor : null,
                borderRadius: BorderRadius.circular(5.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    widget.dayNumber,
                    style: TextStyle(
                        color: widget.isActive ? kBackgroundColor : Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                    shadows: [Shadow(
                      blurRadius: widget.isActive ? 0.0 : 5.0,
                      color: Colors.black,
                      offset: Offset(
                        0.5,0.5
                      )
                    )])),
                Text(
                  widget.dayAbbreviation.toUpperCase(),
                  style: TextStyle(
                    color: widget.isActive ? kBackgroundColor : Colors.white12,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
