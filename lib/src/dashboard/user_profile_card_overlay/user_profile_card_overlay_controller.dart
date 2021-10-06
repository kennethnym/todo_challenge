import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'user_profile_card_visibility.dart';
import 'user_profile_card_overlay.dart';

export 'user_profile_card_visibility.dart';

///
final userProfileCardControllerOverlayProvider = StateNotifierProvider<
    UserProfileCardOverlayController,
    UserProfileCardVisibility>((_) => UserProfileCardOverlayController());

/// Controls the appearance of [UserProfileCardOverlay].
class UserProfileCardOverlayController
    extends StateNotifier<UserProfileCardVisibility> {
  UserProfileCardOverlayController()
      : super(const UserProfileCardVisibility.hidden());

  /// Shows the profile [ofUser] in [UserProfileCardOverlay].
  void showProfile({required User ofUser}) {
    state = UserProfileCardVisibility.visible(ofUser);
  }

  /// Closes [UserProfileCardOverlay]
  void closeProfile() {
    state = const UserProfileCardVisibility.hidden();
  }
}
