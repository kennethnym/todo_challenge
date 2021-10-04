import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/auth/auth_service.dart';
import 'package:todo_challenge/src/widgets/button.dart';

class GoogleSignInButton extends HookConsumerWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(authServiceProvider);

    final continueWithGoogle = useCallback(() {
      ref.read(authServiceProvider.notifier).continueWithGoogle();
    }, [ref]);

    return authStatus.maybeWhen(
      notLoggedIn: () => Button(
        expanded: true,
        label: 'Continue with Google ->',
        onTap: continueWithGoogle,
      ),
      loggingIn: () => const SizedBox(
        width: 32,
        height: 32,
        child: CircularProgressIndicator(),
      ),
      orElse: () => Container(),
    );
  }
}
