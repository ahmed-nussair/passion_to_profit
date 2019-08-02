import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../user.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  void _showDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: new Text("No Connectivity"),
            content: new Text("Please check your internert connectivity before you can proceed."),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return User.isGuest? guestView(): memberView();
  }

  Widget guestView(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
                'Guest User?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'It\'s Never Been Easier To Turn Your Passion Into a Profitable Business',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () async{
              var connectivityResult = await Connectivity().checkConnectivity();
              if(connectivityResult == ConnectivityResult.mobile ||
                  connectivityResult == ConnectivityResult.wifi){
                final url =
                    'https://learn.tohami.com/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              } else {
                _showDialog(context);
              }
            },
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffeaba4c),
              ),
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                        'You Can Enroll Now',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget memberView(){
    return Container();
  }
}
