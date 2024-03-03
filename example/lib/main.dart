import 'package:flutter/material.dart';
import 'package:launcher_switch/launcher_switch.dart';

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laucher Switch"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                launcherSwitch.switchIcon(
                  iconKey: ".Icon2",
                  previousIconKey: ".MainActivity",
                );
              },
              child: const Text("Switch icon"),
            ),
          ],
        ),
      ),
    );
  }
}
