import 'package:flutter/material.dart';
// import '../shower.dart';

class FourScreenVertial extends StatefulWidget {
  final List blocks;
  FourScreenVertial({Key key, this.blocks});
  @override
  _FourScreenVertialState createState() => new _FourScreenVertialState();
}

class _FourScreenVertialState extends State<FourScreenVertial> {
  // String _dirPath;
  // String _screenNum;
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
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
    );
  }
}