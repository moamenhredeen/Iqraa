import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:iqraa/ui/default/custom_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _darkMode;

  @override
  void initState() {
    super.initState();
    _darkMode = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Row(
        children: [
          Spacer(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dark Mode",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Switch(
                          value: _darkMode,
                          onChanged: (value) {
                            setState(() {
                              _darkMode = value;
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
