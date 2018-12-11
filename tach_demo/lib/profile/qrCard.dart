import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyCustomCard extends StatelessWidget {
  MyCustomCard({ this.colors });

  final MaterialColor colors;

  Widget build(BuildContext context) {
    return new Container(
      alignment: FractionalOffset.center,
      height: 144.0,
      width: 360.0,
      decoration: new BoxDecoration(
        color: colors.shade50,
        borderRadius: BorderRadius.circular(30.0),
        border: new Border.all(color: new Color(0xFF9E9E9E)),
      ),
      child: new FlutterLogo(size: 100.0, colors: colors),
    );
  }
}