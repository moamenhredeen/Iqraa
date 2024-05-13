import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:yaru/yaru.dart';
import 'package:injectable/injectable.dart';

import 'package:iqraa/ui/default/app.dart';
import 'package:iqraa/ui/linux/linux.dart';
import 'package:iqraa/ui/windows/windows_app.dart';
import 'package:iqraa/main.config.dart';

@injectableInit
configureDependencies() => GetIt.instance.init(environment: Environment.dev);

Future<void> main() async {
  configureDependencies();

  Widget app;
  if (Platform.isWindows) {
    app = WindowsApp();
  } else if (Platform.isLinux) {
    await YaruWindowTitleBar.ensureInitialized();
    app = const LinuxApp();
  } else {
    app = const App();
  }

  runApp(app);
}
