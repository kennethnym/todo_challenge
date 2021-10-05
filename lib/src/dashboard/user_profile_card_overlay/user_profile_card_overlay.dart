import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/user/user_avatar.dart';
import 'package:todo_challenge/src/user/user_profile_card.dart';
import 'package:todo_challenge/src/widgets/slide_animation.dart';

import 'user_profile_card_overlay_controller.dart';

export 'user_profile_card_overlay_controller.dart';

/// A widget that overlays on top of [DashboardScreen] to
/// show [UserProfileCard].
class UserProfileCardOverlay extends HookConsumerWidget {
  const UserProfileCardOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileCardVisibility =
        ref.watch(userProfileCardControllerOverlayProvider);

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
            child: userProfileCardVisibility.when(
              visible: (user) => UserProfileCard(user: user),
              hidden: () => Container(),
            ),
          ),
        ),
      ],
    );
  }
}
