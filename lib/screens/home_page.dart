import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'card_with_camer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<CameraDescription> _cameras;
  late CameraController _controller;
  bool _isReady = false;

  /// This method is used to set up the camera. We are using the availableCameras() method from the camera package to retrieve a list of cameras that are available on the device. and then we initialize the camera controller. after that we set the _isReady variable to true.
  void _setUpCamera() async {
    try {
      // initialize cameras.
      /// Retrieves a list of cameras that are available on the device.
      _cameras = await availableCameras();
      _controller = CameraController(
        _cameras[0],
        ResolutionPreset.medium,
      );

      await _controller.initialize();
    } on CameraException catch (_) {
      // do something on error.
    }
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  @override
  void initState() {
    _setUpCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// we uses a if statement to check if the camera is ready. If it is not ready, we show a CircularProgressIndicator. If it is ready, we show the CardWithCamera widget.
      body: _isReady == false || !_controller.value.isInitialized
          ? const Center(child: CircularProgressIndicator())
          : CardWithCamera(controller: _controller),
    );
  }
}
