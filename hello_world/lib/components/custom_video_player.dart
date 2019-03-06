import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
class CustomVideoPlayer extends StatefulWidget {
  final onEnd;

  CustomVideoPlayer({Key key, this.onEnd});
  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  List<String> _videoList = ['assets/video/1.mp4', 'assets/video/2.mp4'];
  VideoPlayerController _controller;
  int _index = 0;
  CancelableOperation _delay;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        _videoList[_index],)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
          _delay = CancelableOperation.fromFuture(Future.delayed(
            Duration(milliseconds: _controller.value.duration.inMilliseconds),
            _onEnd
          ));
        });
      });
  }
  void _onEnd() {
    setState(() {
      int _newIndex = _index + 1;
      _index = _newIndex >= _videoList.length ? 0 : _newIndex;
      _controller = VideoPlayerController.asset(
        _videoList[_index],)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
          _delay = CancelableOperation.fromFuture(Future.delayed(
            Duration(milliseconds: _controller.value.duration.inMilliseconds),
            _onEnd
          ));
        });
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
    _delay.cancel();
  }
}