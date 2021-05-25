import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class payment_alert_dialog extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CupertinoAlertDialog(
        title: Text("Making the payment"),
        content: Column(
          children: <Widget> [
            Text('This may take a moment'),
            SizedBox(
              height: 20,
            ),
            Image.asset(
            'assets/img/loading.gif',
            height: 60.0,
            width: 60.0,

          )],
        ),
      ),
    );
  }
}

