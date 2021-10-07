import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_status.freezed.dart';

@freezed
class AuthStatus with _$AuthStatus {
  const factory AuthStatus.serviceInitializing() =
      AuthStatusServivceInitializing;

  const factory AuthStatus.loggedIn(User loggedInUser) = AuthStatusLoggedIn;

  const factory AuthStatus.notLoggedIn() = AuthStatusNotLoggedIn;

  const factory AuthStatus.loggingIn() = AuthStatusLoggingIn;

  const factory AuthStatus.loggingOut() = AuthStatusLoggingOut;
}
