import 'package:flutter/material.dart';

class AppColors {
  static Color get grey => const Color(0xfff2f6fa);
  static const Color _blackPrimaryColor = Color(0xff333333);
  static const Color _greenPrimaryColor = Color(0xff158443);

  static MaterialColor get black => _blackPrimaryColor.toMaterialColor();
  static MaterialAccentColor get green =>
      _greenPrimaryColor.toMaterialAccentColor();
}

extension _Material on Color {
  Map<int, Color> _toSwatch() => {
        50: withOpacity(0.1),
        100: withOpacity(0.2),
        200: withOpacity(0.3),
        300: withOpacity(0.4),
        400: withOpacity(0.5),
        500: withOpacity(0.6),
        600: withOpacity(0.7),
        700: withOpacity(0.8),
        800: withOpacity(0.9),
        900: this,
      };

  MaterialColor toMaterialColor() => MaterialColor(value, _toSwatch());

  MaterialAccentColor toMaterialAccentColor() =>
      MaterialAccentColor(value, _toSwatch());
}
