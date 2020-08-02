import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class ContactUs extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Contact Us', style: TextStyle(color: Colors.black, fontFamily: 'Open Sans', fontWeight: FontWeight.bold),), backgroundColor: Colors.cyan[100],),
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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

Future userRegistration() async{

  setState(() {
  visible = true ; 
  });

  String name = nameController.text;
  String email = emailController.text;
  String password = passwordController.text;

  var url = '';

  var data = {'name': name, 'email': email, 'password' : password};

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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        

        Container(
        width: 280,
        padding: EdgeInsets.all(10.0),
        child: TextField(
            controller: nameController,
            autocorrect: true,
            decoration: InputDecoration(hintText: 'Enter Your Name Here'),
          )
        ),

        Container(
        width: 280,
        padding: EdgeInsets.all(10.0),
        child: TextField(
            controller: emailController,
            autocorrect: true,
            decoration: InputDecoration(hintText: 'Enter Your Email Here'),
          )
        ),

        Container(
        width: 280,
        padding: EdgeInsets.all(10.0),
        child: TextField(
            controller: passwordController,
            autocorrect: true,
          
            decoration: InputDecoration(hintText: 'What do you want to tell us?'),
          )
        ),

        RaisedButton(
          onPressed: userRegistration,
          color: Colors.cyan[100],
          textColor: Colors.black,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Text('Send'),
        ),

        Visibility(
          visible: visible, 
          child: Container(
            margin: EdgeInsets.only(bottom: 30),
            child: CircularProgressIndicator()
            )
          ),

      ],
    ),
  )));
}
}