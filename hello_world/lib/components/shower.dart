import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class Shower extends StatefulWidget {
  final String dirPath;
  final List showList;
  Shower({Key key, this.dirPath, this.showList}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ShowerState();
}

class ShowerState extends State<Shower> {
  List _showList; /// = [
  ///   {
  ///     'name':'The_Organ_at_Arches_National_Park_Utah_Corrected.jpg',
  ///     'type': 'image',
  ///     'delay': 5000
  ///   },
  ///   {
  ///     'name': 'BigBuckBunny.mp4',
  ///     'type': 'video'
  ///   },
  ///   {
  ///     'name': 'Canyonlands_National_Park%E2%80%A6Needles_area_%286294480744%29.jpg',
  ///     'type': 'image',
  ///     'delay': 5000
  ///   },
  ///   {
  ///     'name': 'ElephantsDream.mp4',
  ///     'type': 'video'
  ///   },
  ///   {
  ///     'name': 'Sand_Dunes_in_Death_Valley_National_Park.jpg',
  ///     'type': 'image',
  ///     'delay': 5000
  ///   }
  /// ];
  String _dirPath;
  /// 轮播下标
  int _index = 0;
  /// 当前播放的物料
  Map _currShowMateriel;
  /// 延时器，记录是否播放完毕
  Timer _delay;
  Timer _switchDelay;
  VideoPlayerController _controller;
  Widget _child;
  @override
  void initState() {
    super.initState();
    _prepare();
  }
  @override
  Widget build(BuildContext context) {
    return _buildShower(_currShowMateriel);
  }
  @override
  void dispose() {
    super.dispose();
    _delay.cancel();
  }

  Widget _buildShower(materialInfo) {
    if (materialInfo == null) {
      print('=============null==============');
      _child = null;
      return Container(
        child: _child,
      );
    }
    File newFile = _getMaterielFile(materialInfo['name']);
    print(newFile);
    if (materialInfo['type'] == 'image') {
      _child = Image.file(
        newFile,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
      );
      print(_child);
      _setDelay(materialInfo['delay'], _onEnd);
    }
    if (materialInfo['type'] == 'video') {
      _controller = VideoPlayerController.file(newFile)
        ..initialize()
        .then((_) {
          _controller.play();
          _setDelay(10000, _onEnd);
        });
      _child = VideoPlayer(_controller);
    }
    return Container(
      child: _child
    );
  }
  /// 设置延时
  void _setDelay(int time, Function cb) {
    _delay = Timer.periodic(
      Duration(milliseconds: time),
      cb
    );
  }
  /// 延时结束回调动作
  void _onEnd(Timer timer) {
    _delay.cancel();
    setState(() {
      _currShowMateriel = null;
    });
    _switchDelay = Timer.periodic(Duration(milliseconds: 10), _changeCurrShowMateriel);
    // _changeCurrShowMateriel();
  }
  /// 修改当前物料
  void _changeCurrShowMateriel(Timer timer) {
    _switchDelay.cancel();
    setState(() {
      _index++;
      if (_index >= _showList.length) {
        _index = 0;
      }
      _currShowMateriel = _showList[_index];
    });
  }
  /// 获取物料File
  File _getMaterielFile(String fileName) {
    String path = '$_dirPath/$fileName';
    return new File(path);
  }

  /// 初始化
  Future<Null> _prepare() async {
    _showList = widget.showList;
    // _dirPath = (await getApplicationDocumentsDirectory()).path + '/material';
    _dirPath = (await getApplicationDocumentsDirectory()).path + widget.dirPath;
    print(_dirPath);
    setState(() {
      _currShowMateriel = _showList[_index];
      final dir = Directory(_dirPath);
      print(dir);
      final files = dir.listSync(recursive: true, followLinks: false);
      print(files);
    });
  }
}