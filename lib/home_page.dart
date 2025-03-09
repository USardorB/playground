import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:playground/settings_inherited_model.dart';
import 'package:playground/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log('HomePage got (re)build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current state of the app'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const LanguageWidget(),
            const ThemeWidget(),
            const NameWidget(),
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

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    log('LanguageWidget got (re)build');
    final model = SettingsInheritedModel.of(context, SettingsAspect.language)!;
    return ListTile(
      title: const Text('Language:'),
      trailing: Text(model.language),
    );
  }
}

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    log('ThemeWidget got (re)build');
    final model = SettingsInheritedModel.of(context, SettingsAspect.theme)!;
    return ListTile(
      title: const Text('Theme mode:'),
      trailing: Text(model.isDark ? "dark" : 'light'),
    );
  }
}

class NameWidget extends StatelessWidget {
  const NameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    log('NameWidget got (re)build');
    final model = SettingsInheritedModel.of(context, SettingsAspect.name)!;
    return ListTile(title: const Text('Name:'), trailing: Text(model.name));
  }
}
