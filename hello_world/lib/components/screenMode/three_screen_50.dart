import 'package:flutter/material.dart';
// import '../shower.dart';

class ThreeScreen50 extends StatefulWidget {
  final List blocks;
  ThreeScreen50({Key key, this.blocks});
  @override
  _ThreeScreen50State createState() => new _ThreeScreen50State();
}

class _ThreeScreen50State extends State<ThreeScreen50> {
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
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blueAccent,
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