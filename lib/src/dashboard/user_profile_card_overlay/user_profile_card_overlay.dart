import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/auth/auth_service.dart';
import 'package:todo_challenge/src/user/widgets/user_profile_card.dart';
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
        ref.watch(userProfileCardOverlayControllerProvider);
    final authStatus = ref.watch(authServiceProvider);

    final isUserProfileCardVisible =
        userProfileCardVisibility is UserProfileCardVisible;

    final logUserOut = useCallback(() {
      ref
        ..read(userProfileCardOverlayControllerProvider.notifier).closeProfile()
        ..read(authServiceProvider.notifier).logOut();
    }, [ref]);

    final closeOverlay = useCallback(() {
      ref
          .read(userProfileCardOverlayControllerProvider.notifier)
          .closeProfile();
    }, [ref]);

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
            child: authStatus.maybeWhen(
              loggedIn: (user) => UserProfileCard(
                user: user,
                actions: [
                  UserProfileCardAction(
                    icon: Icons.logout,
                    label: 'Log out',
                    onTap: logUserOut,
                  ),
                  UserProfileCardAction(
                    icon: Icons.close,
                    label: 'Close',
                    onTap: closeOverlay,
                  ),
                ],
              ),
              orElse: () => Container(),
            ),
          ),
        ),
      ],
    );
  }
}
