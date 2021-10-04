import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_challenge/src/auth/auth_service.dart';
import 'package:todo_challenge/src/auth/auth_status.dart';
import 'package:todo_challenge/src/routes.dart';
import 'package:todo_challenge/src/widgets/screen.dart';

import 'google_sign_in_button.dart';

/// This screen is shown when user is not logged in.
class LandingScreen extends HookConsumerWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final authStatusListener = useCallback((AuthStatus authStatus) {
      if (authStatus is AuthStatusLoggedIn) {
        Navigator.of(context).popAndPushNamed(AppRoute.dashboard);
      }
    }, [context]);

    ref.listen(authServiceProvider, authStatusListener);

    return Screen(
      child: SafeArea(
        child: Padding(
          padding: Screen.padding.copyWith(bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Simple, no-fuss\nto-do app.',
                      style: theme.textTheme.headline1,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Less is more.',
                      style: theme.textTheme.headline2,
                    ),
                  ],
                ),
              ),
              const Flexible(
                flex: 1,
                child: GoogleSignInButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
