import 'package:flutter/material.dart';

class CounterService extends ValueNotifier<int> {
  CounterService._internal(super.value);

  static final _instance = CounterService._internal(0);
  factory CounterService() => _instance;

  int inc() => value++;
  int dec() => value == 0 ? 0 : value--;
  int reset() => value = 0;
}
