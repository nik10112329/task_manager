// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitializeAuthEvent value)?  initialize,TResult Function( _CheckAuthEvent value)?  check,TResult Function( _SignOutAuthEvent value)?  signOut,TResult Function( _SignInAuthEvent value)?  signIn,TResult Function( _SignInGoogleAuthEvent value)?  signInWithGoogle,TResult Function( _SignInGithubOauthAuthEvent value)?  signInWithGitHubOauth,TResult Function( _SignInWithVkAuthEvent value)?  signInWithVk,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitializeAuthEvent() when initialize != null:
return initialize(_that);case _CheckAuthEvent() when check != null:
return check(_that);case _SignOutAuthEvent() when signOut != null:
return signOut(_that);case _SignInAuthEvent() when signIn != null:
return signIn(_that);case _SignInGoogleAuthEvent() when signInWithGoogle != null:
return signInWithGoogle(_that);case _SignInGithubOauthAuthEvent() when signInWithGitHubOauth != null:
return signInWithGitHubOauth(_that);case _SignInWithVkAuthEvent() when signInWithVk != null:
return signInWithVk(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitializeAuthEvent value)  initialize,required TResult Function( _CheckAuthEvent value)  check,required TResult Function( _SignOutAuthEvent value)  signOut,required TResult Function( _SignInAuthEvent value)  signIn,required TResult Function( _SignInGoogleAuthEvent value)  signInWithGoogle,required TResult Function( _SignInGithubOauthAuthEvent value)  signInWithGitHubOauth,required TResult Function( _SignInWithVkAuthEvent value)  signInWithVk,}){
final _that = this;
switch (_that) {
case _InitializeAuthEvent():
return initialize(_that);case _CheckAuthEvent():
return check(_that);case _SignOutAuthEvent():
return signOut(_that);case _SignInAuthEvent():
return signIn(_that);case _SignInGoogleAuthEvent():
return signInWithGoogle(_that);case _SignInGithubOauthAuthEvent():
return signInWithGitHubOauth(_that);case _SignInWithVkAuthEvent():
return signInWithVk(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitializeAuthEvent value)?  initialize,TResult? Function( _CheckAuthEvent value)?  check,TResult? Function( _SignOutAuthEvent value)?  signOut,TResult? Function( _SignInAuthEvent value)?  signIn,TResult? Function( _SignInGoogleAuthEvent value)?  signInWithGoogle,TResult? Function( _SignInGithubOauthAuthEvent value)?  signInWithGitHubOauth,TResult? Function( _SignInWithVkAuthEvent value)?  signInWithVk,}){
final _that = this;
switch (_that) {
case _InitializeAuthEvent() when initialize != null:
return initialize(_that);case _CheckAuthEvent() when check != null:
return check(_that);case _SignOutAuthEvent() when signOut != null:
return signOut(_that);case _SignInAuthEvent() when signIn != null:
return signIn(_that);case _SignInGoogleAuthEvent() when signInWithGoogle != null:
return signInWithGoogle(_that);case _SignInGithubOauthAuthEvent() when signInWithGitHubOauth != null:
return signInWithGitHubOauth(_that);case _SignInWithVkAuthEvent() when signInWithVk != null:
return signInWithVk(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function()?  check,TResult Function()?  signOut,TResult Function()?  signIn,TResult Function()?  signInWithGoogle,TResult Function()?  signInWithGitHubOauth,TResult Function()?  signInWithVk,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitializeAuthEvent() when initialize != null:
return initialize();case _CheckAuthEvent() when check != null:
return check();case _SignOutAuthEvent() when signOut != null:
return signOut();case _SignInAuthEvent() when signIn != null:
return signIn();case _SignInGoogleAuthEvent() when signInWithGoogle != null:
return signInWithGoogle();case _SignInGithubOauthAuthEvent() when signInWithGitHubOauth != null:
return signInWithGitHubOauth();case _SignInWithVkAuthEvent() when signInWithVk != null:
return signInWithVk();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function()  check,required TResult Function()  signOut,required TResult Function()  signIn,required TResult Function()  signInWithGoogle,required TResult Function()  signInWithGitHubOauth,required TResult Function()  signInWithVk,}) {final _that = this;
switch (_that) {
case _InitializeAuthEvent():
return initialize();case _CheckAuthEvent():
return check();case _SignOutAuthEvent():
return signOut();case _SignInAuthEvent():
return signIn();case _SignInGoogleAuthEvent():
return signInWithGoogle();case _SignInGithubOauthAuthEvent():
return signInWithGitHubOauth();case _SignInWithVkAuthEvent():
return signInWithVk();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function()?  check,TResult? Function()?  signOut,TResult? Function()?  signIn,TResult? Function()?  signInWithGoogle,TResult? Function()?  signInWithGitHubOauth,TResult? Function()?  signInWithVk,}) {final _that = this;
switch (_that) {
case _InitializeAuthEvent() when initialize != null:
return initialize();case _CheckAuthEvent() when check != null:
return check();case _SignOutAuthEvent() when signOut != null:
return signOut();case _SignInAuthEvent() when signIn != null:
return signIn();case _SignInGoogleAuthEvent() when signInWithGoogle != null:
return signInWithGoogle();case _SignInGithubOauthAuthEvent() when signInWithGitHubOauth != null:
return signInWithGitHubOauth();case _SignInWithVkAuthEvent() when signInWithVk != null:
return signInWithVk();case _:
  return null;

}
}

}

