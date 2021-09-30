import 'package:flutter/material.dart';

/// The padding that applies to the dashboard.
const _screenPadding = EdgeInsets.only(
  left: 16,
  right: 16,
  top: 64,
);

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: _screenPadding,
          child: Text('', style: theme.textTheme.headline1),
        )
      ],
    );
  }
}
