import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(RegisterJuniorOfficial());

class RegisterJuniorOfficial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Center(child: RegisterUser())));
  }
}

class RegisterUser extends StatefulWidget {
  RegisterUserState createState() => RegisterUserState();
}

class RegisterUserState extends State {
  bool visible = false;
  final nameController = TextEditingController();
  final useridController = TextEditingController();
  final addressController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();

  Future userRegistration() async {
    setState(() {
      visible = true;
    });
    String name = nameController.text;
    String userid = useridController.text;
    String password = passwordController.text;
    String address = passwordController.text;
    String number = passwordController.text;
    var url =
        'https://puppyish-ribbon.000webhostapp.com/register_junior_official.php';

    var data = {
      'name': name,
      'userid': userid,
      'password': password,
      'address': address,
      'number': number
    };

    var response = await http.post(url, body: json.encode(data));

    var message = jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
      child: Column(
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
                      child: Image(
                          image: AssetImage('assets/images/App_Logo.png')))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32.0,
                        fontFamily: 'Open Sans',
                      ),
                    ),
            ),
          Container(
              padding: EdgeInsets.only(top: 20.0),
              width: 330,
              child: Theme(
                data: ThemeData(
                    primaryColor: Colors.cyan[100], cursorColor: Colors.black),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan[100]),
                          borderRadius: BorderRadius.circular(2.0))),
                ),
              )),
          Container(
              padding: EdgeInsets.only(top: 20.0),
              width: 330,
              child: Theme(
                data: ThemeData(
                    primaryColor: Colors.cyan[100], cursorColor: Colors.black),
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
                          borderSide: BorderSide(color: Colors.cyan[100]),
                          borderRadius: BorderRadius.circular(2.0))),
                ),
              )),
          Container(
              padding: EdgeInsets.only(top: 20.0),
              width: 330,
              child: Theme(
                data: ThemeData(
                    primaryColor: Colors.cyan[100], cursorColor: Colors.black),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan[100]),
                          borderRadius: BorderRadius.circular(2.0))),
                ),
              )),
          Container(
              padding: EdgeInsets.only(top: 20.0),
              width: 330,
              child: Theme(
                data: ThemeData(
                    primaryColor: Colors.cyan[100], cursorColor: Colors.black),
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: 'Address',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan[100]),
                          borderRadius: BorderRadius.circular(2.0))),
                ),
              )),
          Container(
              padding: EdgeInsets.only(top: 20.0),
              width: 330,
              child: Theme(
                data: ThemeData(
                    primaryColor: Colors.cyan[100], cursorColor: Colors.black),
                child: TextField(
                  controller: numberController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan[100]),
                          borderRadius: BorderRadius.circular(2.0))),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              height: 50.0,
              width: 150.0,
              child: RaisedButton(
                onPressed: userRegistration,
                color: Colors.cyan[300],
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Open Sans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
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
    )));
  }
}
