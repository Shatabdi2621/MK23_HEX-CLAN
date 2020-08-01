import 'package:fin_app/screens/authenticate/sign_in_junior.dart';
import 'package:flutter/material.dart';

class ChoiceJunior extends StatefulWidget {
  @override
  _ChoiceJuniorState createState() => _ChoiceJuniorState();
}

class _ChoiceJuniorState extends State<ChoiceJunior> {
  String choice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50.0),
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
              child: Column(
                children: <Widget>[
                  Text(
                    'Select your sector',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, fontFamily: 'Open Sans'),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 100),
                    child: RaisedButton(
                      color: Colors.cyan[100],
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          width: 250.0,
                          child: Text(
                            'Banking',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold),
                          )),
                      onPressed: () {
                        choice = 'Banking';

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginJuniorUser(
                                      choice: choice,
                                    )));
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: RaisedButton(
                      color: Colors.cyan[100],
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          width: 250.0,
                          child: Text(
                            'Insurance',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold),
                          )),
                      onPressed: () {
                        choice = 'Insurance';

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginJuniorUser(
                                      choice: choice,
                                    )));
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: RaisedButton(
                      color: Colors.cyan[100],
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          width: 250.0,
                          child: Text(
                            'Pension',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold),
                          )),
                      onPressed: () {
                        choice = 'Pansion';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginJuniorUser(
                                      choice: choice,
                                    )));
                      },
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
