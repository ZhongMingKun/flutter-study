import 'package:flutter/material.dart';
import 'package:multi_image_picker/asset.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ImageSwiper extends StatefulWidget {
  final List<Asset> _imgList;

  ImageSwiper(this._imgList);

  @override
  State<StatefulWidget> createState() => ImageSwiperState(this._imgList);
}

class ImageSwiperState extends State<ImageSwiper> {
  List<Asset> _imgList;
  ImageSwiperState(this._imgList);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return new Image.memory(
            this._imgList[index].thumbData.buffer.asUint8List(),
            fit: BoxFit.fill
          );
        },
        itemCount: this._imgList.length,
      ),
    );
  }
}