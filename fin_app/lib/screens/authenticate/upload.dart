import 'package:fin_app/inside_app/senior_official/senior_official_login.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
 
class UploadImageDemo extends StatefulWidget {
  final String userid, sector, choice;
  UploadImageDemo({Key key, @required this.userid, this.sector, this.choice}) : super(key: key);
 
  final String title = "Upload Image Demo";
 
  @override
  UploadImageDemoState createState() => UploadImageDemoState();
}
 
class UploadImageDemoState extends State<UploadImageDemo> {
  //
  static final String uploadEndPoint =
      'https://puppyish-ribbon.000webhostapp.com/test.php';
      
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  bool visible = false ;
 
  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.camera);
    });
    setStatus('');
  }
 
  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

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
 
  startUpload() {
    setStatus('Uploading image');
    if (null == tmpFile) {
      setStatus(errMessage);
      return;
    }
    String fileName = 'image1.jpeg';
    upload(fileName);
  }
 
  upload(String fileName) {
    http.post(uploadEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : errMessage);
      if (result.body == "Successful"){
        check();
        
 

      }
    }).catchError((error) {
      setStatus(error);
    });
  }
  
  
 
  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No image',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Text('Facial Authentication', style: TextStyle(fontSize: 35.0,fontFamily: 'Open Sans', fontWeight: FontWeight.bold),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: RaisedButton(
                color: Colors.cyan[100],
                onPressed: chooseImage,
                child: Container(
                  alignment: Alignment.center,
                  height: 60.0,
                  width: 250.0,
                  child: Text('Take a picture', style: TextStyle(fontSize: 22.0,fontFamily: 'Open Sans', fontWeight: FontWeight.bold),)),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            showImage(),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: RaisedButton(
                color: Colors.cyan[100],
                onPressed: startUpload,
                child: Container(
                  alignment: Alignment.center,
                  height: 60.0,
                  width: 250.0,
                  child: Text('Proceed to dashboard', style: TextStyle(fontSize: 22.0,fontFamily: 'Open Sans', fontWeight: FontWeight.bold),)),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
