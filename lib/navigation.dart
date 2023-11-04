import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

enum DeviceType {
  desktop,
  mobile,
  web,
}
//TODO: Add a new device type for tablet
DeviceType getDeviceType() {
  if (kIsWeb) {
    return DeviceType.web;
  } else {
    if (Platform.isAndroid || Platform.isIOS) {
      return DeviceType.mobile;
    }
    return DeviceType.desktop;
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final DeviceType deviceType = getDeviceType();
  final List<(String, IconData)> _children = [
    ("Questions", Icons.question_mark_outlined),
    ("Add Question", Icons.add),
  ];

  @override
  Widget build(BuildContext context) {
    print(deviceType.toString());

    return Scaffold(
      bottomNavigationBar: deviceType == DeviceType.mobile
          ? null
          : BottomNavigationBar(items: [
              for (var item in _children)
                BottomNavigationBarItem(icon: Icon(item.$2), label: item.$1)
            ]),
      drawer: deviceType == DeviceType.desktop ? const Drawer() : null,
      body: const Placeholder(),
    );
  }
}
