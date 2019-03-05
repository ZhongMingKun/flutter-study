// import 'package:video_player/video_player.dart';
import '../components/custom_video_player.dart';
import 'package:flutter/material.dart';
class VideoDemoPage extends StatefulWidget {
  @override
  _VideoDemoPageState createState() => _VideoDemoPageState();
}

class _VideoDemoPageState extends State<VideoDemoPage> {
  var _videoPlayer;
  @override
  void initState() {
    super.initState();
    _videoPlayer = CustomVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayer;
  }

  @override
  void dispose() {
    super.dispose();
  }
}