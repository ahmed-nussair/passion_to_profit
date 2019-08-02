import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:passion_to_profit/model/book.dart';
import 'package:url_launcher/url_launcher.dart';

final List<String> imgList = [
  'https://images-na.ssl-images-amazon.com/images/I/51CURPZOG7L._SX331_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/41fgmQk4KSL._SX311_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51PmKN1NIuL._SX311_BO1,204,203,200_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/31zllviBcML._SY346_.jpg',
];

final books = [
  Book('The Pharaohs\' Code',
      'The Pharaohs\' Code: Creating a Joyful Life and a Lasting Legacy by Mohamed Tohami',
      'https://www.amazon.com/gp/product/B01FGM0CPY/ref=dbs_a_def_rwt_bibl_vppi_i4',
      'https://images-na.ssl-images-amazon.com/images/I/51CURPZOG7L._SX331_BO1,204,203,200_.jpg'),
  Book('StoryNetworking',
      'StoryNetworking: A Proven 4-Step System To Connect With Successful People by Mohamed Tohami',
      'https://www.amazon.com/gp/product/B01K14HGEW/ref=dbs_a_def_rwt_bibl_vppi_i3',
      'https://images-na.ssl-images-amazon.com/images/I/41fgmQk4KSL._SX311_BO1,204,203,200_.jpg'),
  Book('Midway Simplicity',
      'Midway Simplicity: Easy Solutions To Simplify Your Time, Health, Things, Finances and Relationships',
      'https://www.amazon.com/gp/product/148125474X/ref=dbs_a_def_rwt_bibl_vppi_i1',
      'https://images-na.ssl-images-amazon.com/images/I/51PmKN1NIuL._SX311_BO1,204,203,200_.jpg'),
  Book('‫الأسطورة سبعة‬',
      'الأسطورة سبعة رواية مثيرة وملهمة إلى أبعد الحدود بمجرد البدء في قراءة صفحاتها الأولى ستدخل في عالم من الإثارة والمشاعر المتدفقة ولن تستطيع تركها إلا وقد أنهيت قراءة كلماتها الأخيرة الملهمة بعد الإنتهاء من قراءة الرواية ستبدأ في إحياء كل أحلامك المؤجلة وستعرف الوصايا السبع لكي تحيا بشغف وتترك بصمتك المميزة في الحياة إذا كنت من عشاق رواية الخيميائي لباولو كويلو، فستقع في عشق هذه الرواية الفريدة من نوعها',
      'https://www.amazon.com/dp/B07NYY7TP8',
      'https://images-na.ssl-images-amazon.com/images/I/31zllviBcML._SY346_.jpg'),
];

class BooksScreen extends StatefulWidget {
  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'demo',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
//              items: imgList.map((img) {
//                return new Builder(
//                  builder: (BuildContext context) {
//                    return Image.network(img, fit: BoxFit.fill,);
//                  },
//                );
//              }).toList(),
              items: books.map((b){
                return Builder(builder: (BuildContext context){
                  return Image.network(b.imageUrl, fit: BoxFit.fill,);
                });
              }).toList(),
              enlargeCenterPage: true,
              viewportFraction: 0.5,
              aspectRatio: 1.2,
              scrollDirection: Axis.horizontal,
              onPageChanged: (int){

                setState(() {
                  _index = int;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Center(
              child: Text(books[_index].name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RaisedButton(
              child: Text('Purchase from Amazon'),
              onPressed: (){
                _launchURL(books[_index].url);
              },
            )
          ],
        ),
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
