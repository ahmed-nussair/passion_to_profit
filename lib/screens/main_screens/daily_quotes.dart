import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../user.dart';

enum language{
  English, Arabic
}

class Quote {
  String _quote;
  String _teller;
  language _lan;

  Quote(this._quote, this._teller, this._lan);

  String get teller => _teller;

  set teller(String value) {
    _teller = value;
  }

  String get quote => _quote;

  set quote(String value) {
    _quote = value;
  }

  language get lan => _lan;

  set lan(language value) {
    _lan = value;
  }


}

final quotes = [
  Quote(
      'All great people achieved massive success because they followed their passion and their spiritual impulse.',
      'Mohamed Tohami', language.English),
  Quote(
      'When you want to develop a new habit, start with one small, extremely easy action and then build on that.',
      'Mohamed Tohami', language.English),
  Quote(
      'Take responsibility for your own future because no one else can be held responsible for improving your life. It is yours and nothing will change unless you take the lead.',
      'Mohamed Tohami', language.English),
  Quote(
      'عيش دايما حياتك بتعمل الحاجة الي بتحبها وسيب الأثر اللي اتخلقت عشان تسيبه.',
      'Mohamed Abbas', language.Arabic),
  Quote('Don\'t get fooled to join the life race. Don\'t compete .. Enjoy ..',
      'Mohamed Abbas', language.English),
  Quote(
      'اللي بتتمرن عليه كل يوم هوا الي هتبقى أستاذ فيه. لو بتتمرن كل يوم على الإيجابية والأفكار الكويسة هتبقى أستاذ فيهم. ولو بتتمرن على الشكوى والإحباط كل يوم هتبقى أستاذ فيهم.',
      'Mostafa Mohamed Mostafa', language.Arabic),
  Quote('If you want to be great just start with saying ((I AM GREAT)).',
      'Mostafa Mohamed Mostafa', language.English),
];

final tohami_images = [
  'quotes_teller_images/tohami_1.jpg',
  'quotes_teller_images/tohami_2.jpg',
  'quotes_teller_images/tohami_3.png',
];

final abbas_images = [
  'quotes_teller_images/abbas_1.jpg',
  'quotes_teller_images/abbas_2.jpg',
  'quotes_teller_images/abbas_3.jpg',
];

final mostafa_images = [
  'quotes_teller_images/mostafa_1.jpg',
  'quotes_teller_images/mostafa_2.jpg',
  'quotes_teller_images/mostafa_3.jpg',
];

class DailyQuotesScreen extends StatefulWidget {
  @override
  _DailyQuotesScreenState createState() => _DailyQuotesScreenState();
}

class _DailyQuotesScreenState extends State<DailyQuotesScreen> {

  DateTime _dateTime = DateTime.now();

  int _quoteIndex = 0;
  int _imageIndex = 0;
  String _image = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var rng = new Random();
    _quoteIndex = rng.nextInt(6) % 6;

    var image_rng = new Random();
    _imageIndex = image_rng.nextInt(3) % 3;

    switch(quotes[_quoteIndex].teller){
      case 'Mohamed Tohami':
        _image = tohami_images[_imageIndex];
        break;
      case 'Mohamed Abbas':
        _image = abbas_images[_imageIndex];
        break;
      case 'Mostafa Mohamed Mostafa':
        _image = mostafa_images[_imageIndex];
        break;
      case 'مصطفى محمد مصطفى':
        _image = mostafa_images[_imageIndex];
        break;
      default:
        _image = tohami_images[0];
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        quotes[_quoteIndex].lan == language.Arabic? Locale("ar", "EG"): Locale("en", "US"),
      ],
      home: SafeArea(
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            height: _height,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.4), BlendMode.dstATop),
                image: AssetImage(_image),
                fit: BoxFit.fitHeight,
                alignment: Alignment.center,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      quotes[_quoteIndex].quote,
                      textDirection: quotes[_quoteIndex].lan == language.Arabic? TextDirection.rtl: TextDirection.ltr,
                      style: TextStyle(fontSize: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        quotes[_quoteIndex].teller,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
