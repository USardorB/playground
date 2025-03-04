import 'package:flutter/material.dart';
import 'package:playground/counter_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App'), centerTitle: true),
      body: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: CounterService(),
          builder: (context, value, child) {
            return Text(
              value.toString(),
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            );
          },
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
