// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TMNotification {

 String get id; bool get isRead; DateTime get date; String get text; String get title; String? get imageUrl; String? get deepLink;
/// Create a copy of TMNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TMNotificationCopyWith<TMNotification> get copyWith => _$TMNotificationCopyWithImpl<TMNotification>(this as TMNotification, _$identity);

  /// Serializes this TMNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TMNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.date, date) || other.date == date)&&(identical(other.text, text) || other.text == text)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.deepLink, deepLink) || other.deepLink == deepLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isRead,date,text,title,imageUrl,deepLink);

@override
String toString() {
  return 'TMNotification(id: $id, isRead: $isRead, date: $date, text: $text, title: $title, imageUrl: $imageUrl, deepLink: $deepLink)';
}


}

/// @nodoc
abstract mixin class $TMNotificationCopyWith<$Res>  {
  factory $TMNotificationCopyWith(TMNotification value, $Res Function(TMNotification) _then) = _$TMNotificationCopyWithImpl;
@useResult
$Res call({
 String id, bool isRead, DateTime date, String text, String title, String? imageUrl, String? deepLink
});




}
/// @nodoc
class _$TMNotificationCopyWithImpl<$Res>
    implements $TMNotificationCopyWith<$Res> {
  _$TMNotificationCopyWithImpl(this._self, this._then);

  final TMNotification _self;
  final $Res Function(TMNotification) _then;

/// Create a copy of TMNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? isRead = null,Object? date = null,Object? text = null,Object? title = null,Object? imageUrl = freezed,Object? deepLink = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,deepLink: freezed == deepLink ? _self.deepLink : deepLink // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TMNotification].
extension TMNotificationPatterns on TMNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TMNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TMNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TMNotification value)  $default,){
final _that = this;
switch (_that) {
case _TMNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TMNotification value)?  $default,){
final _that = this;
switch (_that) {
case _TMNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool isRead,  DateTime date,  String text,  String title,  String? imageUrl,  String? deepLink)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TMNotification() when $default != null:
return $default(_that.id,_that.isRead,_that.date,_that.text,_that.title,_that.imageUrl,_that.deepLink);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool isRead,  DateTime date,  String text,  String title,  String? imageUrl,  String? deepLink)  $default,) {final _that = this;
switch (_that) {
case _TMNotification():
return $default(_that.id,_that.isRead,_that.date,_that.text,_that.title,_that.imageUrl,_that.deepLink);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool isRead,  DateTime date,  String text,  String title,  String? imageUrl,  String? deepLink)?  $default,) {final _that = this;
switch (_that) {
case _TMNotification() when $default != null:
return $default(_that.id,_that.isRead,_that.date,_that.text,_that.title,_that.imageUrl,_that.deepLink);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TMNotification implements TMNotification {
  const _TMNotification({required this.id, required this.isRead, required this.date, required this.text, required this.title, this.imageUrl, this.deepLink});
  factory _TMNotification.fromJson(Map<String, dynamic> json) => _$TMNotificationFromJson(json);

@override final  String id;
@override final  bool isRead;
@override final  DateTime date;
@override final  String text;
@override final  String title;
@override final  String? imageUrl;
@override final  String? deepLink;

/// Create a copy of TMNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TMNotificationCopyWith<_TMNotification> get copyWith => __$TMNotificationCopyWithImpl<_TMNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TMNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TMNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.date, date) || other.date == date)&&(identical(other.text, text) || other.text == text)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.deepLink, deepLink) || other.deepLink == deepLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isRead,date,text,title,imageUrl,deepLink);

@override
String toString() {
  return 'TMNotification(id: $id, isRead: $isRead, date: $date, text: $text, title: $title, imageUrl: $imageUrl, deepLink: $deepLink)';
}


}

/// @nodoc
abstract mixin class _$TMNotificationCopyWith<$Res> implements $TMNotificationCopyWith<$Res> {
  factory _$TMNotificationCopyWith(_TMNotification value, $Res Function(_TMNotification) _then) = __$TMNotificationCopyWithImpl;
@override @useResult
$Res call({
 String id, bool isRead, DateTime date, String text, String title, String? imageUrl, String? deepLink
});




}
/// @nodoc
class __$TMNotificationCopyWithImpl<$Res>
    implements _$TMNotificationCopyWith<$Res> {
  __$TMNotificationCopyWithImpl(this._self, this._then);

  final _TMNotification _self;
  final $Res Function(_TMNotification) _then;

/// Create a copy of TMNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isRead = null,Object? date = null,Object? text = null,Object? title = null,Object? imageUrl = freezed,Object? deepLink = freezed,}) {
  return _then(_TMNotification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,deepLink: freezed == deepLink ? _self.deepLink : deepLink // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
