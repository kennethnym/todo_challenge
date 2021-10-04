import 'package:flutter/material.dart';

/// Defines a map that maps routes to the corresponding [WidgetBuilder].
typedef RouteMap = Map<String, WidgetBuilder>;

class AppRoute {
  static const landing = '/landing';
  static const dashboard = '/dashboard';
}
