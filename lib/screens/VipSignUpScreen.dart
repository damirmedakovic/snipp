import 'package:flutter/material.dart';


class VipSignUpScreen extends StatefulWidget {
  @override
  _VipSignUpScreenState createState() => _VipSignUpScreenState();
}

class _VipSignUpScreenState extends State<VipSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Text("VIP sign up"),
    );
  }
}
