import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/auth/auth_service.dart';
import 'package:todo_challenge/src/utils/spring_animation.dart';

/// Defines the width and height of [UserAvatar].
const _avatarSize = 24.0;

/// Displays the avatar of the user's account.
class UserAvatar extends HookConsumerWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.read(authServiceProvider);

    return authStatus.maybeWhen(
      loggedIn: (user) => _UserAvatar(user: user),
      orElse: () => Container(),
    );
  }
}

/// This is shown when the user account has an avatar.
class _UserAvatar extends HookWidget {
  /// The url to the avatar image.
  final User user;

  const _UserAvatar({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return GestureDetector(
      onTapUp: scaleDown,
      onTapDown: scaleUp,
      onTapCancel: scaleDown,
      child: ScaleTransition(
        scale: animationController,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_avatarSize / 2),
          child: avatarUrl != null
              ? Image.network(
                  avatarUrl,
                  width: _avatarSize,
                  height: _avatarSize,
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
