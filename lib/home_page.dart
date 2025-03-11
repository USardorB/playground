import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    int counter = 0;
    return Scaffold(
      backgroundColor: Color.fromRGBO(
        random.nextInt(256), // Red (0-255)
        random.nextInt(256), // Green (0-255)
        random.nextInt(256), // Blue (0-255)
        1, // Opacity (1 = fully opaque)
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(
          random.nextInt(256), // Red (0-255)
          random.nextInt(256), // Green (0-255)
          random.nextInt(256), // Blue (0-255)
          1, // Opacity (1 = fully opaque)
        ),
        title: const Text('Stateless widget but statefull'),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Column(
            children: [
              Spacer(),
              Spacer(),
              Text('You\'ve pressed: $counter times'),
              Spacer(),
              TextButton(
                onPressed: () async {
                  counter++;
                  (context as Element).markNeedsBuild();
                },
                child: const Text('Settings page'),
              ),
              Spacer(),
            ],
          ),
        );
      }),
    );
  }
}
