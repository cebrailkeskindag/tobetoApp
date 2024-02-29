import 'package:flutter/material.dart';
import 'package:tobetoapp/models/edu.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class EduVideoPlayer extends StatefulWidget {
  final Uri videoUrl;
  final Edu edu;

  EduVideoPlayer({required this.videoUrl ,required this.edu });

  @override
  _EduVideoPlayerState createState() => _EduVideoPlayerState();
}

class _EduVideoPlayerState extends State<EduVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(widget.videoUrl);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      // Bunlar opsiyonel, video oynatıcı kontrolleri ve görünümü özelleştirmek için kullanılabilir
      aspectRatio: 16 / 9,
      showControls: true,
      materialProgressColors: ChewieProgressColors(
       // playedColor: Colors.red,
       // handleColor: Colors.blue,
       // backgroundColor: Colors.grey,
       // bufferedColor: Colors.lightGreen,
      ),
    );

    // Duration videoLength = _videoPlayerController.value.duration;
    // print('Video uzunluğu: ${videoLength.inSeconds} saniye');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.edu.title),
      ),
      body: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
