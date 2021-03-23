import 'package:flutter/material.dart';

class politicas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Privacy Politics'
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold
                    ),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(15),
                  child: Text(
                    'Cookies',
                    style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),

                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Like any other website, CineSeniC.com uses cookies. These cookies are used to store information including visitors preferences, '
                    'and the pages on the website that the visitor accessed or visited.\n\nThe information is used to optimize the users experience '
                    'by customizing our web page content based on visitors browser type and/or other information.For more general information on cookies, '
                    'please read "What Are Cookies" from Cookie Consent.',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(15),
                  child: Text(
                    'Privacy Policies',
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'CineSeniC.com Privacy Policy does not apply to other advertisers or websites. Thus,'
                    ' we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. '
                    'It may include their practices and instructions about how to opt-out of certain options.\n\nYou can choose to disable cookies through your individual browser options. '
                    'To know more detailed information about cookie management with specific web browsers, it can be found at the browsers respective websites.',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(15),
                  child: Text(
                    'Children\'s Information',
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, '
                        'and/or monitor and guide their online activity.\n\nCineSeniC.com does not knowingly collect any Personal Identifiable Information from children under the age of 13.'
                        ' If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly '
                        'remove such information from our records.',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