/// @nodoc


class _InitializeAuthEvent extends AuthEvent with DiagnosticableTreeMixin {
  const _InitializeAuthEvent(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.initialize'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitializeAuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.initialize()';
}


}




/// @nodoc


class _CheckAuthEvent extends AuthEvent with DiagnosticableTreeMixin {
  const _CheckAuthEvent(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.check'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckAuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.check()';
}


}




/// @nodoc


class _SignOutAuthEvent extends AuthEvent with DiagnosticableTreeMixin {
  const _SignOutAuthEvent(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.signOut'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignOutAuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.signOut()';
}


}




/// @nodoc


class _SignInAuthEvent extends AuthEvent with DiagnosticableTreeMixin {
  const _SignInAuthEvent(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.signIn'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInAuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.signIn()';
}


}




/// @nodoc


class _SignInGoogleAuthEvent extends AuthEvent with DiagnosticableTreeMixin {
  const _SignInGoogleAuthEvent(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.signInWithGoogle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInGoogleAuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.signInWithGoogle()';
}


}




/// @nodoc


class _SignInGithubOauthAuthEvent extends AuthEvent with DiagnosticableTreeMixin {
  const _SignInGithubOauthAuthEvent(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.signInWithGitHubOauth'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInGithubOauthAuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.signInWithGitHubOauth()';
}


}




/// @nodoc


class _SignInWithVkAuthEvent extends AuthEvent with DiagnosticableTreeMixin {
  const _SignInWithVkAuthEvent(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.signInWithVk'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInWithVkAuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.signInWithVk()';
}


}




/// @nodoc
mixin _$AuthState implements DiagnosticableTreeMixin {

 TMUser? get user;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState(user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 TMUser? user
});


