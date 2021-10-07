// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStatusTearOff {
  const _$AuthStatusTearOff();

  AuthStatusServivceInitializing serviceInitializing() {
    return const AuthStatusServivceInitializing();
  }

  AuthStatusLoggedIn loggedIn(User loggedInUser) {
    return AuthStatusLoggedIn(
      loggedInUser,
    );
  }

  AuthStatusNotLoggedIn notLoggedIn() {
    return const AuthStatusNotLoggedIn();
  }

  AuthStatusLoggingIn loggingIn() {
    return const AuthStatusLoggingIn();
  }

  AuthStatusLoggingOut loggingOut() {
    return const AuthStatusLoggingOut();
  }
}

/// @nodoc
const $AuthStatus = _$AuthStatusTearOff();

/// @nodoc
mixin _$AuthStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serviceInitializing,
    required TResult Function(User loggedInUser) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function() loggingIn,
    required TResult Function() loggingOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serviceInitializing,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function()? loggingIn,
    TResult Function()? loggingOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serviceInitializing,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function()? loggingIn,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStatusServivceInitializing value)
        serviceInitializing,
    required TResult Function(AuthStatusLoggedIn value) loggedIn,
    required TResult Function(AuthStatusNotLoggedIn value) notLoggedIn,
    required TResult Function(AuthStatusLoggingIn value) loggingIn,
    required TResult Function(AuthStatusLoggingOut value) loggingOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStatusServivceInitializing value)? serviceInitializing,
    TResult Function(AuthStatusLoggedIn value)? loggedIn,
    TResult Function(AuthStatusNotLoggedIn value)? notLoggedIn,
    TResult Function(AuthStatusLoggingIn value)? loggingIn,
    TResult Function(AuthStatusLoggingOut value)? loggingOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStatusServivceInitializing value)? serviceInitializing,
    TResult Function(AuthStatusLoggedIn value)? loggedIn,
    TResult Function(AuthStatusNotLoggedIn value)? notLoggedIn,
    TResult Function(AuthStatusLoggingIn value)? loggingIn,
    TResult Function(AuthStatusLoggingOut value)? loggingOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStatusCopyWith<$Res> {
  factory $AuthStatusCopyWith(
          AuthStatus value, $Res Function(AuthStatus) then) =
      _$AuthStatusCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStatusCopyWithImpl<$Res> implements $AuthStatusCopyWith<$Res> {
  _$AuthStatusCopyWithImpl(this._value, this._then);

  final AuthStatus _value;
  // ignore: unused_field
  final $Res Function(AuthStatus) _then;
}

/// @nodoc
abstract class $AuthStatusServivceInitializingCopyWith<$Res> {
  factory $AuthStatusServivceInitializingCopyWith(
          AuthStatusServivceInitializing value,
          $Res Function(AuthStatusServivceInitializing) then) =
      _$AuthStatusServivceInitializingCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStatusServivceInitializingCopyWithImpl<$Res>
    extends _$AuthStatusCopyWithImpl<$Res>
    implements $AuthStatusServivceInitializingCopyWith<$Res> {
  _$AuthStatusServivceInitializingCopyWithImpl(
      AuthStatusServivceInitializing _value,
      $Res Function(AuthStatusServivceInitializing) _then)
      : super(_value, (v) => _then(v as AuthStatusServivceInitializing));

  @override
  AuthStatusServivceInitializing get _value =>
      super._value as AuthStatusServivceInitializing;
}

/// @nodoc

class _$AuthStatusServivceInitializing
    implements AuthStatusServivceInitializing {
  const _$AuthStatusServivceInitializing();

  @override
  String toString() {
    return 'AuthStatus.serviceInitializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthStatusServivceInitializing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serviceInitializing,
    required TResult Function(User loggedInUser) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function() loggingIn,
    required TResult Function() loggingOut,
  }) {
    return serviceInitializing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serviceInitializing,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function()? loggingIn,
    TResult Function()? loggingOut,
  }) {
    return serviceInitializing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serviceInitializing,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function()? loggingIn,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (serviceInitializing != null) {
      return serviceInitializing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStatusServivceInitializing value)
        serviceInitializing,
    required TResult Function(AuthStatusLoggedIn value) loggedIn,
    required TResult Function(AuthStatusNotLoggedIn value) notLoggedIn,
    required TResult Function(AuthStatusLoggingIn value) loggingIn,
    required TResult Function(AuthStatusLoggingOut value) loggingOut,
  }) {
    return serviceInitializing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStatusServivceInitializing value)? serviceInitializing,
    TResult Function(AuthStatusLoggedIn value)? loggedIn,
    TResult Function(AuthStatusNotLoggedIn value)? notLoggedIn,
    TResult Function(AuthStatusLoggingIn value)? loggingIn,
    TResult Function(AuthStatusLoggingOut value)? loggingOut,
  }) {
    return serviceInitializing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStatusServivceInitializing value)? serviceInitializing,
    TResult Function(AuthStatusLoggedIn value)? loggedIn,
    TResult Function(AuthStatusNotLoggedIn value)? notLoggedIn,
    TResult Function(AuthStatusLoggingIn value)? loggingIn,
    TResult Function(AuthStatusLoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (serviceInitializing != null) {
      return serviceInitializing(this);
    }
    return orElse();
  }
}

