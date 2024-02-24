import 'package:flutter/material.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';
import 'package:video_player/video_player.dart';

class EduVideoPlayer extends StatefulWidget {
  const EduVideoPlayer({Key? key}) : super(key: key);

  @override
  _EduVideoPlayerState createState() => _EduVideoPlayerState();
}

class _EduVideoPlayerState extends State<EduVideoPlayer> {
  bool fullscreen = false;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(),
    );
  }
}
