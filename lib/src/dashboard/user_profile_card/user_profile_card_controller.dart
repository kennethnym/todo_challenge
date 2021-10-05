import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'user_profile_card_visibility.dart';

export 'user_profile_card_visibility.dart';

final userProfileCardControllerProvider =
    StateNotifierProvider<UserProfileCardController, UserProfileCardVisibility>(
        (_) => UserProfileCardController());

class UserProfileCardController
    extends StateNotifier<UserProfileCardVisibility> {
  UserProfileCardController() : super(const UserProfileCardVisibility.hidden());

  void showProfile({required User ofUser}) {
    state = UserProfileCardVisibility.visible(ofUser);
  }

  void closeProfile() {
    state = const UserProfileCardVisibility.hidden();
  }
}
