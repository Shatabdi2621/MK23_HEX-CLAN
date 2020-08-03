import 'package:fin_app/screens/authenticate/sign_in_senior.dart';
import 'package:flutter/material.dart';

class ChoiceSenior extends StatefulWidget {
  @override
  _ChoiceSeniorState createState() => _ChoiceSeniorState();
}

class _ChoiceSeniorState extends State<ChoiceSenior> {
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
                    'Select Your Sector',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35.0, fontFamily: 'Open Sans'),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 100),
                    child: RaisedButton(
                      color: Colors.cyan[100],
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          width: 200.0,
                          child: Text(
                            'Banking Sector',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold),
                          )),
                      onPressed: () {
                        choice = 'Banking';
                        Route route = MaterialPageRoute(
                            builder: (context) =>
                                LoginSeniorUser(choice: choice));
                        Navigator.pushReplacement(context, route);
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
                          height: 50.0,
                          width: 200.0,
                          child: Text(
                            'Insurance Sector',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold),
                          )),
                      onPressed: () {
                        choice = 'Insurance';

                        Route route = MaterialPageRoute(builder: (context) => LoginSeniorUser(
                                      choice: choice,
                                    ));
Navigator.pushReplacement(context, route);
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
                          height: 50.0,
                          width: 200.0,
                          child: Text(
                            'Pension Sector',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold),
                          )),
                      onPressed: () {
                        choice = 'Pansion';
                        Route route = MaterialPageRoute(builder: (context) => LoginSeniorUser(
                                      choice: choice,
                                    ));
Navigator.pushReplacement(context, route);
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
