// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TMUser {

 String get id; String get email; SignInMethod get signInMethod; String? get idLinkedProvider; List<SignInMethod> get linkedProviders; List<String>? get rustoreTokens; String? get displayName; String? get photoUrl; String? get phoneNumber; bool get emailVerified; DateTime? get createdAt; DateTime? get lastLoginAt;
/// Create a copy of TMUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TMUserCopyWith<TMUser> get copyWith => _$TMUserCopyWithImpl<TMUser>(this as TMUser, _$identity);

  /// Serializes this TMUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TMUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.signInMethod, signInMethod) || other.signInMethod == signInMethod)&&(identical(other.idLinkedProvider, idLinkedProvider) || other.idLinkedProvider == idLinkedProvider)&&const DeepCollectionEquality().equals(other.linkedProviders, linkedProviders)&&const DeepCollectionEquality().equals(other.rustoreTokens, rustoreTokens)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,signInMethod,idLinkedProvider,const DeepCollectionEquality().hash(linkedProviders),const DeepCollectionEquality().hash(rustoreTokens),displayName,photoUrl,phoneNumber,emailVerified,createdAt,lastLoginAt);

@override
String toString() {
  return 'TMUser(id: $id, email: $email, signInMethod: $signInMethod, idLinkedProvider: $idLinkedProvider, linkedProviders: $linkedProviders, rustoreTokens: $rustoreTokens, displayName: $displayName, photoUrl: $photoUrl, phoneNumber: $phoneNumber, emailVerified: $emailVerified, createdAt: $createdAt, lastLoginAt: $lastLoginAt)';
}


}

