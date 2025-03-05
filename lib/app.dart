import 'package:flutter/material.dart';
import 'package:playground/home_page.dart';
import 'package:playground/theme_inherited_widget.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      debugShowCheckedModeBanner: false,
      home: ThemeInheritedWidget(
        isDark,
        callback: () => setState(() {
          isDark = !isDark;
        }),
        child: const HomePage(),
      ),
    );
  }
}
