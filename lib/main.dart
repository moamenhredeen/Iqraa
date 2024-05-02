import 'dart:io';
import 'package:flutter/material.dart';

import 'package:iqraa/ui/shared/default_app.dart';
import 'package:iqraa/ui/android/android_app.dart';
import 'package:iqraa/ui/windows/windows_app.dart';

void main() {
  if(Platform.isAndroid){
    runApp(const AndroidApp());
  }else if(Platform.isIOS){
    // run ios app
  }else if (Platform.isWindows){
    runApp(WindowsApp());
  }else if (Platform.isLinux){
    // run linux app
  }else if (Platform.isMacOS){
    // run macos app
  }else {
    runApp(const DefaultApp());
  } 
}