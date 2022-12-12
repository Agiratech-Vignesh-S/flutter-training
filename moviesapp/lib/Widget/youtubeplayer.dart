import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';



class YoutubeVideo extends StatefulWidget {
  String youtubeUrl;

  YoutubeVideo(this.youtubeUrl);

  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  String? addid() {
    String videoId = widget.youtubeUrl;
    return videoId;
  }
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: addid()!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )
      ..addListener(listener);
  }


  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      child:
      VisibilityDetector(
        key: const Key("unique key"),
        onVisibilityChanged: (info) {
          if (info.visibleFraction == 0) {
            _controller.pause();
          } else {
            _controller.value.isPlaying
                ? _controller.play()
                : _controller.pause();
          }
        },
        child:
        YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            topActions: <Widget>[
               SizedBox(width: 8.0),
            ],
            onReady: () {
              _controller.addListener(listener);
            },
            onEnded: (data) {},
          ),
      )
    );
  }
}