import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:playground/settings_page.dart';

class SettingsInheritedModel extends InheritedModel<SettingsAspect> {
  final String language;
  final bool isDark;
  final String name;
  final ValueChanged<Language?> onLanguageChanged;
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onNameChanged;

  const SettingsInheritedModel({
    required this.language,
    required this.isDark,
    required this.name,
    required this.onLanguageChanged,
    required this.onThemeChanged,
    required this.onNameChanged,
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(covariant SettingsInheritedModel oldWidget) {
    log('updateShouldNotify');

    return (language, isDark, name) !=
        (oldWidget.language, oldWidget.isDark, oldWidget.name);
  }

  @override
  bool updateShouldNotifyDependent(
    covariant SettingsInheritedModel oldWidget,
    Set<SettingsAspect> dependencies,
  ) {
    log('updateShouldNotifyDependent');
    if (oldWidget.isDark != isDark ||
        dependencies.contains(SettingsAspect.theme)) {
      return true;
    }
    if (oldWidget.language != language ||
        dependencies.contains(SettingsAspect.language)) {
      return true;
    }
    if (oldWidget.name != name || dependencies.contains(SettingsAspect.name)) {
      return true;
    }
    return false;
  }

  static SettingsInheritedModel? of(
    BuildContext context,
    SettingsAspect aspect,
  ) {
    return InheritedModel.inheritFrom<SettingsInheritedModel>(
      context,
      aspect: aspect,
    );
  }
}

enum SettingsAspect { language, theme, name }
