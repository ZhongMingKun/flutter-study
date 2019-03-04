import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoDemoPage extends StatefulWidget {
  @override
  _VideoDemoPageState createState() => _VideoDemoPageState();
}

class _VideoDemoPageState extends State<VideoDemoPage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/video/1.mp4',)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _controller.value.initialized
              ? VideoPlayer(_controller)
              : Container()
      );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}