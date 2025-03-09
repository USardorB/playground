import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playground/inherited_notifier.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    log('SettingsPage got (re)build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: const Text('Language:'),
              trailing: DropdownMenu<Language>(
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: Language.en, label: 'English'),
                  DropdownMenuEntry(value: Language.ru, label: 'Russian'),
                  DropdownMenuEntry(value: Language.uz, label: 'Uzbek'),
                ],
                onSelected: (value) {
                  final current = SettingsInheritedModifier.of(context).value;
                  SettingsInheritedModifier.of(context).value = AppSettings(
                    name: current.name,
                    isDark: current.isDark,
                    language: value?.name ?? 'nothing' 'selected',
                  );
                },
              ),
            ),
            ListTile(
              title: const Text('Is Dark:'),
              trailing: CupertinoSwitch(
                value: SettingsInheritedModifier.of(context).value.isDark,
                onChanged: (value) {
                  final current = SettingsInheritedModifier.of(context).value;
                  SettingsInheritedModifier.of(context).value = AppSettings(
                    name: current.name,
                    isDark: !current.isDark,
                    language: current.language,
                  );
                },
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                label: Text('Name:'),
              ),
              onSubmitted: (value) {
                final current = SettingsInheritedModifier.of(context).value;
                SettingsInheritedModifier.of(context).value = AppSettings(
                  name: value,
                  isDark: current.isDark,
                  language: current.language,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum Language { en, uz, ru }