abstract class AuthStatusServivceInitializing implements AuthStatus {
  const factory AuthStatusServivceInitializing() =
      _$AuthStatusServivceInitializing;
}

/// @nodoc
abstract class $AuthStatusLoggedInCopyWith<$Res> {
  factory $AuthStatusLoggedInCopyWith(
          AuthStatusLoggedIn value, $Res Function(AuthStatusLoggedIn) then) =
      _$AuthStatusLoggedInCopyWithImpl<$Res>;
  $Res call({User loggedInUser});
}

/// @nodoc
class _$AuthStatusLoggedInCopyWithImpl<$Res>
    extends _$AuthStatusCopyWithImpl<$Res>
    implements $AuthStatusLoggedInCopyWith<$Res> {
  _$AuthStatusLoggedInCopyWithImpl(
      AuthStatusLoggedIn _value, $Res Function(AuthStatusLoggedIn) _then)
      : super(_value, (v) => _then(v as AuthStatusLoggedIn));

  @override
  AuthStatusLoggedIn get _value => super._value as AuthStatusLoggedIn;

  @override
  $Res call({
    Object? loggedInUser = freezed,
  }) {
    return _then(AuthStatusLoggedIn(
      loggedInUser == freezed
          ? _value.loggedInUser
          : loggedInUser // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$AuthStatusLoggedIn implements AuthStatusLoggedIn {
  const _$AuthStatusLoggedIn(this.loggedInUser);

  @override
  final User loggedInUser;

  @override
  String toString() {
    return 'AuthStatus.loggedIn(loggedInUser: $loggedInUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthStatusLoggedIn &&
            (identical(other.loggedInUser, loggedInUser) ||
                const DeepCollectionEquality()
                    .equals(other.loggedInUser, loggedInUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(loggedInUser);

  @JsonKey(ignore: true)
  @override
  $AuthStatusLoggedInCopyWith<AuthStatusLoggedIn> get copyWith =>
      _$AuthStatusLoggedInCopyWithImpl<AuthStatusLoggedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serviceInitializing,
    required TResult Function(User loggedInUser) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function() loggingIn,
    required TResult Function() loggingOut,
  }) {
    return loggedIn(loggedInUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serviceInitializing,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function()? loggingIn,
    TResult Function()? loggingOut,
  }) {
    return loggedIn?.call(loggedInUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serviceInitializing,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function()? loggingIn,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(loggedInUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStatusServivceInitializing value)
        serviceInitializing,
    required TResult Function(AuthStatusLoggedIn value) loggedIn,
    required TResult Function(AuthStatusNotLoggedIn value) notLoggedIn,
    required TResult Function(AuthStatusLoggingIn value) loggingIn,
    required TResult Function(AuthStatusLoggingOut value) loggingOut,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStatusServivceInitializing value)? serviceInitializing,
    TResult Function(AuthStatusLoggedIn value)? loggedIn,
    TResult Function(AuthStatusNotLoggedIn value)? notLoggedIn,
    TResult Function(AuthStatusLoggingIn value)? loggingIn,
    TResult Function(AuthStatusLoggingOut value)? loggingOut,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStatusServivceInitializing value)? serviceInitializing,
    TResult Function(AuthStatusLoggedIn value)? loggedIn,
    TResult Function(AuthStatusNotLoggedIn value)? notLoggedIn,
    TResult Function(AuthStatusLoggingIn value)? loggingIn,
    TResult Function(AuthStatusLoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class AuthStatusLoggedIn implements AuthStatus {
  const factory AuthStatusLoggedIn(User loggedInUser) = _$AuthStatusLoggedIn;

  User get loggedInUser => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthStatusLoggedInCopyWith<AuthStatusLoggedIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStatusNotLoggedInCopyWith<$Res> {
  factory $AuthStatusNotLoggedInCopyWith(AuthStatusNotLoggedIn value,
          $Res Function(AuthStatusNotLoggedIn) then) =
      _$AuthStatusNotLoggedInCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStatusNotLoggedInCopyWithImpl<$Res>
    extends _$AuthStatusCopyWithImpl<$Res>
    implements $AuthStatusNotLoggedInCopyWith<$Res> {
  _$AuthStatusNotLoggedInCopyWithImpl(
      AuthStatusNotLoggedIn _value, $Res Function(AuthStatusNotLoggedIn) _then)
      : super(_value, (v) => _then(v as AuthStatusNotLoggedIn));

  @override
  AuthStatusNotLoggedIn get _value => super._value as AuthStatusNotLoggedIn;
}

/// @nodoc

class _$AuthStatusNotLoggedIn implements AuthStatusNotLoggedIn {
  const _$AuthStatusNotLoggedIn();

  @override
  String toString() {
    return 'AuthStatus.notLoggedIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthStatusNotLoggedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serviceInitializing,
    required TResult Function(User loggedInUser) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function() loggingIn,
    required TResult Function() loggingOut,
  }) {
    return notLoggedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serviceInitializing,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function()? loggingIn,
    TResult Function()? loggingOut,
  }) {
    return notLoggedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serviceInitializing,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function()? loggingIn,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (notLoggedIn != null) {
      return notLoggedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStatusServivceInitializing value)
        serviceInitializing,
    required TResult Function(AuthStatusLoggedIn value) loggedIn,
    required TResult Function(AuthStatusNotLoggedIn value) notLoggedIn,
    required TResult Function(AuthStatusLoggingIn value) loggingIn,
    required TResult Function(AuthStatusLoggingOut value) loggingOut,
  }) {
    return notLoggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStatusServivceInitializing value)? serviceInitializing,
    TResult Function(AuthStatusLoggedIn value)? loggedIn,
    TResult Function(AuthStatusNotLoggedIn value)? notLoggedIn,
    TResult Function(AuthStatusLoggingIn value)? loggingIn,
    TResult Function(AuthStatusLoggingOut value)? loggingOut,
  }) {
    return notLoggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStatusServivceInitializing value)? serviceInitializing,
    TResult Function(AuthStatusLoggedIn value)? loggedIn,
    TResult Function(AuthStatusNotLoggedIn value)? notLoggedIn,
    TResult Function(AuthStatusLoggingIn value)? loggingIn,
    TResult Function(AuthStatusLoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (notLoggedIn != null) {
      return notLoggedIn(this);
    }
    return orElse();
  }
}

abstract class AuthStatusNotLoggedIn implements AuthStatus {
  const factory AuthStatusNotLoggedIn() = _$AuthStatusNotLoggedIn;
}

/// @nodoc
abstract class $AuthStatusLoggingInCopyWith<$Res> {
  factory $AuthStatusLoggingInCopyWith(
          AuthStatusLoggingIn value, $Res Function(AuthStatusLoggingIn) then) =
      _$AuthStatusLoggingInCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStatusLoggingInCopyWithImpl<$Res>
    extends _$AuthStatusCopyWithImpl<$Res>
    implements $AuthStatusLoggingInCopyWith<$Res> {
  _$AuthStatusLoggingInCopyWithImpl(
      AuthStatusLoggingIn _value, $Res Function(AuthStatusLoggingIn) _then)
      : super(_value, (v) => _then(v as AuthStatusLoggingIn));

  @override
  AuthStatusLoggingIn get _value => super._value as AuthStatusLoggingIn;
}

/// @nodoc

class _$AuthStatusLoggingIn implements AuthStatusLoggingIn {
  const _$AuthStatusLoggingIn();

  @override
  String toString() {
    return 'AuthStatus.loggingIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthStatusLoggingIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serviceInitializing,
    required TResult Function(User loggedInUser) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function() loggingIn,
    required TResult Function() loggingOut,
  }) {
    return loggingIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serviceInitializing,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function()? loggingIn,
    TResult Function()? loggingOut,
  }) {
    return loggingIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serviceInitializing,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function()? loggingIn,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (loggingIn != null) {
      return loggingIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStatusServivceInitializing value)
        serviceInitializing,
    required TResult Function(AuthStatusLoggedIn value) loggedIn,
    required TResult Function(AuthStatusNotLoggedIn value) notLoggedIn,
    required TResult Function(AuthStatusLoggingIn value) loggingIn,
    required TResult Function(AuthStatusLoggingOut value) loggingOut,
  }) {
    return loggingIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStatusServivceInitializing value)? serviceInitializing,
    TResult Function(AuthStatusLoggedIn value)? loggedIn,
    TResult Function(AuthStatusNotLoggedIn value)? notLoggedIn,
    TResult Function(AuthStatusLoggingIn value)? loggingIn,
    TResult Function(AuthStatusLoggingOut value)? loggingOut,
  }) {
    return loggingIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStatusServivceInitializing value)? serviceInitializing,
    TResult Function(AuthStatusLoggedIn value)? loggedIn,
    TResult Function(AuthStatusNotLoggedIn value)? notLoggedIn,
    TResult Function(AuthStatusLoggingIn value)? loggingIn,
    TResult Function(AuthStatusLoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (loggingIn != null) {
      return loggingIn(this);
    }
    return orElse();
  }
}