$TMUserCopyWith<$Res>? get user;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as TMUser?,
  ));
}
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $TMUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthInitialState value)?  initial,TResult Function( _AuthLoadingState value)?  loading,TResult Function( _AuthAuthedState value)?  authed,TResult Function( _AuthNotAuthedState value)?  notAuthed,TResult Function( _AuthErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthInitialState() when initial != null:
return initial(_that);case _AuthLoadingState() when loading != null:
return loading(_that);case _AuthAuthedState() when authed != null:
return authed(_that);case _AuthNotAuthedState() when notAuthed != null:
return notAuthed(_that);case _AuthErrorState() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthInitialState value)  initial,required TResult Function( _AuthLoadingState value)  loading,required TResult Function( _AuthAuthedState value)  authed,required TResult Function( _AuthNotAuthedState value)  notAuthed,required TResult Function( _AuthErrorState value)  error,}){
final _that = this;
switch (_that) {
case _AuthInitialState():
return initial(_that);case _AuthLoadingState():
return loading(_that);case _AuthAuthedState():
return authed(_that);case _AuthNotAuthedState():
return notAuthed(_that);case _AuthErrorState():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthInitialState value)?  initial,TResult? Function( _AuthLoadingState value)?  loading,TResult? Function( _AuthAuthedState value)?  authed,TResult? Function( _AuthNotAuthedState value)?  notAuthed,TResult? Function( _AuthErrorState value)?  error,}){
final _that = this;
switch (_that) {
case _AuthInitialState() when initial != null:
return initial(_that);case _AuthLoadingState() when loading != null:
return loading(_that);case _AuthAuthedState() when authed != null:
return authed(_that);case _AuthNotAuthedState() when notAuthed != null:
return notAuthed(_that);case _AuthErrorState() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TMUser? user)?  initial,TResult Function( TMUser? user)?  loading,TResult Function( TMUser? user)?  authed,TResult Function( TMUser? user)?  notAuthed,TResult Function( TMUser? user,  String? errorMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthInitialState() when initial != null:
return initial(_that.user);case _AuthLoadingState() when loading != null:
return loading(_that.user);case _AuthAuthedState() when authed != null:
return authed(_that.user);case _AuthNotAuthedState() when notAuthed != null:
return notAuthed(_that.user);case _AuthErrorState() when error != null:
return error(_that.user,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TMUser? user)  initial,required TResult Function( TMUser? user)  loading,required TResult Function( TMUser? user)  authed,required TResult Function( TMUser? user)  notAuthed,required TResult Function( TMUser? user,  String? errorMessage)  error,}) {final _that = this;
switch (_that) {
case _AuthInitialState():
return initial(_that.user);case _AuthLoadingState():
return loading(_that.user);case _AuthAuthedState():
return authed(_that.user);case _AuthNotAuthedState():
return notAuthed(_that.user);case _AuthErrorState():
return error(_that.user,_that.errorMessage);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TMUser? user)?  initial,TResult? Function( TMUser? user)?  loading,TResult? Function( TMUser? user)?  authed,TResult? Function( TMUser? user)?  notAuthed,TResult? Function( TMUser? user,  String? errorMessage)?  error,}) {final _that = this;
switch (_that) {
case _AuthInitialState() when initial != null:
return initial(_that.user);case _AuthLoadingState() when loading != null:
return loading(_that.user);case _AuthAuthedState() when authed != null:
return authed(_that.user);case _AuthNotAuthedState() when notAuthed != null:
return notAuthed(_that.user);case _AuthErrorState() when error != null:
return error(_that.user,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AuthInitialState extends AuthState with DiagnosticableTreeMixin {
  const _AuthInitialState({this.user}): super._();
  

@override final  TMUser? user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthInitialStateCopyWith<_AuthInitialState> get copyWith => __$AuthInitialStateCopyWithImpl<_AuthInitialState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.initial'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthInitialState&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.initial(user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthInitialStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthInitialStateCopyWith(_AuthInitialState value, $Res Function(_AuthInitialState) _then) = __$AuthInitialStateCopyWithImpl;
@override @useResult
$Res call({
 TMUser? user
});


@override $TMUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthInitialStateCopyWithImpl<$Res>
    implements _$AuthInitialStateCopyWith<$Res> {
  __$AuthInitialStateCopyWithImpl(this._self, this._then);

  final _AuthInitialState _self;
  final $Res Function(_AuthInitialState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,}) {
  return _then(_AuthInitialState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as TMUser?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $TMUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _AuthLoadingState extends AuthState with DiagnosticableTreeMixin {
  const _AuthLoadingState({this.user}): super._();
  

@override final  TMUser? user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthLoadingStateCopyWith<_AuthLoadingState> get copyWith => __$AuthLoadingStateCopyWithImpl<_AuthLoadingState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.loading'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthLoadingState&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.loading(user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthLoadingStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthLoadingStateCopyWith(_AuthLoadingState value, $Res Function(_AuthLoadingState) _then) = __$AuthLoadingStateCopyWithImpl;
@override @useResult
$Res call({
 TMUser? user
});


@override $TMUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthLoadingStateCopyWithImpl<$Res>
    implements _$AuthLoadingStateCopyWith<$Res> {
  __$AuthLoadingStateCopyWithImpl(this._self, this._then);

  final _AuthLoadingState _self;
  final $Res Function(_AuthLoadingState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,}) {
  return _then(_AuthLoadingState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as TMUser?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $TMUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _AuthAuthedState extends AuthState with DiagnosticableTreeMixin {
  const _AuthAuthedState({this.user}): super._();
  

@override final  TMUser? user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthAuthedStateCopyWith<_AuthAuthedState> get copyWith => __$AuthAuthedStateCopyWithImpl<_AuthAuthedState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.authed'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthAuthedState&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.authed(user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthAuthedStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthAuthedStateCopyWith(_AuthAuthedState value, $Res Function(_AuthAuthedState) _then) = __$AuthAuthedStateCopyWithImpl;
@override @useResult
$Res call({
 TMUser? user
});


@override $TMUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthAuthedStateCopyWithImpl<$Res>
    implements _$AuthAuthedStateCopyWith<$Res> {
  __$AuthAuthedStateCopyWithImpl(this._self, this._then);

  final _AuthAuthedState _self;
  final $Res Function(_AuthAuthedState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,}) {
  return _then(_AuthAuthedState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as TMUser?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $TMUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _AuthNotAuthedState extends AuthState with DiagnosticableTreeMixin {
  const _AuthNotAuthedState({this.user}): super._();
  

@override final  TMUser? user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthNotAuthedStateCopyWith<_AuthNotAuthedState> get copyWith => __$AuthNotAuthedStateCopyWithImpl<_AuthNotAuthedState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.notAuthed'))
    ..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthNotAuthedState&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.notAuthed(user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthNotAuthedStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthNotAuthedStateCopyWith(_AuthNotAuthedState value, $Res Function(_AuthNotAuthedState) _then) = __$AuthNotAuthedStateCopyWithImpl;
@override @useResult
$Res call({
 TMUser? user
});


@override $TMUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthNotAuthedStateCopyWithImpl<$Res>
    implements _$AuthNotAuthedStateCopyWith<$Res> {
  __$AuthNotAuthedStateCopyWithImpl(this._self, this._then);

  final _AuthNotAuthedState _self;
  final $Res Function(_AuthNotAuthedState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,}) {
  return _then(_AuthNotAuthedState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as TMUser?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $TMUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _AuthErrorState extends AuthState with DiagnosticableTreeMixin {
  const _AuthErrorState({this.user, this.errorMessage}): super._();
  

@override final  TMUser? user;
 final  String? errorMessage;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthErrorStateCopyWith<_AuthErrorState> get copyWith => __$AuthErrorStateCopyWithImpl<_AuthErrorState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.error'))
    ..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('errorMessage', errorMessage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthErrorState&&(identical(other.user, user) || other.user == user)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,user,errorMessage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.error(user: $user, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AuthErrorStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthErrorStateCopyWith(_AuthErrorState value, $Res Function(_AuthErrorState) _then) = __$AuthErrorStateCopyWithImpl;
@override @useResult
$Res call({
 TMUser? user, String? errorMessage
});


@override $TMUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthErrorStateCopyWithImpl<$Res>
    implements _$AuthErrorStateCopyWith<$Res> {
  __$AuthErrorStateCopyWithImpl(this._self, this._then);

  final _AuthErrorState _self;
  final $Res Function(_AuthErrorState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? errorMessage = freezed,}) {
  return _then(_AuthErrorState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as TMUser?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $TMUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
