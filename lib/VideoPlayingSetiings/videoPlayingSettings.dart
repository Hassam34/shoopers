import 'package:flutter/material.dart';
import "package:video_player/video_player.dart";
import "package:chewie/chewie.dart";
import 'dart:io' show Platform;

class VideoPlayingSettings extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  VideoPlayingSettings({Key key, @required this.videoPlayerController})
      : super(key: key);
  @override
  _VideoPlayingSettingsState createState() => _VideoPlayingSettingsState();
}

class _VideoPlayingSettingsState extends State<VideoPlayingSettings> {
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    // widget.videoPlayerController.pause();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoInitialize: true,
      autoPlay: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  bool isAndroidOK;
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      isAndroidOK = true;
    } else if (Platform.isIOS) {
      isAndroidOK = false;
    }
    return Container(
      padding: EdgeInsets.all(0),
      child: Stack(
        children: <Widget>[
          Chewie(
            controller: _chewieController,
          ),
          isAndroidOK
              ? Container(
                  // margin: EdgeInsets.only(left: 70),
                  height: 33,
                  width: 38,
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Container(
                    decoration: new BoxDecoration(
                        // border: Border.all(width: .5, color: Colors.black38),
                        //new Color.fromRGBO(255, 0, 0, 0.0),
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(100.0),
                          topRight: const Radius.circular(100.0),
                          bottomLeft: const Radius.circular(100.0),
                          bottomRight: const Radius.circular(100.0),
                        ),
                        color: Colors.black38),
                    child: GestureDetector(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 25.0,
                      ),
                      onTap: () => {
                        widget.videoPlayerController.pause(),
                        _chewieController.pause(),
                        Navigator.pop(context)
                      },
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
