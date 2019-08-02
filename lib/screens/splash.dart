import 'dart:async';

import 'package:flutter/material.dart';

import '../file_io.dart';
import '../user.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  startApp() async{

    String _data = await readData();
    if(_data == null){
      DateTime dateTime = DateTime.now();
      writeData('${dateTime.minute}');
      _data = await readData();
    }

    User.minute = int.parse(_data);
    debugPrint('${User.minute}');
    return Timer(Duration(seconds: 2), (){
      Navigator.of(context).pushReplacementNamed('/Login');
    });
  }

  @override
  void initState() {
    //precacheImage(AssetImage('assets/logo.png'), context);
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween(begin: 0.0, end: 1.0,).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.linear,
        )
    )
    ..addStatusListener((status){
      if(status == AnimationStatus.completed){
        startApp();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffb23718),
        body: AnimatedBuilder(
          animation: _animation,
          builder: (context, child){
            return Opacity(
              opacity: _animation.value,
              child: child,
            );
          },
          child: Center(
            child: Image.asset('assets/splash.jpg', fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }

}