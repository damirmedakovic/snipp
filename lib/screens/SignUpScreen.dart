import 'package:flutter/material.dart';
import 'package:snipp/services/auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String fullName = "";
  String email = "";
  String password = "";
  String error = "";

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
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
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              child: Form(
                key: _formKey,
                  child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (val) => val.isEmpty ? "Hva er navnet ditt?" : null,
                    onChanged: (val) {
                      setState(() {
                        fullName = val;
                      });
                    },
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      labelText: "Navn og Etternavn",
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.yellow,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (val) {
                      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val);
                      if (emailValid) {
                        return null;
                      } else {
                        return "Emailen ser ikke ut til å være korrekt";
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.yellow,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) => val.length < 6 ? "Passordet må være minst 6 bokstaver langt" : null,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    obscureText: true,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      labelText: "Passord",
                      labelStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.yellow,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 30),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color(0xffDA44bb),
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.black,
                    child: Text(
                      "Registrer",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {

                      if(_formKey.currentState.validate()) {

                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);

                        if(result == null) {
                          setState(() {
                            error = "En feil oppstod, kunne ikke registrere ny bruker.";
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
                  Text(error, style: TextStyle(color: Colors.red, fontSize: 12.0))
                ],
              ))),
        ));
  }
}
