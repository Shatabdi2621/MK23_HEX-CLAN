import 'package:fin_app/inside_app/senior_official/senior_official_contact_us.dart';
import 'package:fin_app/inside_app/senior_official/senior_official_profile.dart';
import 'package:fin_app/inside_app/senior_official/senior_official_query_manual.dart';
import 'package:fin_app/inside_app/senior_official/senior_official_save.dart';
import 'package:fin_app/inside_app/senior_official/sent.dart';
import 'package:flutter/material.dart';
import 'package:fin_app/inside_app/senior_official/senior_official_inbox.dart';

class SeniorOfficialLogin extends StatefulWidget {
  final String userid, sector, choice;
  SeniorOfficialLogin({Key key, @required this.userid, this.sector, this.choice}) : super(key: key);
  @override
  _SeniorOfficialLoginState createState() => _SeniorOfficialLoginState();
}

class _SeniorOfficialLoginState extends State<SeniorOfficialLogin> {
  int _selectedIndex = 0;
      @override
  void initState() {
    pages = [
        New(userid: widget.userid, sector: widget.sector, choice: widget.choice,),
        Save(userid:widget.userid, choice: widget.choice, sector: widget.sector,),
        Sent(userid: widget.userid, choice: widget.choice, sector: widget.sector,),
        QueryManual(userid:widget.userid, choice: widget.choice, sector: widget.choice,),
        Profile(userid:widget.userid, choice: widget.choice,),
        ContactUs()
      ];
    super.initState();
  }
      var pages;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

@override
Widget build(BuildContext context) {
return Scaffold(
      body: Center(
        child: pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Inbox'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt),
            title: Text('Save'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Sent'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Queries'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            title: Text('Contact'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan[300],
        onTap: _onItemTapped,
      ),
    );
  }
}