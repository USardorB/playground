import 'dart:math';

import 'package:flutter/material.dart';
import 'package:playground/counter_service.dart';
import 'package:playground/theme_inherited_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  /// Not gonna be rebuild thanks for [NewWidget]'s [dependOnInheritedWidgetOfExactType]
  @override
  Widget build(BuildContext context) {
    print('HomeBeingRebuild');
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            ValueListenableBuilder<int>(
              valueListenable: CounterService(),
              builder: (context, value, child) {
                return Text(
                  value.toString(),
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w700),
                );
              },
            ),
            const NewWidget()
          ],
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, spacing: 20, children: [
        FloatingActionButton(
          onPressed: CounterService().inc,
          heroTag: 'HERO1',
          child: const Icon(Icons.add_rounded),
        ),
        FloatingActionButton(
          onPressed: CounterService().reset,
          heroTag: 'HERO2',
          child: const Icon(Icons.exposure_zero),
        ),
        FloatingActionButton(
          onPressed: CounterService().dec,
          heroTag: 'HERO3',
          child: const Icon(Icons.horizontal_rule_rounded),
        ),
      ]),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print('NERwDWID');
    final random = Random();
    final inherited = ThemeInheritedWidget.of(context);
    return InkWell(
      onTap: inherited?.callback,
      child: Card(
        color: Color.fromARGB(
          255, // Full opacity
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
        ),
        child: SizedBox(
          height: 50,
          width: 60,
          child: Text((inherited?.isDark ?? false) ? 'Dark' : 'Light'),
        ),
      ),
    );
  }
}
