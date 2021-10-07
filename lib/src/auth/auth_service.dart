import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth_status.dart';

export 'auth_status.dart';

/// A [StateNotifierProvider] that provides the current instance of [AuthService].
final authServiceProvider =
    StateNotifierProvider<AuthService, AuthStatus>((_) => AuthService());

/// Handles authentication of the app.
class AuthService extends StateNotifier<AuthStatus> {
  late final StreamSubscription _authStateSubscription;

  AuthService() : super(const AuthStatus.serviceInitializing()) {
    _subscribeToAuthStateChanges();
  }

  void continueWithGoogle() async {
    state = const AuthStatus.loggingIn();

    final googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final authInfo = await googleUser.authentication;

      final cred = GoogleAuthProvider.credential(
        accessToken: authInfo.accessToken,
        idToken: authInfo.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(cred);
    }
  }

  /// Logs the currently logged in user out.
  void logOut() async {
    state = const AuthStatus.loggingOut();
    await FirebaseAuth.instance.signOut();
    state = const AuthStatus.notLoggedIn();
  }

  @override
  void dispose() {
    _authStateSubscription.cancel();
    super.dispose();
  }

  void _subscribeToAuthStateChanges() {
    _authStateSubscription =
        FirebaseAuth.instance.authStateChanges().listen(_authStateListener);
  }

  void _authStateListener(User? loggedInUser) {
    if (loggedInUser == null) {
      state = const AuthStatus.notLoggedIn();
    } else {
      state = AuthStatus.loggedIn(loggedInUser);
    }
  }
}
