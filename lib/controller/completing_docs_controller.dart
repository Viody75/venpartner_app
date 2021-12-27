import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'dart:io';

class CompletingDocsController extends GetxController {
  late CameraController _cameraController;
  XFile profileImage = XFile('');
  XFile ktpImage = XFile('');
  XFile simImage = XFile('');

  void updateImagePreview(int i, XFile xFile) async {
    switch (i) {
      case 0:
        profileImage = xFile;
        update();
        break;
      case 1:
        ktpImage = xFile;
        update();
        break;
      case 2:
        simImage = xFile;
        update();
        break;
      default:
    }
  }
}
