import 'dart:ui';
import 'package:fin_app/inside_app/junior_official/register_junior_official.dart';
import 'package:fin_app/inside_app/junior_official/sector_choice.dart';
import 'package:fin_app/inside_app/senior_official/sector_choice.dart';
import 'package:fin_app/inside_app/senior_official/register_senior_official.dart';
import 'package:fin_app/screens/home/home.dart';
import 'package:fin_app/screens/welcome.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 150.0),
                decoration: BoxDecoration(color: Colors.white),
                height: 180.0,
                width: 180.0,
                child:
                    Image(image: AssetImage('assets/images/App_Logo.png'))),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Need Updates? Do Click.',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 28.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: RaisedButton(
                        color: Colors.cyan[100],
                        onPressed: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => Welcome());
                          Navigator.pushReplacement(context, route);
                        },
                        textColor: Colors.white,
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 180,
                          child: const Text(
                            "Click to continue",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22.0,
                                fontFamily: 'Open Sans',
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Text(
                        'An Application Initiative For DFS',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    Container(
                padding: EdgeInsets.only(top: 5.0),
                decoration: BoxDecoration(color: Colors.white),
                height: 200.0,
                width: 200.0,
                child:
                    Image(image: AssetImage('assets/images/DFS_Logo.jpg'))),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
