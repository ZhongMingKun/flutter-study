import 'package:flutter/material.dart';
import '../shower.dart';

class TwoScreen extends StatefulWidget {
  final List<dynamic> blocks;
  TwoScreen({Key key, this.blocks});
  @override
  _TwoScreenState createState() => new _TwoScreenState();
}

class _TwoScreenState extends State<TwoScreen> {
  // String _dirPath;
  // String _screenNum;
  @override
  Widget build(BuildContext context) {
    print('============');
    print(widget.blocks[0]['files'] is List<dynamic>);
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Shower(dirPath: '/material', showList: widget.blocks[0]['files'],),
        ),
        Expanded(
          flex: 1,
          child: Shower(dirPath: '/material', showList: widget.blocks[1]['files'],),
        ),
      ],
    );
  }
}