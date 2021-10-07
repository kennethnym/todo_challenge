import 'package:flutter/material.dart';

/// A custom themed button.
class Button extends StatelessWidget {
  /// The label of the button
  final String label;

  /// The function that is called when the button is tapped.
  final VoidCallback onTap;

  /// Whether the button should take up the full width of parent.
  final bool expanded;

  const Button({
    Key? key,
    required this.label,
    required this.onTap,
    this.expanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: expanded ? double.infinity : null,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: theme.primaryColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 24,
              color: theme.primaryColor.withOpacity(0.32),
            ),
          ],
        ),
        child: Text(
          label,
          style: theme.primaryTextTheme.button,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
