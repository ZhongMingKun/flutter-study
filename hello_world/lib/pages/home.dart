import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(new MyApp());

class SwiperSetting {

}

const imgs = [
  'https://bbs-fd.zol-img.com.cn/t_s500x500/g4/M01/07/0D/Cg-4WlGUkVeIe17eAAoetZu8N6MAAIelgMKGekACh7N505.jpg',
  'https://bbs-fd.zol-img.com.cn/t_s500x500/g4/M01/07/0D/Cg-4WVGUkTqIWYRqABBjrc1wPQEAAIelgFuNAMAEGPF944.jpg',
  'http://via.placeholder.com/1080x1920'
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text('广告轮播')
        ),
        body: new Center(
          child: new Text('Hello World'),
        ),
      ),
    );
  }
}
