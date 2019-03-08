import 'package:flutter/material.dart';
// import '../shower.dart';

class FourScreenSquare extends StatefulWidget {
  final List blocks;
  FourScreenSquare({Key key, this.blocks});
  @override
  _FourScreenSquareState createState() => new _FourScreenSquareState();
}

class _FourScreenSquareState extends State<FourScreenSquare> {
  // String _dirPath;
  // String _screenNum;
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.redAccent,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blueAccent,
                ),
              ),
            ],

          ),
        ),
        Expanded(
          flex: 1,
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.yellowAccent,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.greenAccent,
                ),
              ),
            ],

          ),
        ),
      ],
    );
  }
}