import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/utils/spring_animation.dart';

/// Displays the avatar of a user.
class UserAvatar extends HookConsumerWidget {
  /// The default size of [UserAvatar].
  static const defaultSize = 24.0;

  /// The url to the avatar image.
  final User user;

  /// The size of the avatar image.
  /// The default size is defined by [defaultSize].
  final double size;

  /// An optional callback that is called when [UserAvatar] is tapped.
  final VoidCallback? onTap;

  /// Creates a widget that shows the avatar of [user].
  const UserAvatar({
    Key? key,
    required this.user,
    this.size = defaultSize,
    this.onTap,
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

    return GestureDetector(
      onTapUp: scaleDown,
      onTapDown: scaleUp,
      onTapCancel: scaleDown,
      onTap: onTap,
      child: ScaleTransition(
        scale: animationController,
        child: avatarUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(size / 2),
                child: Image.network(
                  avatarUrl,
                  width: size,
                  height: size,
                  errorBuilder: (_, __, ___) => const AvatarPlaceholder(),
                ),
              )
            : const AvatarPlaceholder(),
      ),
    );
  }
}

/// A widget that shows an empty circle.
/// Can be used when the user doesn't have an avatar.
class AvatarPlaceholder extends StatelessWidget {
  /// The size of the placeholder.
  /// The default size is defined by [UserAvatar.defaultSize].
  final double size;

  const AvatarPlaceholder({
    Key? key,
    this.size = UserAvatar.defaultSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.5),
      ),
    );
  }
}
