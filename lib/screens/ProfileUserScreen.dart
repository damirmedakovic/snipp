
import 'package:flutter/material.dart';
import 'package:snipp/services/auth.dart';


class ProfileUserScreen extends StatefulWidget {
  @override
  _ProfileUserScreenState createState() => _ProfileUserScreenState();
}





class _ProfileUserScreenState extends State<ProfileUserScreen> {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () async {
      await _auth.signOut();
    },
    child: Text("Logg ut"),);
  }
}
