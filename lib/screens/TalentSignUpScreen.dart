import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snipp/screens/HomeTalentScreen.dart';
import 'package:snipp/services/auth.dart';
import 'package:snipp/services/database.dart';
import 'dart:async';

class TalentSignUpScreen extends StatefulWidget {
  final String code;
  final String name;
  final String title;

  TalentSignUpScreen({Key key, this.code, this.name, this.title})
      : super(key: key);

  @override
  _TalentSignUpScreenState createState() => _TalentSignUpScreenState();
}

class _TalentSignUpScreenState extends State<TalentSignUpScreen> {
  final VipCodeDatabaseService _vipCodeDatabaseService =
      VipCodeDatabaseService();

  String code = "";
  String name = "";
  String title = "";
  String error = "";

  double _currentSliderValue = 250;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.pink, Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Snipp",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = linearGradient,
                              fontSize: 30,
                              fontFamily: 'Pacifico'),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Velkommen ${widget.name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          "Din kode er ${widget.code}. Du kan bruke denne for å logge inn på Snipp når som helst. Hold den hemmelig!",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (val) {},
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[800],
                              isDense: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 10.0, top: 10.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.pink),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.pink),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              hintText: "Skriv en kort bio til profilen din",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                          minLines: 3,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                        ),
                        SizedBox(height: 20),
                        Text("Velg din pris per video.", style: TextStyle(color: Colors.white),),
                        Text("Du kan endre denne senere.", style: TextStyle(color: Colors.white),),

                        SizedBox(height: 20),
                        Slider(
                          value: _currentSliderValue,
                          min: 0,
                          max: 2000,
                          activeColor: Colors.pink,
                          inactiveColor: Colors.white,
                          divisions: 50,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        ),
                        Text("Din pris er ${_currentSliderValue} NOK/video", style: TextStyle(color: Colors.white),),
                        SizedBox(
                          height: 50,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(50)),
                          color: Colors.pink,
                          child: Text(
                            "Fortsett",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              dynamic result = null;
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);

                              var route = new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new HomeTalentScreen());

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomeTalentScreen()));

                              if (result == null) {
                                setState(() {
                                  error =
                                      "En feil oppstod, kunne ikke registrere ny bruker.";
                                });
                              }
                            } else {
                              setState(() {
                                error = "Noen felt er ikke fylt ut riktig";
                              });
                            }
                          },
                        ),
                        SizedBox(height: 14.0),
                        Text(error,
                            style: TextStyle(color: Colors.red, fontSize: 12.0))
                      ],
                    ))),
          ),
        ));
    ;
  }
}
