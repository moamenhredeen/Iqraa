import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({List<Widget>? actions})
      : super(
          actions: actions,
          title: const Text("Iqraa"),
        );
}
