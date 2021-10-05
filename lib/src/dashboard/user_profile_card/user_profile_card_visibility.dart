import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_card_visibility.freezed.dart';

@freezed
class UserProfileCardVisibility with _$UserProfileCardVisibility {
  const factory UserProfileCardVisibility.visible(User user) =
      UserProfileCardVisible;

  const factory UserProfileCardVisibility.hidden() = UserProfielCardHidden;
}
