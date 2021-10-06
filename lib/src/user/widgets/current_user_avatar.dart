import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/auth/auth_service.dart';

import 'user_avatar.dart';

/// Displays the avatar of the logged in user.
class CurrentUserAvatar extends HookConsumerWidget {
  final double size;
  final VoidCallback? onTap;

  const CurrentUserAvatar({
    Key? key,
    this.size = UserAvatar.defaultSize,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(authServiceProvider);

    return authStatus.maybeWhen(
      serviceInitializing: () => Opacity(
        opacity: 0,
        child: AvatarPlaceholder(size: size),
      ),
      loggedIn: (user) => UserAvatar(
        user: user,
        size: size,
        onTap: onTap,
      ),
      orElse: () => Container(),
    );
  }
}
