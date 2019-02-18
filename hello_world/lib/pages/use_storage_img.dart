import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'dart:io';
// import 'package:flutter_swiper/flutter_swiper.dart';

// class SwiperSetting {

// }

// const imgs = [
//   'https://bbs-fd.zol-img.com.cn/t_s500x500/g4/M01/07/0D/Cg-4WlGUkVeIe17eAAoetZu8N6MAAIelgMKGekACh7N505.jpg',
//   'https://bbs-fd.zol-img.com.cn/t_s500x500/g4/M01/07/0D/Cg-4WVGUkTqIWYRqABBjrc1wPQEAAIelgFuNAMAEGPF944.jpg',
//   'http://via.placeholder.com/1080x1920'
// ];

class UseStorageImgPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<UseStorageImgPage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
