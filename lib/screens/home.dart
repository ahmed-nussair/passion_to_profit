
import 'package:flutter/material.dart';

import '../user.dart';
import 'main_screens/home_screen.dart';
import 'main_screens/daily_quotes.dart';
import 'main_screens/more_features_screen.dart';
import 'main_screens/profile_screen.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _index = 0;
  final maxPhoneSize = 480;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(User.isGuest?'Welcome Guest': 'Welcome Nussair'),),
        bottomNavigationBar: SizedBox(
          height: 65,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.red,
            iconSize: 30,
            selectedFontSize: _width > maxPhoneSize?16:14,
            unselectedFontSize: _width > maxPhoneSize?14:12,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_quote),
                title: Text('Daily Quotes'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_vert),
                  title: Text('More'),
              ),

            ],
            currentIndex: _index,
            onTap: (int) async {
              setState(() {
                _index = int;
              });
            },
          ),
        ),
        body: _index == 1? ProfileScreen():
              _index == 2? DailyQuotesScreen():
              _index == 3? MoreFeaturesScreen() :
              HomeScreen(),
      ),
    );
  }
}
