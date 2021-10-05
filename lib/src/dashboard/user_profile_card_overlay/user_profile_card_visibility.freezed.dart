// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile_card_visibility.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserProfileCardVisibilityTearOff {
  const _$UserProfileCardVisibilityTearOff();

  UserProfileCardVisible visible(User user) {
    return UserProfileCardVisible(
      user,
    );
  }

  UserProfielCardHidden hidden() {
    return const UserProfielCardHidden();
  }
}

/// @nodoc
const $UserProfileCardVisibility = _$UserProfileCardVisibilityTearOff();

/// @nodoc
mixin _$UserProfileCardVisibility {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) visible,
    required TResult Function() hidden,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? visible,
    TResult Function()? hidden,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? visible,
    TResult Function()? hidden,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserProfileCardVisible value) visible,
    required TResult Function(UserProfielCardHidden value) hidden,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserProfileCardVisible value)? visible,
    TResult Function(UserProfielCardHidden value)? hidden,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserProfileCardVisible value)? visible,
    TResult Function(UserProfielCardHidden value)? hidden,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCardVisibilityCopyWith<$Res> {
  factory $UserProfileCardVisibilityCopyWith(UserProfileCardVisibility value,
          $Res Function(UserProfileCardVisibility) then) =
      _$UserProfileCardVisibilityCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserProfileCardVisibilityCopyWithImpl<$Res>
    implements $UserProfileCardVisibilityCopyWith<$Res> {
  _$UserProfileCardVisibilityCopyWithImpl(this._value, this._then);

  final UserProfileCardVisibility _value;
  // ignore: unused_field
  final $Res Function(UserProfileCardVisibility) _then;
}

/// @nodoc
abstract class $UserProfileCardVisibleCopyWith<$Res> {
  factory $UserProfileCardVisibleCopyWith(UserProfileCardVisible value,
          $Res Function(UserProfileCardVisible) then) =
      _$UserProfileCardVisibleCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class _$UserProfileCardVisibleCopyWithImpl<$Res>
    extends _$UserProfileCardVisibilityCopyWithImpl<$Res>
    implements $UserProfileCardVisibleCopyWith<$Res> {
  _$UserProfileCardVisibleCopyWithImpl(UserProfileCardVisible _value,
      $Res Function(UserProfileCardVisible) _then)
      : super(_value, (v) => _then(v as UserProfileCardVisible));

  @override
  UserProfileCardVisible get _value => super._value as UserProfileCardVisible;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(UserProfileCardVisible(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$UserProfileCardVisible implements UserProfileCardVisible {
  const _$UserProfileCardVisible(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'UserProfileCardVisibility.visible(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserProfileCardVisible &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  $UserProfileCardVisibleCopyWith<UserProfileCardVisible> get copyWith =>
      _$UserProfileCardVisibleCopyWithImpl<UserProfileCardVisible>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) visible,
    required TResult Function() hidden,
  }) {
    return visible(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? visible,
    TResult Function()? hidden,
  }) {
    return visible?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? visible,
    TResult Function()? hidden,
    required TResult orElse(),
  }) {
    if (visible != null) {
      return visible(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserProfileCardVisible value) visible,
    required TResult Function(UserProfielCardHidden value) hidden,
  }) {
    return visible(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserProfileCardVisible value)? visible,
    TResult Function(UserProfielCardHidden value)? hidden,
  }) {
    return visible?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserProfileCardVisible value)? visible,
    TResult Function(UserProfielCardHidden value)? hidden,
    required TResult orElse(),
  }) {
    if (visible != null) {
      return visible(this);
    }
    return orElse();
  }
}

abstract class UserProfileCardVisible implements UserProfileCardVisibility {
  const factory UserProfileCardVisible(User user) = _$UserProfileCardVisible;

  User get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCardVisibleCopyWith<UserProfileCardVisible> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfielCardHiddenCopyWith<$Res> {
  factory $UserProfielCardHiddenCopyWith(UserProfielCardHidden value,
          $Res Function(UserProfielCardHidden) then) =
      _$UserProfielCardHiddenCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserProfielCardHiddenCopyWithImpl<$Res>
    extends _$UserProfileCardVisibilityCopyWithImpl<$Res>
    implements $UserProfielCardHiddenCopyWith<$Res> {
  _$UserProfielCardHiddenCopyWithImpl(
      UserProfielCardHidden _value, $Res Function(UserProfielCardHidden) _then)
      : super(_value, (v) => _then(v as UserProfielCardHidden));

  @override
  UserProfielCardHidden get _value => super._value as UserProfielCardHidden;
}

/// @nodoc

class _$UserProfielCardHidden implements UserProfielCardHidden {
  const _$UserProfielCardHidden();

  @override
  String toString() {
    return 'UserProfileCardVisibility.hidden()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UserProfielCardHidden);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) visible,
    required TResult Function() hidden,
  }) {
    return hidden();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(User user)? visible,
    TResult Function()? hidden,
  }) {
    return hidden?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? visible,
    TResult Function()? hidden,
    required TResult orElse(),
  }) {
    if (hidden != null) {
      return hidden();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserProfileCardVisible value) visible,
    required TResult Function(UserProfielCardHidden value) hidden,
  }) {
    return hidden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserProfileCardVisible value)? visible,
    TResult Function(UserProfielCardHidden value)? hidden,
  }) {
    return hidden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserProfileCardVisible value)? visible,
    TResult Function(UserProfielCardHidden value)? hidden,
    required TResult orElse(),
  }) {
    if (hidden != null) {
      return hidden(this);
    }
    return orElse();
  }
}

abstract class UserProfielCardHidden implements UserProfileCardVisibility {
  const factory UserProfielCardHidden() = _$UserProfielCardHidden;
}
