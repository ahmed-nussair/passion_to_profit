import 'package:flutter/material.dart';

class ClubMeetingsScreen extends StatefulWidget {
  @override
  _ClubMeetingsScreenState createState() => _ClubMeetingsScreenState();
}

class _ClubMeetingsScreenState extends State<ClubMeetingsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: Scaffold(
        body: Container(
          child: guestAccess(),
        ),
      )),
    );
  }

  Widget guestAccess(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/members_only.png'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Members Only',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
