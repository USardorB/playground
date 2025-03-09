import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:playground/inherited_notifier.dart';
import 'package:playground/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = SettingsInheritedModifier.of(context).value;
    log('HomePage got (re)build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current state of the app'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: const Text('Language:'),
              trailing: Text(model.language),
            ),
            ListTile(
              title: const Text('Theme mode:'),
              trailing: Text(model.isDark ? "dark" : 'light'),
            ),
            ListTile(title: const Text('Name:'), trailing: Text(model.name)),
            TextButton(
              onPressed: () async => await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              ),
              child: const Text('Settings page'),
            )
          ],
        ),
      ),
    );
  }
}
