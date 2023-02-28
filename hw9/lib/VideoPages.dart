import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final int n;
  const VideoPlayerScreen({super.key, required this.n});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final List<String> itemsVideos = [
    "videos/Fujii Kaze - Matsuri Live at Panasonic Stadium Suita.mp4",
    "videos/Kodaline - All I Want (Official Live Video) (1).mp4",
    "videos/태연 (TAEYEON) - 11-11 (male acoustic ver.) cover by 유빈 X 정완.mp4",
    "videos/[최초공개] TXT (투모로우바이투게더) - Anti-Romantic (4K) - TXT COMEBACKSHOW FREEZE - Mnet 210531 방송.mp4",
    "videos/Sleeping At Last - Saturn (Official Music Video).mp4",
  ];
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset(itemsVideos[widget.n]);
    // _controller = VideoPlayerController.asset("assets/videos/test.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          }
          return CircularProgressIndicator();
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
