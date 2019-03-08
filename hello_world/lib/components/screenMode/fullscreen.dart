import 'package:flutter/material.dart';
// import '../shower.dart';

class FullScreen extends StatefulWidget {
  final List blocks;
  FullScreen({Key key, this.blocks});
  @override
  _FullScreenState createState() => new _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  // String _dirPath;
  // String _screenNum;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent
    );
  }
}