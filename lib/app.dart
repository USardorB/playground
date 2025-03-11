import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:playground/home_page.dart';

class MiniApp extends StatelessWidget {
  const MiniApp({super.key});

  @override
  Widget build(BuildContext context) {
    log('MiniApp got (re)build');
    return const MaterialApp(
      title: 'Test App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
