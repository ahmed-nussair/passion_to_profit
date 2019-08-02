import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:passion_to_profit/model/success_story.dart';
import 'package:url_launcher/url_launcher.dart';

//final API = 'AIzaSyBjJQT8BsYC7pcAsgaTtv3ca7T9CUvBCqk';
final stories = [
  SuccessStory(
      'PcXs66LePlI', 'Mohamed Abbas', 'Fiction Writing', 'الحرية مالهاش تمن'),
  SuccessStory('TW2G819O3d0', 'Tasneem El-Mashad', 'Painting',
      'حلم صغير فتح أبواب تانية كتير'),
  SuccessStory('kM7qCrj6rHE', 'Ahmed Hossam', 'Gamification',
      'مش هكبر إلا لو سبت الشركة'),
  SuccessStory('09eZVjEc0TU', 'Iman Refaat', 'Self-Leadership',
      'أنا مش لوحدي. أنا عندي عزوة'),
  SuccessStory('38RRB7oYpSw', 'Noha Zahra', 'Education', 'النجاح بيبقى سريع'),
  SuccessStory('bBKYSLGb7F8', 'Mohamed Samy', 'Fashion',
      'العلاقات اللي توصل لطموح أعلى'),
  SuccessStory(
      'goVPHhOWgzo', 'Shaimaa Al-Sagheer', 'Radio Host', 'صوت لأي فكرة'),
  SuccessStory(
      'WX0ONGNH0N4', 'Karim Saeed', 'Game Design', 'دمجت خمس مجالات شغف'),
  SuccessStory(
      'ajpMNTWQMYI', 'Engy Nabil', 'Jewellery', 'كل الناس بتشجع بعضها'),
  SuccessStory('LhtldN_N5gM', 'Mostafa Mohamed', 'Friendship', 'إنت عظيم'),
  SuccessStory(
      '8LmZBqv-G98', 'Heba Anwar', 'Nutrition', 'بنسيب أثر في حياة الناس'),
  SuccessStory(
      'jyL14u8mXqo', 'Marwan Lotfy', 'Traveling', 'إنت مش مجنون. إنت مختلف'),
  SuccessStory('tPDs96qI0-M', 'Eman El Gamal', 'Soap Making',
      'لو مش بتعمل اللي بتحبه يبقى لسة ماعشتش'),
  SuccessStory(
      'D8qoogUADg8', 'Akram Yousry', 'Product Design', 'مافيش حلم مستحيل'),
  SuccessStory('sOd-TBGTeEY', 'Dalia Abu Alam', 'Parenting',
      'لما تكون مدير نفسك، الحياة بيبقى ليها شكل تاني'),
];

class SuccessStoriesScreen extends StatefulWidget {
  @override
  _SuccessStoriesScreenState createState() => _SuccessStoriesScreenState();
}

class _SuccessStoriesScreenState extends State<SuccessStoriesScreen> {
  Future<bool> isConnectedToTheInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final maxPhoneSize = 480;
    double _youtube_icon_position = _width > maxPhoneSize ? 95 : 60;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Container(
              child: Text(
                'Some of Passion To Profit Inspiring Success Stories',
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 2,
              ),
              height: 100,
            ),
          ),
          body: ListView.builder(
              itemCount: stories.length,
              itemBuilder: (context, int) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      FutureBuilder(
                          future: isConnectedToTheInternet(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              bool connectedToTheInternet = snapshot.data;
                              return connectedToTheInternet
                                  ? GestureDetector(
                                      onTap: () async {
//                            FlutterYoutube.playYoutubeVideoById(
//                              apiKey: API,
//                              videoId: stories[int].videoId,
//                              fullScreen: true,
//                            );

                                        final url =
                                            'https://www.youtube.com/watch?v=${stories[int].videoId}';
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                      child: Stack(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Image.network(
                                              'https://img.youtube.com/vi/${stories[int].videoId}/0.jpg',
                                              height: _width > maxPhoneSize
                                                  ? 250
                                                  : 150,
                                              width: _width > maxPhoneSize
                                                  ? 250
                                                  : 150,
                                            ),
                                          ),
                                          Positioned(
                                            top: _youtube_icon_position,
                                            bottom: _youtube_icon_position,
                                            right: _youtube_icon_position,
                                            left: _youtube_icon_position,
                                            child: Opacity(
                                              opacity: 0.6,
                                              child: Image.asset(
                                                'assets/youtube_play.png',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Image.asset(
                                        'assets/no_thumbnail.png',
                                        height:
                                            _width > maxPhoneSize ? 250 : 150,
                                        width:
                                            _width > maxPhoneSize ? 250 : 150,
                                      ),
                                    );
                            } else {
                              return Container();
                            }
                          }),
                      Container(
                        width: _width * 0.5,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  stories[int].quote,
                                  softWrap: true,
                                  textAlign: TextAlign.right,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: _width > maxPhoneSize ? 25 : 20,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    stories[int].name,
                                    style: TextStyle(
                                        fontSize:
                                            _width > maxPhoneSize ? 25 : 15),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text.rich(
                                    TextSpan(
                                      style: TextStyle(
                                        fontSize:
                                            _width > maxPhoneSize ? 25 : 15,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Passion: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: stories[int].passion,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
