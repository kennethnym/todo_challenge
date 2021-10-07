import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_challenge/src/widgets/screen.dart';

import 'user_avatar.dart';

const _userProfileCardPadding = EdgeInsetsDirectional.all(24);

/// A card that shows the info of the profile of [user].
class UserProfileCard extends StatelessWidget {
  /// The user that [UserProfileCard] should show the profile of.
  final User user;

  /// A list of action buttons that are shown at the bottom of [UserProfileCard].
  final List<UserProfileCardAction> actions;

  const UserProfileCard({
    Key? key,
    required this.user,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Screen.padding.left,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).cardColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(0, 24),
            blurRadius: 24,
            spreadRadius: -8,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      child: _UserProfileCardContent(
        user: user,
        actions: actions,
      ),
    );
  }
}

/// Draws an action button on the [UserProfileCard]
class UserProfileCardAction extends HookWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const UserProfileCardAction({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isTapped = useState(false);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        isTapped.value = true;
      },
      onTapUp: (_) {
        isTapped.value = false;
      },
      onTapCancel: () {
        isTapped.value = false;
      },
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _userProfileCardPadding.start,
          vertical: 8,
        ),
        color: isTapped.value
            ? theme.textTheme.bodyText1?.color?.withOpacity(0.1)
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              icon,
              color: theme.textTheme.bodyText1?.color,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: theme.textTheme.button,
            ),
          ],
        ),
      ),
    );
  }
}

class _UserProfileCardContent extends StatelessWidget {
  final User user;

  /// A list of action buttons that are shown at the bottom of [UserProfileCard].
  final List<UserProfileCardAction> actions;

  const _UserProfileCardContent({
    Key? key,
    required this.user,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              UserAvatar(user: user, size: 64),
              const SizedBox(height: 16),
              Text(
                user.displayName ?? 'No name',
                style: theme.textTheme.headline2,
              ),
              Text(
                user.email ?? 'No email',
                style: theme.textTheme.bodyText1,
              ),
            ],
          ),
        ),
        if (actions.isNotEmpty) ...[
          const Divider(),
          ...actions,
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}
