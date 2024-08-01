import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/like_icon.dart';
import 'package:flutter_application_1/pages/options_screen.dart';
import 'package:video_player/video_player.dart';

class ContentScreen extends StatefulWidget {
  final String? src;

  const ContentScreen({Key? key, this.src}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false;
  bool _isAudioPlaying = true; // Track audio playing state

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.src!);
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void _toggleAudioPlayback() {
    if (_isAudioPlaying) {
      _videoPlayerController.setVolume(0); // Mute the audio
    } else {
      _videoPlayerController.setVolume(1); // Unmute the audio
    }
    setState(() {
      _isAudioPlaying = !_isAudioPlaying; // Toggle the audio playback state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onTap: _toggleAudioPlayback,
                child: Chewie(
                  controller: _chewieController!,
                ),
              )
            : Container(),
        if (_liked)
          Center(
            child: LikeIcon(),
          ),
        OptionsScreen(),
      ],
    );
  }
}
