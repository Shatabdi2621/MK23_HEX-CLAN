import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fin_app/inside_app/junior_official/junior_official_login.dart';

class LoginJuniorUser extends StatefulWidget {
  final String choice, sector;
  LoginJuniorUser({this.choice, this.sector});
  @override
  _LoginJuniorUserState createState() => _LoginJuniorUserState();
}

class _LoginJuniorUserState extends State<LoginJuniorUser> {

  String url;
  bool visible = false;

  final useridController = TextEditingController();
  final passwordController = TextEditingController();

  Future userLogin() async {
    setState(() {
      visible = true;
    });

    String userid = useridController.text;
    String password = passwordController.text;

    if(widget.choice == 'Banking'){
      print(widget.choice);
    url = 'https://puppyish-ribbon.000webhostapp.com/junior_official_login.php';
    } else if(widget.choice == 'Insurance'){
      url = 'https://puppyish-ribbon.000webhostapp.com/junior_official_login_insurance.php';
    } else if(widget.choice == 'Pansion') {
      url = 'https://puppyish-ribbon.000webhostapp.com/junior_official_pansion.php';
    }

    var data = {'userid': userid, 'password': password};

    var response = await http.post(url, body: json.encode(data));

    var message = jsonDecode(response.body);

    if (message == 'Login Matched') {
      setState(() {
        visible = false;
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  JuniorOfficialLogin()));
    } else {
      setState(() {
        visible = false;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
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
                      child: Image(
                          image: AssetImage('assets/images/App_Logo.png')))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Welcome to FIU',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 80),
                      width: 330,
                      child: Theme(
                        data: ThemeData(
                            primaryColor: Colors.cyan[100],
                            cursorColor: Colors.black),
                        child: TextField(
                          controller: useridController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              hintText: 'User Id',
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.cyan[100]),
                                  borderRadius: BorderRadius.circular(2.0))),
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 20, bottom: 30),
                      width: 330,
                      child: Theme(
                        data: ThemeData(
                          primaryColor: Colors.cyan[100],
                          cursorColor: Colors.black
                        ),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0))),
                        ),
                      )),
                  Container(
                    height: 50.0,
                    width: 150.0,
                    child: RaisedButton(
                      color: Colors.cyan[100],
                      onPressed: userLogin,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.black,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20.0),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Visibility(
                      visible: visible,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: CircularProgressIndicator())),
                ],
              ),
            ),
          ]),
        ));
  }
}
