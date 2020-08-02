import 'dart:async';
import 'package:fin_app/inside_app/junior_official/junior_official_query.dart';
import 'package:fin_app/inside_app/senior_official/ask_expert.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Info {
  final String id;
  final String heading, body, short, timestamp;

  Info({
    this.id,
    this.heading,
    this.body,
    this.short,
    this.timestamp,
  });

  factory Info.fromJson(Map<String, dynamic> jsonData) {
    return Info(
      id: jsonData['id'],
      heading: jsonData['heading'],
      short: jsonData['short'],
      body: jsonData['body'],
      timestamp: jsonData['timestamp'],
    );
  }
}

class Inbox extends StatefulWidget {
  final List<Info> information;
  final String userid, sector, choice;

  Inbox({this.information, this.userid, this.choice, this.sector});

  

  

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {

  

  

  var refreshKey = GlobalKey<RefreshIndicatorState>();

 
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
        title: new Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      child: Text(inform.heading, style: TextStyle(fontSize: 18),),
                      
                      padding: EdgeInsets.only(bottom: 8.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(inform.short, style: TextStyle(fontSize: 14),),
                    ),
                    Row(children: <Widget>[
                      Padding(
                          child: Text(
                            inform.timestamp,
                             style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.right,
                          ),
                          padding: EdgeInsets.all(1.0)),
                    ]),
                  ],
                ),
                Divider(color: Colors.black,)
              ]),
        ),
        onTap: () {
          var route = new MaterialPageRoute(
            builder: (BuildContext context) => new SecondScreen(value: inform, choice: widget.choice, sector: widget.sector, userid:widget.userid),
          );
          Navigator.of(context).push(route);
        });
  }
}

class SecondScreen extends StatefulWidget {
  final Info value;
  final String userid, choice, sector;
  
  SecondScreen({Key key, this.value, this.userid, this.choice, this.sector}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  Future queryCircular() async {
    
    var url = 'https://puppyish-ribbon.000webhostapp.com/query.php';

    var data = {
      'userid': widget.userid,
      'body': widget.value.body,
      'short': widget.value.short,
      'heading': widget.value.heading,
      'post': widget.sector,
      'sector': widget.choice
    };
    print(data);
    var response = await http.post(url, body: json.encode(data));

    var message = jsonDecode(response.body);

    if (message == 'Query Sent') {

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
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: new Text(
          'Circular Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.cyan[100],
      ),
      body: new Container(
        child: SingleChildScrollView(
          child: new Center(
            child: Column(
              children: <Widget>[
                
                Padding(
                  child: Text(widget.value.heading, style: TextStyle(fontSize: 18),),
                  padding: EdgeInsets.all(20.0),
                ),
                
                Padding(
                  child: new Text(
                    'SUBJECT : ${widget.value.short}',
                    style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),
                    textAlign: TextAlign.left,
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
                Padding(
                  child: new Text(
                    widget.value.body,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0,2,5,15),
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0,2,5,15),
                      child: RaisedButton(
                        color: Colors.cyan[100],
                        child: Text("Queries",
                        style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold),),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Query()));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0,2,5,15),
                      child: RaisedButton(
                        color: Colors.cyan[100],
                        child: Text("Ask Expert",
                        style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold),),
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AskExpert(
                            userid: widget.userid,
                            heading: widget.value.heading,
                            body: widget.value.body,
                            short: widget.value.short,
                            choice: widget.choice,
                            sector: widget.sector,
                            ),)
                        );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Save extends StatefulWidget {
  final String userid, choice, sector;
  Save({this.userid, this.choice, this.sector});
  @override
  _SaveState createState() => _SaveState();
}

class _SaveState extends State<Save> {

  Future<List<Info>> downloadJSON() async {
  final jsonEndpoint = "https://puppyish-ribbon.000webhostapp.com/save_retreive_junior_official.php";
  
  
  var data = {'userid':widget.userid};
  var response = await http.post(jsonEndpoint, body: json.encode(data));

  if (response.statusCode == 200) {
    List information = json.decode(response.body);
    return information.map((inform) => new Info.fromJson(inform)).toList();
  } else
    throw Exception('We were not able to successfully download the json data.');
}
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Saved Circulars',
            style: TextStyle(color: Colors.black, fontFamily: 'Open Sans', fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.cyan[100],
        ),
        body: new Center(
            child: new FutureBuilder<List<Info>>(
              future: downloadJSON(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Info> information = snapshot.data;
                  return new Inbox(information: information, userid: widget.userid, choice: widget.choice, sector: widget.sector);
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
  runApp(Save());
}
