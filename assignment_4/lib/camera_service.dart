import 'package:camera/camera.dart';

class CameraService {
  CameraController? controller;

  Future<void> init() async {
    final cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    await controller!.initialize();
  }

  Future<String> takePicture() async {
    final picture = await controller!.takePicture();
    return picture.path;
  }
}
