import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:io';
import 'package:flutter_swiper/flutter_swiper.dart';

// class SwiperSetting {

// }

class UseAppImgPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //     appBar: new AppBar(
  //       centerTitle: true,
  //       title: new Text('静态图片')
  //     ),
  //     body: new Center(
  //       child: new Text('dudulu'),
  //     ),
  //   );
  // }
}

class _MyHomePageState extends State<UseAppImgPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return new Image.asset('images/${index+1}.jpg',fit: BoxFit.fill,);
        },
        itemCount: 5,
      ),
    );
  }
}
