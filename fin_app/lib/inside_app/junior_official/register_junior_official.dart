import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(RegisterJuniorOfficial());

class RegisterJuniorOfficial extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
      appBar: AppBar(title: Text('User Registration Form', style: TextStyle(color: Colors.black, fontFamily: 'Open Sans', fontSize: 20.0, fontWeight: FontWeight.bold),), backgroundColor: Colors.cyan[100],),
      body: Center(
        child: RegisterUser()
        )
      )
    );
}
}

class RegisterUser extends StatefulWidget {

RegisterUserState createState() => RegisterUserState();

}

class RegisterUserState extends State {
  bool visible = false ;
  final nameController = TextEditingController();
  final useridController = TextEditingController();
  final addressController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();

Future userRegistration() async{
  setState(() {
  visible = true ; 
  });
  String name = nameController.text;
  String userid = useridController.text;
  String password = passwordController.text;
  String address = passwordController.text;
  String number = passwordController.text;
  var url = 'https://puppyish-ribbon.000webhostapp.com/register_junior_official.php';

  var data = {'name': name, 'userid': userid, 'password' : password, 'address' : address, 'number' : number};

  var response = await http.post(url, body: json.encode(data));

  var message = jsonDecode(response.body);

  if(response.statusCode == 200){
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
        body: SingleChildScrollView(
            child: Center(
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 80),
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
              padding: EdgeInsets.only(top: 40),
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
              padding: EdgeInsets.only(top: 40),
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
              padding: EdgeInsets.only(top: 40),
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
              padding: EdgeInsets.only(top: 40),
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
              width: 250.0,
              child: RaisedButton(
                onPressed: userRegistration,
                color: Colors.cyan[100],
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.black, fontFamily: 'Open Sans', fontSize: 20.0, fontWeight: FontWeight.bold),
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
