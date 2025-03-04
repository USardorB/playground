import 'package:flutter/material.dart';
import 'package:playground/home_page.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
