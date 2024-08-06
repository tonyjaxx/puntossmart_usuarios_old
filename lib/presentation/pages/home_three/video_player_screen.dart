import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:puntossmart/presentation/components/buttons/custom_button.dart';
import 'package:puntossmart/presentation/pages/home_three/controller/promotion_controller.dart';
import 'package:puntossmart/presentation/theme/app_style.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String points;
  final int shopID;
  const VideoPlayerScreen({
    required this.videoUrl,
    required this.points,
    required this.shopID,
  });

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  Duration _videoDuration = Duration.zero;
  Duration _currentPosition = Duration.zero;
  bool _showControls = true;
  PromotionController promotionController = Get.put(PromotionController());

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _isPlaying = true;
          _videoDuration = _controller.value.duration;
        });
      });

    _controller.addListener(() {
      setState(() {
        _currentPosition = _controller.value.position;
      });
    });

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _showControls = !_showControls;
              });
            },
            child: Center(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: CircleAvatar(
              backgroundColor: AppStyle.brandGreen,
              radius: 20,
              child: GestureDetector(
                onTap: () {
                  if (_videoDuration.inSeconds.toDouble() >
                      _currentPosition.inSeconds.toDouble()) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                              decoration: const BoxDecoration(
                                color: AppStyle.bgGrey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              ),
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      FlutterRemix.close_circle_line,
                                      size: 80,
                                      color: AppStyle.red,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "¿Salir?",
                                      style: AppStyle.interBold(
                                          color: AppStyle.red),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "¿Estás seguro de que deseas salir sin recompensa?",
                                      style: AppStyle.interRegular(),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomButton(
                                            borderColor: AppStyle.black,
                                            background: AppStyle.transparent,
                                            title: "No",
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: CustomButton(
                                            background: AppStyle.red,
                                            textColor: AppStyle.white,
                                            title: "Sí, Salir",
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  ]));
                        });
                  } else {
                    if (_videoDuration.inSeconds.toDouble() ==
                        _currentPosition.inSeconds.toDouble()) {
                      promotionController.getPromotionPoints(
                        context,
                        points: widget.points,
                        userID: widget.shopID.toString(),
                      );
                    }
                  }
                },
                child: Icon(
                  FlutterRemix.arrow_go_back_line,
                  size: 18,
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.color
                      ?.withOpacity(.75),
                ),
              ),
            ),
          ),
          if (_showControls)
            Positioned(
              bottom: 30,
              left: 30,
              right: 30,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyle.black,
                          boxShadow: [
                            BoxShadow(
                                color: AppStyle.bgGrey,
                                spreadRadius: 1,
                                blurRadius: 5)
                          ],
                        ),
                        child: Text(
                          _formatDuration(_currentPosition),
                          style: AppStyle.interRegular(color: AppStyle.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppStyle.black,
                          boxShadow: [
                            BoxShadow(
                                color: AppStyle.bgGrey,
                                spreadRadius: 1,
                                blurRadius: 5)
                          ],
                        ),
                        child: Text(
                          _formatDuration(_videoDuration),
                          style: AppStyle.interRegular(color: AppStyle.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                      activeColor: AppStyle.brandGreen,
                      min: 0,
                      max: _videoDuration.inSeconds.toDouble(),
                      value: _currentPosition.inSeconds.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          _controller.seekTo(Duration(seconds: value.toInt()));
                        });
                      }),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                        _isPlaying = !_isPlaying;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: AppStyle.brandGreen,
                      radius: 22,
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 20,
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.color
                            ?.withOpacity(.75),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }
}
