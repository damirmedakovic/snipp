import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

import 'package:snipp/screens/WelcomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    _checkForSession().then(
            (status) {
          if (status) {
            _navigateToHome();
          } else {
            _navigateToHome();
          }
        }
    );
  }


        Future<bool> _checkForSession()
    async {
      await Future.delayed(Duration(microseconds: 9000), () {});

      return true;
    }

    void _navigateToHome() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => WelcomeScreen()
      ));
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: SizedBox.expand(
              child: Container(
                  color: Colors.black,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Shimmer.fromColors(
                        baseColor: Color(0xff7f00ff),
                        highlightColor: Color(0xffe100ff),
                        child: Text("Snipp", style: TextStyle(
                            fontSize: 80, fontWeight: FontWeight.bold, fontFamily: 'Pacifico'),),)
                    ],
                  ))));
    }
  }
