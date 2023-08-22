import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension DeviceOrientationUtil on State {
  void setDeviceHorizontal() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    });
  }

  void setDeviceVertical() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    });
  }
}
