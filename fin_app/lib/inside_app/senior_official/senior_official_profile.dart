import 'dart:async';
import 'package:fin_app/main.dart';
import 'package:fin_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Info {
  final String id;
  final String name,
      email,
      dateOfBirth,
      designation,
      idNumber,
      documentType,
      sector;

  Info({
    this.id,
    this.name,
    this.email,
    this.dateOfBirth,
    this.designation,
    this.idNumber,
    this.documentType,
    this.sector,
  });

  factory Info.fromJson(Map<String, dynamic> jsonData) {
    return Info(
        id: jsonData['id'],
        name: jsonData['name'],
        email: jsonData['email'],
        sector: jsonData['sector'],
        designation: jsonData['designation'],
        idNumber: jsonData['idNumber'],
        dateOfBirth: jsonData['dateOfBirth'],
        documentType: jsonData['documentType']);
  }
}

class Inbox extends StatefulWidget {
  final List<Info> information;
  final String userid;

  Inbox({this.information, this.userid});

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<void> _showMyDialog(value) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(value,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.bold)),
          actions: <Widget>[
            Center(
              child: FlatButton(
                color: Colors.cyan[100],
                child: Text('Close',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget build(context) {
    return ListView.builder(
      itemCount: widget.information.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(widget.information[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Info inform, BuildContext context) {
    return new ListTile(
      title: Center(
        child: new Container(
          margin: EdgeInsets.only(top: 130.0),
          child: new Column(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 40.0,
                    width: 200.0,
                    child: RaisedButton(
                      onPressed: () {
                        _showMyDialog(inform.name);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.cyan[100],
                      child: Text('Name',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Center(
                    child: Container(
                      height: 40.0,
                      width: 200.0,
                      child: RaisedButton(
                        onPressed: () {
                          _showMyDialog(inform.email);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.cyan[100],
                        child: Text('Email Id',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Center(
                    child: Container(
                      height: 40.0,
                      width: 200.0,
                      child: RaisedButton(
                        onPressed: () {
                          _showMyDialog(inform.sector);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.cyan[100],
                        child: Text('Sector',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Center(
                    child: Container(
                      height: 40.0,
                      width: 200.0,
                      child: RaisedButton(
                        onPressed: () {
                          _showMyDialog(inform.designation);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.cyan[100],
                        child: Text('Designation',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Center(
                    child: Container(
                      height: 40.0,
                      width: 200.0,
                      child: RaisedButton(
                        onPressed: () {
                          _showMyDialog(inform.dateOfBirth);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.cyan[100],
                        child: Text('Date Of Birth',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Center(
                    child: Container(
                      height: 40.0,
                      width: 200.0,
                      child: RaisedButton(
                        onPressed: () {
                          _showMyDialog(inform.idNumber);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.cyan[100],
                        child: Text('Id Number',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Center(
                    child: Container(
                      height: 40.0,
                      width: 200.0,
                      child: RaisedButton(
                        onPressed: () {
                          _showMyDialog(inform.documentType);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.cyan[100],
                        child: Text('Document Type',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Center(
                    child: Container(
                      height: 40.0,
                      width: 150.0,
                      child: RaisedButton(
                        onPressed: () {
                          Route route =
                              MaterialPageRoute(builder: (context) => MyApp());
                          Navigator.pushReplacement(context, route);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.cyan[100],
                        textColor: Colors.black,
                        child: Text('Logout',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  final Info value;

  SecondScreen({Key key, this.value}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Details')),
      body: new Container(
        child: new Center(
          child: Column(
            children: <Widget>[
              Padding(
                child: new Text(
                  'PROFILE',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
              ),
              Padding(
                child: new Text(
                  'SUBJECT : ${widget.value.name}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              Padding(
                child: new Text(
                  widget.value.email,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              RaisedButton(
                child: Text('Save'),
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  final String userid, choice;
  Profile({this.userid, this.choice});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<List<Info>> downloadJSON() async {
    final jsonEndpoint =
        "https://puppyish-ribbon.000webhostapp.com/senior_official_profile.php";

    var data = {'userid': widget.userid, 'choice': widget.choice};
    var response = await http.post(jsonEndpoint, body: json.encode(data));
    //final response = await get(jsonEndpoint);

    if (response.statusCode == 200) {
      List information = json.decode(response.body);
      return information.map((inform) => new Info.fromJson(inform)).toList();
    } else
      throw Exception(
          'We were not able to successfully download the json data.');
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.cyan[100],
        ),
        body: new Center(
          child: new FutureBuilder<List<Info>>(
            future: downloadJSON(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Info> information = snapshot.data;
                return new Inbox(
                  information: information,
                  userid: widget.userid,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(Profile());
}
