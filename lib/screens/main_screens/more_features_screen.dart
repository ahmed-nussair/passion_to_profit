import 'package:flutter/material.dart';
import '../more_features_screens/keep_in_touch_screen.dart';
import '../more_features_screens/success_stories_screen.dart';

class Item{
  String _iconAsset;
  String _title;
  String _routeName;

  Item(this._iconAsset, this._title, this._routeName);

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get iconAsset => _iconAsset;

  set iconAsset(String value) {
    _iconAsset = value;
  }

  String get routeName => _routeName;

  set routeName(String value) {
    _routeName = value;
  }


}

final items = [
  Item('more_features_list_images/success_stories.png', 'Success Stories', 'SuccessStories'),
  Item('more_features_list_images/news.png', 'News & Announcements', 'News&Announcements'),
  Item('more_features_list_images/network.png', 'Network With Your Peers', 'NetworkWithYourPeers'),
  Item('more_features_list_images/checklist.png', 'Passion to Profit Checklist', 'Checklist'),
  Item('more_features_list_images/podcust.png', 'Passion to Profit Podcast', 'Podcast'),
  Item('more_features_list_images/keep_in_touch.png', 'Keep In Touch', 'KeepInTouch'),
];

class MoreFeaturesScreen extends StatefulWidget {
  @override
  _MoreFeaturesScreenState createState() => _MoreFeaturesScreenState();
}
var routes = {
  'SuccessStories': (context) => SuccessStoriesScreen(),
  'News&Announcements': (context) => KeepInTouchScreen(),
  'NetworkWithYourPeers': (context) => KeepInTouchScreen(),
  'Checklist': (context) => KeepInTouchScreen(),
  'Podcast': (context) => KeepInTouchScreen(),
  'KeepInTouch': (context) => KeepInTouchScreen(),
};

class _MoreFeaturesScreenState extends State<MoreFeaturesScreen> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, int){
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: routes[items[int].routeName]
                    )
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(
                        width: 1,
                        color: Colors.grey
                    ))
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(items[int].iconAsset,
                        width: _width > 500? 70 : 50,
                        height: _width > 500? 70 : 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        items[int].title,
                        style: TextStyle(
                          fontSize: _width > 500? 30 : 20,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

