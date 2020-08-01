import 'dart:ui';
import 'package:fin_app/inside_app/junior_official/sector_choice.dart';
import 'package:fin_app/inside_app/senior_official/sector_choice.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 40.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 100),
                    child: RaisedButton(
                      color: Colors.cyan[100],
                      onPressed: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => ChoiceSenior());
                        Navigator.pushReplacement(context, route);
                      },
                      textColor: Colors.white,
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 250,
                        child: Text(
                          "Senior Official",
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
                            builder: (context) => ChoiceJunior());
                        Navigator.pushReplacement(context, route);
                      },
                      textColor: Colors.white,
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 250,
                        child: const Text(
                          "Junior Official",
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
