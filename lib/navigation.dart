import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:learn_flutter_1_udemy_tasks/presentation/quizScreen/quiz_screen.dart';

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
  final List<(String, IconData)> _navigationChildren = [
    ("Questions", Icons.question_mark_outlined),
    ("Add Question", Icons.add),
  ];
  final List<Widget> _bodyChildren = [
    const QuizScreen(),
    const Placeholder(),
  ];

  int _currentIndex = 0;
  void _onItemTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation"),
      ),
      bottomNavigationBar: deviceType == DeviceType.mobile
          ? BottomNavigationBar(items: [
              for (var item in _navigationChildren)
                BottomNavigationBarItem(icon: Icon(item.$2), label: item.$1,)
            ],
            onTap: (index){
              _onItemTapped(index);
            },)
          : null,
      drawer: deviceType == DeviceType.desktop
          ? Drawer(
              child: ListView(
                children: [
                  for (var item in _navigationChildren)
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        _onItemTapped(_navigationChildren.indexOf(item));
                      },
                      leading: Icon(item.$2),
                      title: Text(item.$1),
                    )
                ],
              ),
            )
          : null,
      body: Center(
          child: _bodyChildren[_currentIndex],
      ),
    );
  }
}
