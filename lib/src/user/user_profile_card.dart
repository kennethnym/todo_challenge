import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'user_avatar.dart';

/// A card that shows the info of the profile of [user].
class UserProfileCard extends StatelessWidget {
  final User user;

  const UserProfileCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 48,
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
      ),
    );
  }
}

class _UserProfileCardContent extends StatelessWidget {
  final User user;

  const _UserProfileCardContent({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
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
    );
  }
}
