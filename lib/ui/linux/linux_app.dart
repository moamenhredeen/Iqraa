import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iqraa/ui/linux/router.dart';
import 'package:yaru/theme.dart';
import 'package:yaru/yaru.dart';

class LinuxApp extends StatelessWidget {
  const LinuxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return YaruTheme(
      data: const YaruThemeData(
        variant: YaruVariant.ubuntuButterflyPink,
        themeMode: ThemeMode.light,
        useMaterial3: true,
        visualDensity: VisualDensity.compact,
      ),
      builder: (context, yaru, child) {
        return MaterialApp.router(
          title: "Iqraa Linux Client",
          debugShowCheckedModeBanner: false,
          theme: yaru.theme,
          darkTheme: yaru.darkTheme,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown,
              PointerDeviceKind.trackpad,
            },
          ),
          routerConfig: router,
        );
      },
    );
  }
}
