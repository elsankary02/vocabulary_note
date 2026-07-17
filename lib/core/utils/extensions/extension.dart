import 'package:flutter/material.dart';

extension Extensions on BuildContext {
  double get h => MediaQuery.sizeOf(this).height;
  double get w => MediaQuery.sizeOf(this).width;
  ThemeData get theme => Theme.of(this);
  Color get surface => Theme.of(this).colorScheme.surface;
  Color get onSurface => Theme.of(this).colorScheme.onSurface;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
