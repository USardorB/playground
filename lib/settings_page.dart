import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playground/settings_inherited_model.dart';

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
                  SettingsInheritedModel.of(
                    context,
                    SettingsAspect.language,
                  )?.onLanguageChanged(value);
                },
              ),
            ),
            ListTile(
              title: const Text('Is Dark:'),
              trailing: CupertinoSwitch(
                value: true,
                onChanged: SettingsInheritedModel.of(
                  context,
                  SettingsAspect.language,
                )?.onThemeChanged,
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                label: Text('Name:'),
              ),
              onSubmitted: SettingsInheritedModel.of(
                context,
                SettingsAspect.language,
              )?.onNameChanged,
            ),
          ],
        ),
      ),
    );
  }
}

enum Language { en, uz, ru }
