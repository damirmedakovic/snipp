import 'package:flutter/material.dart';
import 'package:snipp/screens/LoginScreen.dart';
import 'package:snipp/screens/SignUpScreen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snipp/screens/VipSignUpScreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void _navigateToLogin() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  void _navigateToSignUp() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => SignUpScreen()));
  }

  void _navigateToVipSignUp() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => VipSignUpScreen()));
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Column(children: <Widget>[
        Expanded(
            child: Container(
                child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Shimmer.fromColors(
              baseColor: Color(0xff7f00ff),
              highlightColor: Color(0xffe100ff),
              child: Text("Snipp", style: TextStyle(
                  fontSize: 80, fontWeight: FontWeight.bold, fontFamily: 'Pacifico'),),)
          ],
        ))),
        Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Color(0xffDA44bb),
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {
                    _navigateToLogin();
                  },
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child:
                        Text("Logg inn", style: TextStyle(color: Colors.white)),
                  )),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Color(0xffDA44bb),
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                  color: Colors.black,
                  onPressed: () {
                    _navigateToSignUp();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Registrer",
                        style: TextStyle(color: Colors.white)),
                  )),
            ])),
        RaisedButton(
          color: Colors.black,
          onPressed: () {
            _navigateToVipSignUp();
          },
          child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 80.0),
              child: Text("VIP invite", style: TextStyle(color: Colors.white))),
        )
      ]),
    ));
    ;
  }
}
