import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snipp/screens/HomeUserScreen.dart';
import 'package:snipp/screens/SplashScreen.dart';
import 'package:snipp/screens/WelcomeScreen.dart';



class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    if(user == null) {
      return WelcomeScreen();
    } else {
      return HomeUserScreen();
    }
  }
}
