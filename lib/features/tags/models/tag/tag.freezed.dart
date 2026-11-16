// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TMTaskTag {

 String get id; String get name;@ColorConverter() int? get color;
/// Create a copy of TMTaskTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TMTaskTagCopyWith<TMTaskTag> get copyWith => _$TMTaskTagCopyWithImpl<TMTaskTag>(this as TMTaskTag, _$identity);

  /// Serializes this TMTaskTag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TMTaskTag&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color);

@override
String toString() {
  return 'TMTaskTag(id: $id, name: $name, color: $color)';
}


}

/// @nodoc
abstract mixin class $TMTaskTagCopyWith<$Res>  {
  factory $TMTaskTagCopyWith(TMTaskTag value, $Res Function(TMTaskTag) _then) = _$TMTaskTagCopyWithImpl;
@useResult
$Res call({
 String id, String name,@ColorConverter() int? color
});




}
/// @nodoc
class _$TMTaskTagCopyWithImpl<$Res>
    implements $TMTaskTagCopyWith<$Res> {
  _$TMTaskTagCopyWithImpl(this._self, this._then);

  final TMTaskTag _self;
  final $Res Function(TMTaskTag) _then;

/// Create a copy of TMTaskTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? color = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TMTaskTag].
extension TMTaskTagPatterns on TMTaskTag {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TMTaskTag value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TMTaskTag() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TMTaskTag value)  $default,){
final _that = this;
switch (_that) {
case _TMTaskTag():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TMTaskTag value)?  $default,){
final _that = this;
switch (_that) {
case _TMTaskTag() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @ColorConverter()  int? color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TMTaskTag() when $default != null:
return $default(_that.id,_that.name,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @ColorConverter()  int? color)  $default,) {final _that = this;
switch (_that) {
case _TMTaskTag():
return $default(_that.id,_that.name,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @ColorConverter()  int? color)?  $default,) {final _that = this;
switch (_that) {
case _TMTaskTag() when $default != null:
return $default(_that.id,_that.name,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TMTaskTag implements TMTaskTag {
  const _TMTaskTag({required this.id, required this.name, @ColorConverter() this.color});
  factory _TMTaskTag.fromJson(Map<String, dynamic> json) => _$TMTaskTagFromJson(json);

@override final  String id;
@override final  String name;
@override@ColorConverter() final  int? color;

/// Create a copy of TMTaskTag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TMTaskTagCopyWith<_TMTaskTag> get copyWith => __$TMTaskTagCopyWithImpl<_TMTaskTag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TMTaskTagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TMTaskTag&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color);

@override
String toString() {
  return 'TMTaskTag(id: $id, name: $name, color: $color)';
}


}

/// @nodoc
abstract mixin class _$TMTaskTagCopyWith<$Res> implements $TMTaskTagCopyWith<$Res> {
  factory _$TMTaskTagCopyWith(_TMTaskTag value, $Res Function(_TMTaskTag) _then) = __$TMTaskTagCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@ColorConverter() int? color
});




}
/// @nodoc
class __$TMTaskTagCopyWithImpl<$Res>
    implements _$TMTaskTagCopyWith<$Res> {
  __$TMTaskTagCopyWithImpl(this._self, this._then);

  final _TMTaskTag _self;
  final $Res Function(_TMTaskTag) _then;

/// Create a copy of TMTaskTag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? color = freezed,}) {
  return _then(_TMTaskTag(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
