import 'dart:ui';
import 'package:fin_app/inside_app/junior_official/register_junior_official.dart';
import 'package:fin_app/inside_app/junior_official/sector_choice.dart';
import 'package:fin_app/inside_app/senior_official/sector_choice.dart';
import 'package:fin_app/inside_app/senior_official/register_senior_official.dart';
import 'package:fin_app/screens/home/home.dart';
import 'package:fin_app/screens/home/register.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 20.0),
                    height: 100,
                    width: 100,
                    child: Image(
                        image: AssetImage('assets/images/DFS_Logo1.png'))),
                Container(
                    margin: EdgeInsets.only(right: 20.0),
                    decoration: BoxDecoration(color: Colors.white),
                    height: 85,
                    width: 85,
                    child:
                        Image(image: AssetImage('assets/images/App_Logo.png')))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 80.0),
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome to FIU',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 35.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 100),
                    child: RaisedButton(
                      color: Colors.cyan[100],
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => Home());
                        Navigator.pushReplacement(context, route);
                      },
                      textColor: Colors.white,
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 180,
                        child: Text(
                          "Login",
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
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: RaisedButton(
                      color: Colors.cyan[100],
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => Register());
                        Navigator.pushReplacement(context, route);
                      },
                      textColor: Colors.white,
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 180,
                        child: const Text(
                          "Register",
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
                ]),
          ),
        ],
      ),
    );
  }
}
