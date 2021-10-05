import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/dashboard/user_avatar.dart';
import 'package:todo_challenge/src/widgets/slide_animation.dart';

import 'user_profile_card_controller.dart';

/// A card that shows the user's profile.
class UserProfileCard extends HookConsumerWidget {
  const UserProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileCardVisibility =
        ref.watch(userProfileCardControllerProvider);
    final theme = Theme.of(context);

    final isUserProfileCardVisible =
        userProfileCardVisibility is UserProfileCardVisible;

    return Stack(
      children: [
        if (isUserProfileCardVisible)
          AbsorbPointer(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        SlideAnimation(
          visible: isUserProfileCardVisible,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 48,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: theme.cardColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: const Offset(0, 24),
                    blurRadius: 24,
                    spreadRadius: -8,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
              child: const _UserProfileCardContent(),
            ),
          ),
        ),
      ],
    );
  }
}

class _UserProfileCardContent extends HookConsumerWidget {
  const _UserProfileCardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileCardVisibility =
        ref.read(userProfileCardControllerProvider);

    return userProfileCardVisibility.when(
      visible: (user) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const UserAvatar(size: 64),
          const SizedBox(height: 16),
          Text(user.displayName ?? 'No name',
              style: Theme.of(context).textTheme.headline2),
          Text(user.email ?? 'No email'),
        ],
      ),
      hidden: () => Container(),
    );
  }
}
