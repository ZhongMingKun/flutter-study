import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import '../components/asset_view.dart';

class UseStorageImgPage extends StatefulWidget {
  @override
  _PageState createState() => new _PageState();
}

class _PageState extends State<UseStorageImgPage> {
  List<Asset> images = List<Asset>();
  String _error;

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        return AssetView(index, images[index]);
      }),
    );
  }

  Future<void> loadAssets() async {

    List<Asset> resultList;
    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 15,
      );
    } on PlatformException catch (e) {
      error = e.message;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      if (resultList.length != 0) {
        images = resultList;
      }
      if (error == null) _error = 'No Error Dectected';
      print(_error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('选择图片轮播'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Center(
              child: RaisedButton(
            child: Text("选择图片"),
            onPressed: loadAssets,
          )),
          Expanded(
            child: buildGridView(),
          )
        ],
      ),
    );
  }
}
