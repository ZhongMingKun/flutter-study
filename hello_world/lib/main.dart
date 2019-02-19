import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/use_app_img.dart';
import 'pages/use_storage_img.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      routes: <String, WidgetBuilder>{
         '/': (BuildContext context) => AppHome(),
         '/use-app-img': (BuildContext context) => UseAppImgPage(),
         '/use-storage-img': (BuildContext context) => UseStorageImgPage(),
      }
    );
  }
}
