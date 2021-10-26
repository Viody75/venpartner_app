import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'dart:io';

class CompletingDocsController extends GetxController {
  late CameraController _cameraController;
  late XFile profileImage = XFile('');
  late XFile ktpImage = XFile('');
  late XFile simImage = XFile('');
}
