import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerBox extends StatefulWidget {
  final String url;
  const VideoPlayerBox({required this.url, super.key});

  @override
  State<VideoPlayerBox> createState() => _VideoPlayerBoxState();
}

class _VideoPlayerBoxState extends State<VideoPlayerBox> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
        _controller?.play();
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (_controller != null && _controller!.value.isInitialized)
        ? AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: VideoPlayer(_controller!),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
