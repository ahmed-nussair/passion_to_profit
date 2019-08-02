import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import 'home_screen_items/books.dart';
import 'home_screen_items/club_meetings_screen.dart';
import 'home_screen_items/courses.dart';

class Item {
  String image;
  String title;
  String desc;

  Item(this.image, this.title, this.desc);
}

final items = [
  Item('assets/meetings.png', 'Club Meetings', 'Connect with passionate people to get all the motivation, ideas, connections and support you need throughout your journey'),
  Item('assets/courses.png', 'Courses', 'Tohami\'s courses to help you in your passion journey.'),
  Item('assets/books.png', 'Books', 'Tohami\'s best-selling books'),
];

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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final maxPhoneSize = 480;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          itemWidget(items[0].image, items[0].title, items[0].desc, () async{
            var connectivityResult = await Connectivity().checkConnectivity();
            if(connectivityResult == ConnectivityResult.mobile ||
                connectivityResult == ConnectivityResult.wifi){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ClubMeetingsScreen()
              ));
            } else {
              _showDialog(context);
            }

          }),
          itemWidget(items[1].image, items[1].title, items[1].desc, () async {
            var connectivityResult = await Connectivity().checkConnectivity();
            if(connectivityResult == ConnectivityResult.mobile ||
                connectivityResult == ConnectivityResult.wifi){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Courses()
              ));
            } else {
              _showDialog(context);
            }

          }),
          itemWidget(items[2].image, items[2].title, items[2].desc, () async {
            var connectivityResult = await Connectivity().checkConnectivity();
            if(connectivityResult == ConnectivityResult.mobile ||
                connectivityResult == ConnectivityResult.wifi){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BooksScreen()
              ));
            } else {
              _showDialog(context);
            }

          }),

        ],
      ),
    );
  }

  Widget itemWidget(String image, String title, String desc, Function onTap){
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Image.asset(
            image, fit: BoxFit.fill, width: _width, height: ((_height - 90) - 56.0) / 3,
          ),
          Positioned(
            right: 0.0,
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: Opacity(
              opacity: 0.5,
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(title,
                    style: TextStyle(
                      fontSize: _width > maxPhoneSize? 60 : 30,
                      color: Colors.white,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(_width > maxPhoneSize?20:10),
                ),
                Container(
                  child: Text(desc,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: _width > maxPhoneSize? 25 : 15,
                      color: Colors.white,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(_width > maxPhoneSize?20:10),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: _width > maxPhoneSize? 60: 30,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


