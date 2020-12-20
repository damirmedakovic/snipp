import 'package:flutter/material.dart';
import 'package:snipp/screens/DiscoverScreen.dart';
import 'dart:async';
import 'package:snipp/services/auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
  'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
  'https://images.unsplash.com/photo-1519345182560-3f2917c472ef?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80'
];

class HomeUserScreen extends StatefulWidget {
  @override
  _HomeUserScreenState createState() => _HomeUserScreenState();
}

/*RaisedButton(
onPressed: () async {
await _auth.signOut();
},
child: Text("Hello"),

 */
/*
Padding(
padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
child: TextField(
cursorColor: Colors.pink,
style: TextStyle(color: Colors.grey[400]),
decoration: InputDecoration(
filled: true,
fillColor: Colors.grey[800],
isDense: true,
contentPadding:
const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
focusedBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.pink),
),
border: OutlineInputBorder(
borderSide: BorderSide(color: Colors.pink),
borderRadius: BorderRadius.circular(25.0),
),
icon: Icon(Icons.search, color: Colors.grey[400]),
hintText: "Prøv 'Joe Rogan'",
hintStyle: TextStyle(color: Colors.grey[400])),
),
),
),


 */

class _HomeUserScreenState extends State<HomeUserScreen> {
  final AuthService _auth = AuthService();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: (() {
          switch (_currentIndex) {
            case 0:
              return DiscoverScreen();
            case 1:
              return DiscoverScreen();
            case 2:
              return DiscoverScreen();
              break;
          }
        }()),
      ),
      backgroundColor: Colors.black,
      body: (() {
        switch (_currentIndex) {
          case 0:
            return DiscoverScreen();

          case 1:
            return DiscoverScreen();
          case 2:
            return DiscoverScreen();
            break;
        }
      }()),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            backgroundColor: Colors.white,
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
