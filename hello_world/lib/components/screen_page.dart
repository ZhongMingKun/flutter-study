import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import './screenMode/main.dart';

class ScreenPage extends StatefulWidget {
  Map<String, dynamic> screenSetting;
  ScreenPage({Key key, this.screenSetting}) : super(key: key);

  @override
  _ScreenPageState createState() => new _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  bool _isLoading = false;
  String _loadingTxt = '加载中...';
  String _mode;
  String _id;
  List<Map<String, dynamic>> _blocks;
  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _prepare();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Builder(
        builder: (context) => _isLoading
        ? new Center(
            child: new CircularProgressIndicator(
              semanticsLabel: _loadingTxt,
            ),
          )
        : _buildPage(_mode),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildPage(String screenMode) {
    switch (_mode) {
      case 'fullScreen': {
        return FullScreen(blocks: _blocks);
      }
      case 'twoScreen': {
        return TwoScreen(blocks: _blocks);
      }
      case 'threeScreen50': {
        return ThreeScreen50(blocks: _blocks);
      }
      case 'threeScreen66': {
        return ThreeScreen66(blocks: _blocks);
      }
      case 'fourScreenVertial': {
        return FourScreenVertial(blocks: _blocks);
      }
      case 'fourScreenSquare': {
        return FourScreenSquare(blocks: _blocks);
      }

      default: {
        return FullScreen(blocks: _blocks);
      }
    }
  }

  /// 初始化
  Future<Null> _prepare() async {
    _id = widget.screenSetting['id'];
    _mode = widget.screenSetting['mode'];
    _blocks = widget.screenSetting['blocks'];
    _isLoading = false;
  }
}