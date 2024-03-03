import 'package:flutter/material.dart';

import 'main.dart';

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
