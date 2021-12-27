import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:venpartner/controller/completing_docs_controller.dart';
import 'package:venpartner/view/auth/completing_document.dart';
import 'package:venpartner/view/auth/upload_photo/upload_photo_page.dart';

// A screen that allows users to take a picture using a given camera.
class TakeKTPPage extends StatefulWidget {
  const TakeKTPPage({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakeKTPPageState createState() => TakeKTPPageState();
}

class TakeKTPPageState extends State<TakeKTPPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final CompletingDocsController _completingDocsController =
      Get.put(CompletingDocsController());

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambil Foto KTP'),
        backgroundColor: Colors.black,
      ),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 80,
                    child: CameraPreview(_controller)),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 300,
                      height: 450,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.red),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                    ),
                  ),
                )
              ],
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();

            _completingDocsController.updateImagePreview(1, image);

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPhotoPage(
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPhotoPage extends StatelessWidget {
  final String imagePath;

  const DisplayPhotoPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simpan Foto KTP?'),
        backgroundColor: Colors.black,
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 80,
        child: Column(
          children: [
            Container(
              height: 60,
              color: Colors.black,
              padding: EdgeInsets.all(12),
              child: Text(
                'Pastikan gambar yang diambil, sudah sesuai dengan ketentuan pengambilan gambar foto KTP',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 140,
              child: Image.file(
                File(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        // Provide an onPressed callback.
        onPressed: () async {
          Get.close(2);
        },
        label: Text('Simpan Foto'),
        icon: Icon(Icons.save_rounded),
      ),
    );
  }
}