abstract class AuthStatusLoggingIn implements AuthStatus {
  const factory AuthStatusLoggingIn() = _$AuthStatusLoggingIn;
}

/// @nodoc
abstract class $AuthStatusLoggingOutCopyWith<$Res> {
  factory $AuthStatusLoggingOutCopyWith(AuthStatusLoggingOut value,
          $Res Function(AuthStatusLoggingOut) then) =
      _$AuthStatusLoggingOutCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStatusLoggingOutCopyWithImpl<$Res>
    extends _$AuthStatusCopyWithImpl<$Res>
    implements $AuthStatusLoggingOutCopyWith<$Res> {
  _$AuthStatusLoggingOutCopyWithImpl(
      AuthStatusLoggingOut _value, $Res Function(AuthStatusLoggingOut) _then)
      : super(_value, (v) => _then(v as AuthStatusLoggingOut));

  @override
  AuthStatusLoggingOut get _value => super._value as AuthStatusLoggingOut;
}

/// @nodoc

class _$AuthStatusLoggingOut implements AuthStatusLoggingOut {
  const _$AuthStatusLoggingOut();

  @override
  String toString() {
    return 'AuthStatus.loggingOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthStatusLoggingOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serviceInitializing,
    required TResult Function(User loggedInUser) loggedIn,
    required TResult Function() notLoggedIn,
    required TResult Function() loggingIn,
    required TResult Function() loggingOut,
  }) {
    return loggingOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serviceInitializing,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function()? loggingIn,
    TResult Function()? loggingOut,
  }) {
    return loggingOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serviceInitializing,
    TResult Function(User loggedInUser)? loggedIn,
    TResult Function()? notLoggedIn,
    TResult Function()? loggingIn,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (loggingOut != null) {
      return loggingOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStatusServivceInitializing value)
        serviceInitializing,
    required TResult Function(AuthStatusLoggedIn value) loggedIn,
    required TResult Function(AuthStatusNotLoggedIn value) notLoggedIn,
    required TResult Function(AuthStatusLoggingIn value) loggingIn,
    required TResult Function(AuthStatusLoggingOut value) loggingOut,
  }) {
    return loggingOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStatusServivceInitializing value)? serviceInitializing,
    TResult Function(AuthStatusLoggedIn value)? loggedIn,
    TResult Function(AuthStatusNotLoggedIn value)? notLoggedIn,
    TResult Function(AuthStatusLoggingIn value)? loggingIn,
    TResult Function(AuthStatusLoggingOut value)? loggingOut,
  }) {
    return loggingOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStatusServivceInitializing value)? serviceInitializing,
    TResult Function(AuthStatusLoggedIn value)? loggedIn,
    TResult Function(AuthStatusNotLoggedIn value)? notLoggedIn,
    TResult Function(AuthStatusLoggingIn value)? loggingIn,
    TResult Function(AuthStatusLoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (loggingOut != null) {
      return loggingOut(this);
    }
    return orElse();
  }
}

abstract class AuthStatusLoggingOut implements AuthStatus {
  const factory AuthStatusLoggingOut() = _$AuthStatusLoggingOut;
}
