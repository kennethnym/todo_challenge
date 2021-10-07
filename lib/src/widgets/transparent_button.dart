import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A transparent button with an icon attached.
class TransparentButton extends HookWidget {
  /// The padding of [TransparentButton] applied to its content.
  ///
  /// Use this to account for extra padding around its parent.
  /// For example, if [TransparentButton] is placed in a parent with
  /// padding of 16, then the text will have padding of 16 + [padding] (24 currently)
  /// due to the additional padding of this widget.
  /// To align the text so that it has a padding of 16, the parent should have padding
  /// of 16 - [padding].
  static const padding = EdgeInsets.all(8);

  /// The icon that should be shown to the left of [label].
  final IconData icon;

  /// The label of the button.
  final String label;

  /// The function that is called when [TransparentButton] is tapped.
  final VoidCallback onTap;

  /// The [TextStyle] that overrides the default [TextStyle] applied.
  final TextStyle? textStyle;

  /// Creates a transparent button.
  ///
  /// Use [textStyle] to override the default [TextStyle].
  const TransparentButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPressed = useState(false);

    final textStyle = this.textStyle ?? Theme.of(context).textTheme.button;

    return GestureDetector(
      onTapDown: (_) {
        isPressed.value = true;
      },
      onTapUp: (_) {
        isPressed.value = false;
      },
      onTapCancel: () {
        isPressed.value = false;
      },
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isPressed.value
              ? textStyle?.color?.withOpacity(0.1)
              : Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: textStyle?.color,
              size: 24,
            ),
            const SizedBox(width: 4),
            Text(label, style: textStyle),
          ],
        ),
      ),
    );
  }
}
