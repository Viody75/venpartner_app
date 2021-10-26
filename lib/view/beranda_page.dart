import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venpartner/view/profile/profile_page.dart';

class BerandaPartnerPage extends StatefulWidget {
  const BerandaPartnerPage({Key? key}) : super(key: key);

  @override
  _BerandaPartnerPageState createState() => _BerandaPartnerPageState();
}

class _BerandaPartnerPageState extends State<BerandaPartnerPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-1.269160, 116.825264),
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  zoomControlsEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              Positioned(
                bottom: 24,
                right: 24,
                child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    heroTag: "btnLocation",
                    child: Icon(
                      Icons.my_location_rounded,
                      color: Colors.deepPurple,
                    ),
                    onPressed: () {}),
              ),
              Positioned(
                top: 24,
                right: 24,
                child: FloatingActionButton(
                    heroTag: "btnAbsen",
                    child: Icon(Icons.offline_pin_outlined),
                    onPressed: () {}),
              ),
              Positioned(
                top: 24,
                left: 24,
                child: InkWell(
                  onTap: () {
                    print('btnProfile Tapped');
                    Get.to(() => ProfilePage());
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
