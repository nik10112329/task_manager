// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TMProject {

 String get id; String get name; String? get description;@JsonKey(name: 'creator_id') String? get creatorId;@JsonKey(name: 'owner_id') String? get ownerId;@JsonKey(name: 'start_date')@TimestampConverter() DateTime? get startDate;@JsonKey(name: 'created_at')@TimestampConverter() DateTime? get createdAt;@JsonKey(name: 'end_date')@TimestampConverter() DateTime? get endDate;@JsonKey(name: 'updated_at')@TimestampConverter() DateTime? get updatedAt;@JsonKey(name: 'participants_ids') List<String> get participants;@JsonKey(name: 'tags_ids') List<String> get tagsIds;
/// Create a copy of TMProject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TMProjectCopyWith<TMProject> get copyWith => _$TMProjectCopyWithImpl<TMProject>(this as TMProject, _$identity);

  /// Serializes this TMProject to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TMProject&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.participants, participants)&&const DeepCollectionEquality().equals(other.tagsIds, tagsIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,creatorId,ownerId,startDate,createdAt,endDate,updatedAt,const DeepCollectionEquality().hash(participants),const DeepCollectionEquality().hash(tagsIds));

@override
String toString() {
  return 'TMProject(id: $id, name: $name, description: $description, creatorId: $creatorId, ownerId: $ownerId, startDate: $startDate, createdAt: $createdAt, endDate: $endDate, updatedAt: $updatedAt, participants: $participants, tagsIds: $tagsIds)';
}


}

