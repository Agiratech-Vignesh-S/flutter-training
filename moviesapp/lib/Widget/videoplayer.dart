
import 'package:flutter/material.dart';
import 'package:moviesapp/provider/moviesprovider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);
  static const routeName = '/Five_screen';

  @override
  _VideoAppState createState() => _VideoAppState();
}
class _VideoAppState extends State<VideoApp> {
   VideoPlayerController? controller;
  late final ChewieController chewieController;
  @override
  void initState() {
    chewieController = ChewieController(
      videoPlayerController: controller!,
      aspectRatio:5/8,
      autoInitialize: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
   super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
    chewieController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final val= Provider.of<Moviesprovider>(context,listen: false);
    return controller!.value.isInitialized
            ? AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
             child: VideoPlayer(controller!),
        ) : Container();
  }

}