import 'package:flutter/material.dart';

class ThemeInheritedWidget extends InheritedWidget {
  final bool isDark;
  final VoidCallback callback;

  const ThemeInheritedWidget(
    this.isDark, {
    required this.callback,
    super.key,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant ThemeInheritedWidget oldWidget) {
    // ignore: avoid_print
    return isDark != oldWidget.isDark;
  }

  static ThemeInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>();
  }
}
