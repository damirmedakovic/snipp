import 'package:flutter/material.dart';
import 'package:snipp/screens/TalentSignUpScreen.dart';
import 'package:snipp/screens/Wrapper.dart';
import 'package:snipp/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snipp/services/database.dart';

class VipCodeScreen extends StatefulWidget {
  @override
  _VipCodeScreenState createState() => _VipCodeScreenState();
}

class _VipCodeScreenState extends State<VipCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  final VipCodeDatabaseService _vipCodeDatabaseService =
      VipCodeDatabaseService();

  String vipCode = "";
  String error = "";

  void _navigateBackToWrapper() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Wrapper()));
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.pink, Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
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
                        height: 80,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          setState(() {
                            vipCode = val;
                          });
                        },
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
                            hintText: "VIP KODE",
                            hintStyle: TextStyle(color: Colors.grey[400])),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: Text(
                            "Skriv inn din hemmelige VIP-kode for å fortsette",
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(
                        height: 40,
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
                            dynamic result = await _vipCodeDatabaseService
                                .vipUserExists(vipCode);

                            if (result == null) {
                              setState(() {
                                error =
                                    "Kunne ikke finne bruker med oppgitt kode.";
                              });
                            } else {

                              String code = result.data()["code"];
                              String name = result.data()["name"];
                              String title = result.data()["title"];

                              var route = new MaterialPageRoute(builder: (BuildContext context) => new TalentSignUpScreen(code: code, name: name, title: title));

                              Navigator.of(context).pushReplacement(route);

                            }
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      Text(error,
                          style: TextStyle(color: Colors.red, fontSize: 12.0))
                    ],
                  ))),
        ));
  }
}
