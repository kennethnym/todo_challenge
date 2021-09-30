import 'package:flutter/material.dart';

import 'constants.dart';

/// The text color of dark theme.
const _textColor = Color(0xFFF1F1F1);

/// The [ThemeData] to use in dark mode.
final darkTheme = ThemeData(
  fontFamily: appFontFamily,
  backgroundColor: const Color(0xFFF1F1F1),
  // app's primary color is the same as text color
  primaryColor: _textColor,
  textTheme: appTextTheme.apply(
    displayColor: _textColor,
    bodyColor: _textColor.withOpacity(0.8),
  ),
  primaryTextTheme: appTextTheme.apply(
    displayColor: Colors.white,
    bodyColor: Colors.white.withOpacity(0.8),
  ),
);
