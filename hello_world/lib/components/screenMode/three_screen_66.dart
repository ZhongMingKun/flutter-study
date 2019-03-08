import 'package:flutter/material.dart';
// import '../shower.dart';

class ThreeScreen66 extends StatefulWidget {
  final List blocks;
  ThreeScreen66({Key key, this.blocks});
  @override
  _ThreeScreen66State createState() => new _ThreeScreen66State();
}

class _ThreeScreen66State extends State<ThreeScreen66> {
  // String _dirPath;
  // String _screenNum;
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          flex: 2,
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