import 'dart:developer';

import 'package:flutter/material.dart';

class AppSettings {
  String name;
  bool isDark;
  String language;

  AppSettings({
    required this.name,
    required this.isDark,
    required this.language,
  });

  @override
  bool operator ==(covariant AppSettings other) {
    log('${name == other.name && isDark == other.isDark && language == other.language}');
    return name == other.name &&
        isDark == other.isDark &&
        language == other.language;
  }

  @override
  int get hashCode {
    log('${name.hashCode ^ isDark.hashCode ^ language.hashCode}');
    return name.hashCode ^ isDark.hashCode ^ language.hashCode;
  }
}

class SettingsInheritedModifier
    extends InheritedNotifier<ValueNotifier<AppSettings>> {
  const SettingsInheritedModifier({
    super.key,
    required super.notifier,
    required super.child,
  });

  static ValueNotifier<AppSettings> of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<SettingsInheritedModifier>()!
      .notifier!;
}