/// @nodoc
abstract mixin class $TMUserCopyWith<$Res>  {
  factory $TMUserCopyWith(TMUser value, $Res Function(TMUser) _then) = _$TMUserCopyWithImpl;
@useResult
$Res call({
 String id, String email, SignInMethod signInMethod, String? idLinkedProvider, List<SignInMethod> linkedProviders, List<String>? rustoreTokens, String? displayName, String? photoUrl, String? phoneNumber, bool emailVerified, DateTime? createdAt, DateTime? lastLoginAt
});




}
/// @nodoc
class _$TMUserCopyWithImpl<$Res>
    implements $TMUserCopyWith<$Res> {
  _$TMUserCopyWithImpl(this._self, this._then);

  final TMUser _self;
  final $Res Function(TMUser) _then;

/// Create a copy of TMUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? signInMethod = null,Object? idLinkedProvider = freezed,Object? linkedProviders = null,Object? rustoreTokens = freezed,Object? displayName = freezed,Object? photoUrl = freezed,Object? phoneNumber = freezed,Object? emailVerified = null,Object? createdAt = freezed,Object? lastLoginAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,signInMethod: null == signInMethod ? _self.signInMethod : signInMethod // ignore: cast_nullable_to_non_nullable
as SignInMethod,idLinkedProvider: freezed == idLinkedProvider ? _self.idLinkedProvider : idLinkedProvider // ignore: cast_nullable_to_non_nullable
as String?,linkedProviders: null == linkedProviders ? _self.linkedProviders : linkedProviders // ignore: cast_nullable_to_non_nullable
as List<SignInMethod>,rustoreTokens: freezed == rustoreTokens ? _self.rustoreTokens : rustoreTokens // ignore: cast_nullable_to_non_nullable
as List<String>?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TMUser].
extension TMUserPatterns on TMUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TMUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TMUser() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TMUser value)  $default,){
final _that = this;
switch (_that) {
case _TMUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TMUser value)?  $default,){
final _that = this;
switch (_that) {
case _TMUser() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  SignInMethod signInMethod,  String? idLinkedProvider,  List<SignInMethod> linkedProviders,  List<String>? rustoreTokens,  String? displayName,  String? photoUrl,  String? phoneNumber,  bool emailVerified,  DateTime? createdAt,  DateTime? lastLoginAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TMUser() when $default != null:
return $default(_that.id,_that.email,_that.signInMethod,_that.idLinkedProvider,_that.linkedProviders,_that.rustoreTokens,_that.displayName,_that.photoUrl,_that.phoneNumber,_that.emailVerified,_that.createdAt,_that.lastLoginAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  SignInMethod signInMethod,  String? idLinkedProvider,  List<SignInMethod> linkedProviders,  List<String>? rustoreTokens,  String? displayName,  String? photoUrl,  String? phoneNumber,  bool emailVerified,  DateTime? createdAt,  DateTime? lastLoginAt)  $default,) {final _that = this;
switch (_that) {
case _TMUser():
return $default(_that.id,_that.email,_that.signInMethod,_that.idLinkedProvider,_that.linkedProviders,_that.rustoreTokens,_that.displayName,_that.photoUrl,_that.phoneNumber,_that.emailVerified,_that.createdAt,_that.lastLoginAt);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  SignInMethod signInMethod,  String? idLinkedProvider,  List<SignInMethod> linkedProviders,  List<String>? rustoreTokens,  String? displayName,  String? photoUrl,  String? phoneNumber,  bool emailVerified,  DateTime? createdAt,  DateTime? lastLoginAt)?  $default,) {final _that = this;
switch (_that) {
case _TMUser() when $default != null:
return $default(_that.id,_that.email,_that.signInMethod,_that.idLinkedProvider,_that.linkedProviders,_that.rustoreTokens,_that.displayName,_that.photoUrl,_that.phoneNumber,_that.emailVerified,_that.createdAt,_that.lastLoginAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TMUser extends TMUser {
  const _TMUser({required this.id, required this.email, required this.signInMethod, this.idLinkedProvider, final  List<SignInMethod> linkedProviders = const [], final  List<String>? rustoreTokens = const [], this.displayName, this.photoUrl, this.phoneNumber, this.emailVerified = false, this.createdAt, this.lastLoginAt}): _linkedProviders = linkedProviders,_rustoreTokens = rustoreTokens,super._();
  factory _TMUser.fromJson(Map<String, dynamic> json) => _$TMUserFromJson(json);

@override final  String id;
@override final  String email;
@override final  SignInMethod signInMethod;
@override final  String? idLinkedProvider;
 final  List<SignInMethod> _linkedProviders;
@override@JsonKey() List<SignInMethod> get linkedProviders {
  if (_linkedProviders is EqualUnmodifiableListView) return _linkedProviders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_linkedProviders);
}

 final  List<String>? _rustoreTokens;
@override@JsonKey() List<String>? get rustoreTokens {
  final value = _rustoreTokens;
  if (value == null) return null;
  if (_rustoreTokens is EqualUnmodifiableListView) return _rustoreTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? displayName;
@override final  String? photoUrl;
@override final  String? phoneNumber;
@override@JsonKey() final  bool emailVerified;
@override final  DateTime? createdAt;
@override final  DateTime? lastLoginAt;

/// Create a copy of TMUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TMUserCopyWith<_TMUser> get copyWith => __$TMUserCopyWithImpl<_TMUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TMUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TMUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.signInMethod, signInMethod) || other.signInMethod == signInMethod)&&(identical(other.idLinkedProvider, idLinkedProvider) || other.idLinkedProvider == idLinkedProvider)&&const DeepCollectionEquality().equals(other._linkedProviders, _linkedProviders)&&const DeepCollectionEquality().equals(other._rustoreTokens, _rustoreTokens)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,signInMethod,idLinkedProvider,const DeepCollectionEquality().hash(_linkedProviders),const DeepCollectionEquality().hash(_rustoreTokens),displayName,photoUrl,phoneNumber,emailVerified,createdAt,lastLoginAt);

@override
String toString() {
  return 'TMUser(id: $id, email: $email, signInMethod: $signInMethod, idLinkedProvider: $idLinkedProvider, linkedProviders: $linkedProviders, rustoreTokens: $rustoreTokens, displayName: $displayName, photoUrl: $photoUrl, phoneNumber: $phoneNumber, emailVerified: $emailVerified, createdAt: $createdAt, lastLoginAt: $lastLoginAt)';
}


}

/// @nodoc
abstract mixin class _$TMUserCopyWith<$Res> implements $TMUserCopyWith<$Res> {
  factory _$TMUserCopyWith(_TMUser value, $Res Function(_TMUser) _then) = __$TMUserCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, SignInMethod signInMethod, String? idLinkedProvider, List<SignInMethod> linkedProviders, List<String>? rustoreTokens, String? displayName, String? photoUrl, String? phoneNumber, bool emailVerified, DateTime? createdAt, DateTime? lastLoginAt
});




}
/// @nodoc
class __$TMUserCopyWithImpl<$Res>
    implements _$TMUserCopyWith<$Res> {
  __$TMUserCopyWithImpl(this._self, this._then);

  final _TMUser _self;
  final $Res Function(_TMUser) _then;

/// Create a copy of TMUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? signInMethod = null,Object? idLinkedProvider = freezed,Object? linkedProviders = null,Object? rustoreTokens = freezed,Object? displayName = freezed,Object? photoUrl = freezed,Object? phoneNumber = freezed,Object? emailVerified = null,Object? createdAt = freezed,Object? lastLoginAt = freezed,}) {
  return _then(_TMUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,signInMethod: null == signInMethod ? _self.signInMethod : signInMethod // ignore: cast_nullable_to_non_nullable
as SignInMethod,idLinkedProvider: freezed == idLinkedProvider ? _self.idLinkedProvider : idLinkedProvider // ignore: cast_nullable_to_non_nullable
as String?,linkedProviders: null == linkedProviders ? _self._linkedProviders : linkedProviders // ignore: cast_nullable_to_non_nullable
as List<SignInMethod>,rustoreTokens: freezed == rustoreTokens ? _self._rustoreTokens : rustoreTokens // ignore: cast_nullable_to_non_nullable
as List<String>?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
