import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AskSeniorOfficial extends StatefulWidget {
  final String choice, sector, userid, useridSeniorOfficial, heading, body, short;
  AskSeniorOfficial(
      {this.choice,
      this.sector,
      this.userid,
      this.useridSeniorOfficial,
      this.heading,
      this.body,
      this.short});
  @override
  _AskSeniorOfficialState createState() => _AskSeniorOfficialState();
}

class _AskSeniorOfficialState extends State<AskSeniorOfficial> {
  bool visible = false;

  final questionController = TextEditingController();

  Future userLogin() async {
    setState(() {
      visible = true;
    });
    String question = questionController.text;
    var url = 'https://puppyish-ribbon.000webhostapp.com/query_senior_official.php';

    var data = {
      'question': question,
      'userid': widget.userid,
      'useridSeniorOfficial': widget.useridSeniorOfficial,
      'body': widget.body,
      'short': widget.short,
      'heading': widget.heading,
      'post': widget.sector,
      'sector': widget.choice
    };
    print(widget.sector);

    var response = await http.post(url, body: json.encode(data));

    var message = jsonDecode(response.body);

    if (message == 'Query Sent') {

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
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.cyan[100],
        centerTitle: true,
        title: new Text("Suggestions", style: TextStyle(color: Colors.black, fontFamily: 'Open Sans', fontWeight: FontWeight.bold),),
      ),
        body: Center(
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 100.0),
              width: 330,
              child: Theme(
                data: ThemeData(
                    primaryColor: Colors.cyan[100], cursorColor: Colors.black),
                child: TextField(
                  controller: questionController,
                  autocorrect: true,
                  decoration: InputDecoration(
                      hintText: 'Enter your suggestions here',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              )),
          Container(
            padding: EdgeInsets.only(top: 40.0),
            height: 98,
            width: 330,
            child: RaisedButton(
              color: Colors.cyan[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: userLogin,
              child: Text(
                  'Suggestions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.bold),
                ),
            ),
          ),
        ],
      ),
    ));
  }
}
