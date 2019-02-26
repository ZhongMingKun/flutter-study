import 'package:flutter/material.dart';
import 'package:root_access/root_access.dart';
import 'dart:async';

import 'common/api.dart';
import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/use_app_img.dart';
import 'pages/use_storage_img.dart';
import 'pages/video_player_demo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool _rootAccess = false;

  // @override
  // void initState() {
  //   super.initState();
  //   initRootRequest();
  // }

  // Future<void> initRootRequest() async {
  //   bool rootAccess = await RootAccess.rootAccess;

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;

  //   setState(() {
  //     _rootAccess = rootAccess;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Api().test({'tag': 1});
    // print('Root access granted: $_rootAccess\n');
    return new MaterialApp(
      title: 'Welcome to Flutter',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => LoginPage(),
        '/home': (BuildContext context) => AppHome(),
        '/use-app-img': (BuildContext context) => UseAppImgPage(),
        '/use-storage-img': (BuildContext context) => UseStorageImgPage(),
        '/video-player-demo': (BuildContext context) => VideoDemoPage(),
      });
  }
}
