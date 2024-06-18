import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraCapture extends StatefulWidget {
  const CameraCapture({super.key});
  // TODO: Stream video data from cloud

  @override
  State<CameraCapture> createState() => _CameraCaptureState();
}

class _CameraCaptureState extends State<CameraCapture> {
  late CameraController controller;
  List<CameraDescription>? cameras;

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    if (cameras == null) return;
    if (cameras!.isEmpty) return;

    /// Camera controller, opens front camera in [cameras![1]]
    controller = CameraController(
      cameras![1],
      ResolutionPreset.high,
      enableAudio: false, // Disable audio due to separation of control
    );
    await controller.initialize();

    if (!mounted) return;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeCamera(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CameraPreview(controller);
        } else if (snapshot.hasError) {
          return Container(child: Text('error'));
        } else {
          return Container(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

Future<List<CameraDescription>> getCameras() async {
  return await availableCameras();
}
