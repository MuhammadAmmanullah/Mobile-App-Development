class CameraService {
  Future<void> init() async {
    await Future.delayed(Duration(milliseconds: 500));
  }

  Future<String> takePicture() async {
    await Future.delayed(Duration(milliseconds: 500));
    return "/storage/emulated/0/Pictures/sample.jpg";
  }
}
