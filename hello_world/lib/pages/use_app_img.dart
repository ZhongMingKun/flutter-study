import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

final itemCount = 5;
class UseAppImgPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<UseAppImgPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return new Image.asset('assets/images/${index+1}.jpg',fit: BoxFit.fill,);
        },
        itemCount: itemCount,
      ),
    );
  }
}
