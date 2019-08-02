import 'package:flutter/material.dart';

class KeepInTouchScreen extends StatelessWidget {
  final double _size = 50;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Keep In Touch'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset('keep_in_touch_images/phone.png',
                          width: _size,
                          height: _size,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('+20 102 082 6426',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset('keep_in_touch_images/location.png',
                          width: _size,
                          height: _size,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('El-Mosheer Ahmed Ismail\nSt, Sheraton Al Matar,\nQism El-Nozha,\nCairo Governorate',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset('keep_in_touch_images/email.png',
                          width: _size,
                          height: _size,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('info@tohami.com',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset('keep_in_touch_images/facebook.png',
                          width: _size,
                          height: _size,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Text('Mohamed Tohami - محمد تهامي'
                              ,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text('The Passion Point',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset('keep_in_touch_images/domain.png',
                          width: _size,
                          height: _size,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Text('www.tohami.com',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text('www.passion-point.com',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
