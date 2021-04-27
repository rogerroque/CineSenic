
import 'package:flutter/material.dart';
import 'const.dart';

class CalendarDay extends StatelessWidget {
  final String dayAbbreviation;
  final String dayNumber;
  final bool isActive;
  CalendarDay(
      {@required this.dayNumber, this.dayAbbreviation, this.isActive = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15),
      child: Container(
        width: 50.0,
        height: 55.0,
        decoration: BoxDecoration(
            color: isActive ? kPimaryColor : null,
            borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(dayNumber,
                style: TextStyle(
                    color: isActive ? kBackgroundColor : Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            Text(
              dayAbbreviation.toUpperCase(),
              style: TextStyle(
                color: isActive ? kBackgroundColor : Colors.white12,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
