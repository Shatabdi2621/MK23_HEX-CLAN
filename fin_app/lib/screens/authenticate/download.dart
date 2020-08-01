import 'package:fin_app/inside_app/senior_official/senior_official_login.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Download extends StatefulWidget {
  final String userid, sector, choice;
  Download({Key key, @required this.userid, this.sector, this.choice}) : super(key: key);
  @override
  _DownloadState createState() => _DownloadState();
}

class _DownloadState extends State<Download> {

  bool visible = false ;
 
Future check() async{
 
  setState(() {
  visible = true ; 
  });
 
 
  var url = 'https://puppyish-ribbon.000webhostapp.com/upload.php';
 
 
  var response = await http.post(url);
 
  var message = jsonDecode(response.body);
 
  if(message == 'Login Matched')
  {
 
      setState(() {
      visible = false; 
      });
 
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SeniorOfficialLogin(userid: widget.userid, choice: widget.choice, sector: widget.sector))
      );
  }else{
 
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
    );}
 
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: check,
          color: Colors.blue,
          child: Text('Proceed to dashboard'),
          textColor: Colors.white,
          ),
      )
      
    );
  }
}