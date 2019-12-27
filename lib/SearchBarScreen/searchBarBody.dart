import 'package:flutter/material.dart';
import "../HomeScreen/header.dart";

// import './timelineBody.dart';
class SearchBarBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: new IconButton(
               icon: new Icon(Icons.arrow_back, color: Colors.blue),
               onPressed: () => Navigator.pop(context),
              ), 
        title: Text(
          "Search",
          style: TextStyle(
            fontFamily: 'HelveticaMedium',
            fontSize: 20  ,
            // fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
