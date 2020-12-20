
import 'package:flutter/material.dart';

class DiscoverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );

  }
}
