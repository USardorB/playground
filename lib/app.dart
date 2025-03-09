import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:playground/home_page.dart';
import 'package:playground/inherited_notifier.dart';

class MiniApp extends StatelessWidget {
  const MiniApp({super.key});

  @override
  Widget build(BuildContext context) {
    log('MiniApp got (re)build');
    return SettingsInheritedModifier(
      notifier: ValueNotifier(
        AppSettings(name: 'Sardor', isDark: false, language: 'English'),
      ),
      child: const MaterialApp(
        title: 'Test App',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
