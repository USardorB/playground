import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:playground/home_page.dart';
import 'package:playground/settings_inherited_model.dart';

class MiniApp extends StatefulWidget {
  const MiniApp({super.key});

  @override
  State<MiniApp> createState() => _MiniAppState();
}

class _MiniAppState extends State<MiniApp> {
  bool isDark = false;
  String name = 'Sardor';
  String language = 'English';

  @override
  Widget build(BuildContext context) {
    log('MiniApp got (re)build');
    return MaterialApp(
      title: 'Test App',
      debugShowCheckedModeBanner: false,
      home: SettingsInheritedModel(
        language: language,
        isDark: isDark,
        name: name,
        onLanguageChanged: (value) {
          log('Language has been changed');
          setState(() {
            language = value!.name;
          });
        },
        onThemeChanged: (value) => setState(() => isDark = value),
        onNameChanged: (value) => setState(() => name = value),
        child: const HomePage(),
      ),
    );
  }
}
