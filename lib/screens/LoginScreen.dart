import 'package:flutter/material.dart';
import 'package:snipp/screens/Wrapper.dart';
import 'package:snipp/services/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";
  String error = "";


  void _navigateBackToWrapper() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => Wrapper()
    ));
  }

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
        ),
        body: Container(
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
                      validator: (val) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val);
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
                      validator: (val) => val.length < 6
                          ? "Passordet må være minst 6 bokstaver langt"
                          : null,
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
                        "Logg inn",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {

                        if (_formKey.currentState.validate()) {
                          dynamic result =
                          _auth.loginWithEmailAndPassword(email, password);

                          if (result == null) {
                            setState(() {
                              error = "Feil brukernavn eller passord";
                            });
                          } else {
                            //_navigateBackToWrapper();
                            print("dick");
                          }
                        } else {
                          setState(() {
                            error = "Noen felter er ikke riktig fylt ut";
                          });
                        }

                      },
                    ),
                    SizedBox(height: 14.0),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 12.0))
                  ],
                ))));
  }
}
