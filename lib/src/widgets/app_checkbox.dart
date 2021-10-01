import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// The size of [AppCheckbox] (width & height).
const _checkboxSize = 24.0;

/// A custom checkbox with a custom style.
class AppCheckbox extends HookWidget {
  /// Whether the checkbox should be checked.
  final bool checked;

  /// The function that should be called whenever check state of this checkbox
  /// changes.
  final ValueChanged<bool> onChanged;

  const AppCheckbox({
    Key? key,
    required this.checked,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPressed = useState(false);

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
      onTap: () {
        onChanged(!checked);
      },
      child: Container(
        width: _checkboxSize,
        height: _checkboxSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isPressed.value
              ? theme.primaryColor
              : theme.primaryColor.withOpacity(checked ? 1 : 0.2),
        ),
        child: checked
            ? Icon(
                Icons.check,
                color: theme.primaryTextTheme.bodyText1?.color,
                size: 24,
              )
            : Container(),
      ),
    );
  }
}
