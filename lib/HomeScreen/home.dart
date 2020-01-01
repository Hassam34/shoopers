import 'package:flutter/material.dart';
import './header.dart';
import './body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: <Widget>[
          // Header(),
          Body(),
        ],
      ),
    );
  }
}
