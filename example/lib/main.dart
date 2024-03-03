import 'package:flutter/material.dart';
import 'package:launcher_switch/launcher_switch.dart';

import 'home_screen.dart';

final launcherSwitch = LauncherSwitch();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
