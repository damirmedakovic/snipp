import 'package:flutter/material.dart';
import 'package:snipp/screens/DiscoverScreen.dart';
import 'package:snipp/screens/FeedScreen.dart';
import 'package:snipp/screens/ProfileUserScreen.dart';
import 'dart:async';
import 'package:snipp/services/auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:snipp/widgets/DiscoverAppBar.dart';
import 'package:snipp/widgets/FeedAppBar.dart';
import 'package:snipp/widgets/ProfileAppBar.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
  'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
  'https://images.unsplash.com/photo-1519345182560-3f2917c472ef?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80'
];

class HomeTalentScreen extends StatefulWidget {
  @override
  _HomeTalentScreenState createState() => _HomeTalentScreenState();
}



class _HomeTalentScreenState extends State<HomeTalentScreen> {
  final AuthService _auth = AuthService();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: (() {
            switch (_currentIndex) {
              case 0:
                return DiscoverAppBar();
              case 1:
                return NotificationsAppBar();
              case 2:
                return ProfileAppBar();
            }
          }()),

          actions: (() {

            switch(_currentIndex) {

              case 1:
                return [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.white,),
                  ),
                ];
              case 2:
                return [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings, color: Colors.white, size: 20.0,),
                  ),
                ];
            }

          }())

      ),
      backgroundColor: Colors.black,
      body: (() {
        switch (_currentIndex) {
          case 0:
            return DiscoverScreen();

          case 1:
            return FeedScreen();
          case 2:
            return ProfileUserScreen();
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
          BottomNavigationBarItem(icon: Icon(Icons.all_inbox_outlined), label: ""),

          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
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
