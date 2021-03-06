import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? cameraController;
  List<CameraDescription>? cameras;
  bool isReady = false;
  XFile? image;
  String imagePath = '';
  bool isImage = false;

  @override
  void initState() {
    super.initState();

    setupCameras();
  }

  Future<void> setupCameras() async {
    try {
      cameras = await availableCameras();
      cameraController =
          new CameraController(cameras!.first, ResolutionPreset.medium);
      await cameraController!.initialize();
    } on CameraException catch (_) {
      setState(() {
        isReady = false;
      });
    }
    setState(() {
      isReady = true;
    });
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isReady && cameraController == null ||
        !cameraController!.value.isInitialized) {
      return new Container();
    }
    return AspectRatio(
      aspectRatio: cameraController!.value.aspectRatio,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CameraPreview(cameraController!),
          Visibility(
            visible: isImage,
            child: Stack(
              // fit: StackFit.expand,
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 32.0),
                  // width: size.width,
                  // height: size.height / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.file(
                      // ignore: unnecessary_null_comparison
                      File(imagePath == null ? '' : imagePath),
                    ),
                  ),
                )

                // Container(
                //   margin: const EdgeInsets.symmetric(horizontal: 32.0),
                //   width: size.width,
                //   height: size.height / 3,
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Colors.blueAccent),
                //     borderRadius: BorderRadius.all(Radius.circular(16.0)),
                //     color: Colors.grey,
                //   ),
                //   child: Image.file(
                //     // ignore: unnecessary_null_comparison
                //     File(imagePath == null ? '' : imagePath),
                //     // fit: BoxFit.fill,
                //   ),
                // ),
                // Container(
                //   padding: const EdgeInsets.only(
                //     left: 12.0,
                //     top: 12.0,
                //   ),
                //   width: 24.0,
                //   height: 24.0,
                //   // ignore: deprecated_member_use
                //   child: FlatButton(
                //     onPressed: () {
                //       setState(() {
                //         isImage = false;
                //         imagePath = '';
                //       });
                //     },
                //     padding: EdgeInsets.all(0.0),
                //     child: SvgPicture.asset(
                //       PathConstant.closeIcon,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            child: Center(
              child: FloatingActionButton(
                onPressed: () async {
                  if (imagePath == '') {
                    try {
                      image = await cameraController!.takePicture();
                      imagePath = image!.path;
                      setState(() {
                        isImage = true;
                      });
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                child: const Icon(Icons.camera_alt),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