/// @nodoc
abstract mixin class $TMProjectCopyWith<$Res>  {
  factory $TMProjectCopyWith(TMProject value, $Res Function(TMProject) _then) = _$TMProjectCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description,@JsonKey(name: 'creator_id') String? creatorId,@JsonKey(name: 'owner_id') String? ownerId,@JsonKey(name: 'start_date')@TimestampConverter() DateTime? startDate,@JsonKey(name: 'created_at')@TimestampConverter() DateTime? createdAt,@JsonKey(name: 'end_date')@TimestampConverter() DateTime? endDate,@JsonKey(name: 'updated_at')@TimestampConverter() DateTime? updatedAt,@JsonKey(name: 'participants_ids') List<String> participants,@JsonKey(name: 'tags_ids') List<String> tagsIds
});




}
/// @nodoc
class _$TMProjectCopyWithImpl<$Res>
    implements $TMProjectCopyWith<$Res> {
  _$TMProjectCopyWithImpl(this._self, this._then);

  final TMProject _self;
  final $Res Function(TMProject) _then;

/// Create a copy of TMProject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? creatorId = freezed,Object? ownerId = freezed,Object? startDate = freezed,Object? createdAt = freezed,Object? endDate = freezed,Object? updatedAt = freezed,Object? participants = null,Object? tagsIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,creatorId: freezed == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String?,ownerId: freezed == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<String>,tagsIds: null == tagsIds ? _self.tagsIds : tagsIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [TMProject].
extension TMProjectPatterns on TMProject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TMProject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TMProject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TMProject value)  $default,){
final _that = this;
switch (_that) {
case _TMProject():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TMProject value)?  $default,){
final _that = this;
switch (_that) {
case _TMProject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description, @JsonKey(name: 'creator_id')  String? creatorId, @JsonKey(name: 'owner_id')  String? ownerId, @JsonKey(name: 'start_date')@TimestampConverter()  DateTime? startDate, @JsonKey(name: 'created_at')@TimestampConverter()  DateTime? createdAt, @JsonKey(name: 'end_date')@TimestampConverter()  DateTime? endDate, @JsonKey(name: 'updated_at')@TimestampConverter()  DateTime? updatedAt, @JsonKey(name: 'participants_ids')  List<String> participants, @JsonKey(name: 'tags_ids')  List<String> tagsIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TMProject() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.creatorId,_that.ownerId,_that.startDate,_that.createdAt,_that.endDate,_that.updatedAt,_that.participants,_that.tagsIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description, @JsonKey(name: 'creator_id')  String? creatorId, @JsonKey(name: 'owner_id')  String? ownerId, @JsonKey(name: 'start_date')@TimestampConverter()  DateTime? startDate, @JsonKey(name: 'created_at')@TimestampConverter()  DateTime? createdAt, @JsonKey(name: 'end_date')@TimestampConverter()  DateTime? endDate, @JsonKey(name: 'updated_at')@TimestampConverter()  DateTime? updatedAt, @JsonKey(name: 'participants_ids')  List<String> participants, @JsonKey(name: 'tags_ids')  List<String> tagsIds)  $default,) {final _that = this;
switch (_that) {
case _TMProject():
return $default(_that.id,_that.name,_that.description,_that.creatorId,_that.ownerId,_that.startDate,_that.createdAt,_that.endDate,_that.updatedAt,_that.participants,_that.tagsIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description, @JsonKey(name: 'creator_id')  String? creatorId, @JsonKey(name: 'owner_id')  String? ownerId, @JsonKey(name: 'start_date')@TimestampConverter()  DateTime? startDate, @JsonKey(name: 'created_at')@TimestampConverter()  DateTime? createdAt, @JsonKey(name: 'end_date')@TimestampConverter()  DateTime? endDate, @JsonKey(name: 'updated_at')@TimestampConverter()  DateTime? updatedAt, @JsonKey(name: 'participants_ids')  List<String> participants, @JsonKey(name: 'tags_ids')  List<String> tagsIds)?  $default,) {final _that = this;
switch (_that) {
case _TMProject() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.creatorId,_that.ownerId,_that.startDate,_that.createdAt,_that.endDate,_that.updatedAt,_that.participants,_that.tagsIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TMProject implements TMProject {
  const _TMProject({required this.id, required this.name, this.description, @JsonKey(name: 'creator_id') this.creatorId, @JsonKey(name: 'owner_id') this.ownerId, @JsonKey(name: 'start_date')@TimestampConverter() this.startDate, @JsonKey(name: 'created_at')@TimestampConverter() this.createdAt, @JsonKey(name: 'end_date')@TimestampConverter() this.endDate, @JsonKey(name: 'updated_at')@TimestampConverter() this.updatedAt, @JsonKey(name: 'participants_ids') final  List<String> participants = const [], @JsonKey(name: 'tags_ids') final  List<String> tagsIds = const []}): _participants = participants,_tagsIds = tagsIds;
  factory _TMProject.fromJson(Map<String, dynamic> json) => _$TMProjectFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override@JsonKey(name: 'creator_id') final  String? creatorId;
@override@JsonKey(name: 'owner_id') final  String? ownerId;
@override@JsonKey(name: 'start_date')@TimestampConverter() final  DateTime? startDate;
@override@JsonKey(name: 'created_at')@TimestampConverter() final  DateTime? createdAt;
@override@JsonKey(name: 'end_date')@TimestampConverter() final  DateTime? endDate;
@override@JsonKey(name: 'updated_at')@TimestampConverter() final  DateTime? updatedAt;
 final  List<String> _participants;
@override@JsonKey(name: 'participants_ids') List<String> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

 final  List<String> _tagsIds;
@override@JsonKey(name: 'tags_ids') List<String> get tagsIds {
  if (_tagsIds is EqualUnmodifiableListView) return _tagsIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tagsIds);
}


/// Create a copy of TMProject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TMProjectCopyWith<_TMProject> get copyWith => __$TMProjectCopyWithImpl<_TMProject>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TMProjectToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TMProject&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._participants, _participants)&&const DeepCollectionEquality().equals(other._tagsIds, _tagsIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,creatorId,ownerId,startDate,createdAt,endDate,updatedAt,const DeepCollectionEquality().hash(_participants),const DeepCollectionEquality().hash(_tagsIds));

@override
String toString() {
  return 'TMProject(id: $id, name: $name, description: $description, creatorId: $creatorId, ownerId: $ownerId, startDate: $startDate, createdAt: $createdAt, endDate: $endDate, updatedAt: $updatedAt, participants: $participants, tagsIds: $tagsIds)';
}


}

/// @nodoc
abstract mixin class _$TMProjectCopyWith<$Res> implements $TMProjectCopyWith<$Res> {
  factory _$TMProjectCopyWith(_TMProject value, $Res Function(_TMProject) _then) = __$TMProjectCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description,@JsonKey(name: 'creator_id') String? creatorId,@JsonKey(name: 'owner_id') String? ownerId,@JsonKey(name: 'start_date')@TimestampConverter() DateTime? startDate,@JsonKey(name: 'created_at')@TimestampConverter() DateTime? createdAt,@JsonKey(name: 'end_date')@TimestampConverter() DateTime? endDate,@JsonKey(name: 'updated_at')@TimestampConverter() DateTime? updatedAt,@JsonKey(name: 'participants_ids') List<String> participants,@JsonKey(name: 'tags_ids') List<String> tagsIds
});




}
/// @nodoc
class __$TMProjectCopyWithImpl<$Res>
    implements _$TMProjectCopyWith<$Res> {
  __$TMProjectCopyWithImpl(this._self, this._then);

  final _TMProject _self;
  final $Res Function(_TMProject) _then;

/// Create a copy of TMProject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? creatorId = freezed,Object? ownerId = freezed,Object? startDate = freezed,Object? createdAt = freezed,Object? endDate = freezed,Object? updatedAt = freezed,Object? participants = null,Object? tagsIds = null,}) {
  return _then(_TMProject(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,creatorId: freezed == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String?,ownerId: freezed == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<String>,tagsIds: null == tagsIds ? _self._tagsIds : tagsIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
