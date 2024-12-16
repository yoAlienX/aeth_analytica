import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3, milliseconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          spacing: 30,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/images/splash.png',
          ),
        )),
        Text('This is splashscreen', style: TextStyle(fontSize: 30),)
      ],
    ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('Home Page', style: TextStyle(fontSize: 30))));
  }
}
