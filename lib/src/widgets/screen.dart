import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  /// The default padding that applies to all screens of the app.
  static const padding = EdgeInsets.only(
    left: 16,
    right: 16,
    top: 64,
  );

  final Widget child;

  const Screen({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: child,
    );
  }
}
