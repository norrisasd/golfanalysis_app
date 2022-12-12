// ignore_for_file: must_be_immutable

library flutter_camera;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golfanalysis_jpn/features/player/player.dart';

class RecordPage extends StatefulWidget {
  static GoRoute route() {
    return GoRoute(
        path: '/record',
        builder: (BuildContext context, GoRouterState state) {
          return RecordPage();
        });
  }

  // final List<CameraDescription>? cameras;
  final Color? color;
  final Color? iconColor;
  Function(XFile)? onImageCaptured;
  Function(XFile)? onVideoRecorded;
  final Duration? animationDuration;
  RecordPage(
      {Key? key,
      this.onImageCaptured,
      this.animationDuration = const Duration(seconds: 1),
      this.onVideoRecorded,
      this.iconColor = Colors.white,
      this.color = Colors.red})
      : super(key: key);
  @override
  RecordView createState() => RecordView();
}

class RecordView extends State<RecordPage> {
  List<CameraDescription>? cameras;

  CameraController? controller;

  @override
  void initState() {
    super.initState();
    initCamera().then((_) {
      setCamera(0);
    });
  }

  Future initCamera() async {
    cameras = await availableCameras();
    setState(() {});
  }

  void setCamera(int index) {
    controller = CameraController(cameras![index], ResolutionPreset.max);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  bool _isTouchOn = false;
  bool _isFrontCamera = false;

  ///Switch

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: AnimatedSwitcher(
        duration: widget.animationDuration!,
        child: videoView(),
      ),
    );
  }

  void captureImage() {
    controller!.takePicture().then((value) {
      Navigator.pop(context);
      widget.onImageCaptured!(value);
    });
  }

  void setVideo() {
    controller!.startVideoRecording();
  }

  ///Camera View Layout

  bool _isRecording = false;
  bool _isPaused = false;

  ///Video View
  Widget videoView() {
    return Stack(
      key: const ValueKey(1),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CameraPreview(
            controller!,
          ),
        ),

        ///Side controlls
        Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width,
              color: widget.color,
              height: 100,
              child: Row(
                children: [
                  ///Front Camera toggle
                  cameraSwitcherWidget(),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        _isRecording == false
                            ? 'Video recording is off'
                            : 'Video recording is on',
                        style: TextStyle(color: widget.iconColor, fontSize: 22),
                      ),
                    ),
                  ),

                  ///Flash toggle
                  flashToggleWidget()
                ],
              ),
            )),

        ///Bottom Controls
        Positioned(
          bottom: 0,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    //Start and stop video
                    if (_isRecording == false) {
                      ///Start
                      controller!.startVideoRecording();
                      setState(() {
                        _isRecording = true;
                      });
                    } else {
                      ///Stop video recording
                      controller!.stopVideoRecording().then((value) {
                        Navigator.pop(context);
                        widget.onVideoRecorded!(value);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayerPage()));
                      });
                    }
                  },
                  icon: Icon(
                    Icons.camera,
                    color: widget.iconColor,
                    size: 50,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {
                    //pause and resume video
                    if (_isRecording == true) {
                      //pause
                      if (_isPaused == true) {
                        ///resume
                        controller!.resumeVideoRecording();
                        _isPaused = false;
                      } else {
                        ///resume
                        controller!.pauseVideoRecording();
                        _isPaused = true;
                      }
                    }
                    setState(() {});
                  },
                  icon: Icon(
                    _isPaused == false ? Icons.pause_circle : Icons.play_circle,
                    color: widget.iconColor,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget flashToggleWidget() {
    return IconButton(
      onPressed: () {
        if (_isTouchOn == false) {
          controller!.setFlashMode(FlashMode.torch);
          _isTouchOn = true;
        } else {
          controller!.setFlashMode(FlashMode.off);
          _isTouchOn = false;
        }
        setState(() {});
      },
      icon: Icon(_isTouchOn == false ? Icons.flash_on : Icons.flash_off,
          color: widget.iconColor, size: 30),
    );
  }

  Widget cameraSwitcherWidget() {
    return IconButton(
      onPressed: () {
        if (_isFrontCamera == false) {
          setCamera(1);
          _isFrontCamera = true;
        } else {
          setCamera(0);
          _isFrontCamera = false;
        }
        setState(() {});
      },
      icon:
          Icon(Icons.change_circle_outlined, color: widget.iconColor, size: 30),
    );
  }
}
