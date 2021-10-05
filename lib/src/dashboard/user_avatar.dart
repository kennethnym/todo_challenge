import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/auth/auth_service.dart';
import 'package:todo_challenge/src/dashboard/user_profile_card/user_profile_card_controller.dart';
import 'package:todo_challenge/src/utils/spring_animation.dart';

/// Defines the width and height of [UserAvatar].
const _avatarSize = 24.0;

/// Displays the avatar of the user's account.
class UserAvatar extends HookConsumerWidget {
  final double size;

  const UserAvatar({
    Key? key,
    this.size = _avatarSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(authServiceProvider);

    return authStatus.maybeWhen(
      serviceInitializing: () =>
          const Opacity(opacity: 0, child: _AvatarPlaceholder()),
      loggedIn: (user) => _UserAvatar(
        user: user,
        size: size,
      ),
      orElse: () => Container(),
    );
  }
}

/// This is shown when the user account has an avatar.
class _UserAvatar extends HookConsumerWidget {
  /// The url to the avatar image.
  final User user;

  final double size;

  const _UserAvatar({
    Key? key,
    required this.user,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarUrl = user.photoURL;
    final animationController = useAnimationController(
      initialValue: 1.0,
      upperBound: 2.5,
    );

    final scaleUp = useCallback(([_]) {
      animationController.spring(to: 1.5, stiffness: 400, damping: 25);
    }, [animationController]);

    final scaleDown = useCallback(([_]) {
      animationController.spring(to: 1.0, stiffness: 400, damping: 25);
    }, [animationController]);

    final showUserProfile = useCallback(() {
      ref
          .read(userProfileCardControllerProvider.notifier)
          .showProfile(ofUser: user);
    }, [ref]);

    return GestureDetector(
      onTapUp: scaleDown,
      onTapDown: scaleUp,
      onTapCancel: scaleDown,
      onTap: showUserProfile,
      child: ScaleTransition(
        scale: animationController,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size / 2),
          child: avatarUrl != null
              ? Image.network(
                  avatarUrl,
                  width: size,
                  height: size,
                )
              : const _AvatarPlaceholder(),
        ),
      ),
    );
  }
}

/// This is shown when the user account doesn't have an avatar.
class _AvatarPlaceholder extends StatelessWidget {
  const _AvatarPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _avatarSize,
      height: _avatarSize,
      color: Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.5),
    );
  }
}
