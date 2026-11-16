// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TMTask {

 String get projectId; String get name;@TMTaskStatusConverter() TaskStatus get status; String get id;// @JsonKey(name: 'is_complete') @Default(false) bool isComplete,
@JsonKey(name: 'owner_id') String? get ownerId;@JsonKey(name: 'responsible_ids') List<String> get responsibleIds;@JsonKey(name: 'archived') bool get archived;@JsonKey(name: 'archived_at')@TimestampConverter() DateTime? get archivedAt;@JsonKey(name: 'created_at')@TimestampConverter() DateTime? get createdAt;@JsonKey(name: 'updated_at')@TimestampConverter() DateTime? get updatedAt;@JsonKey(name: 'start_date')@TimestampConverter() DateTime? get startDate;@JsonKey(name: 'end_date')@TimestampConverter() DateTime? get endDate; List<String> get tagsIds; String? get description;
/// Create a copy of TMTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TMTaskCopyWith<TMTask> get copyWith => _$TMTaskCopyWithImpl<TMTask>(this as TMTask, _$identity);

  /// Serializes this TMTask to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TMTask&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&const DeepCollectionEquality().equals(other.responsibleIds, responsibleIds)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.tagsIds, tagsIds)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,projectId,name,status,id,ownerId,const DeepCollectionEquality().hash(responsibleIds),archived,archivedAt,createdAt,updatedAt,startDate,endDate,const DeepCollectionEquality().hash(tagsIds),description);

@override
String toString() {
  return 'TMTask(projectId: $projectId, name: $name, status: $status, id: $id, ownerId: $ownerId, responsibleIds: $responsibleIds, archived: $archived, archivedAt: $archivedAt, createdAt: $createdAt, updatedAt: $updatedAt, startDate: $startDate, endDate: $endDate, tagsIds: $tagsIds, description: $description)';
}


}

/// @nodoc
abstract mixin class $TMTaskCopyWith<$Res>  {
  factory $TMTaskCopyWith(TMTask value, $Res Function(TMTask) _then) = _$TMTaskCopyWithImpl;
@useResult
$Res call({
 String projectId, String name,@TMTaskStatusConverter() TaskStatus status, String id,@JsonKey(name: 'owner_id') String? ownerId,@JsonKey(name: 'responsible_ids') List<String> responsibleIds,@JsonKey(name: 'archived') bool archived,@JsonKey(name: 'archived_at')@TimestampConverter() DateTime? archivedAt,@JsonKey(name: 'created_at')@TimestampConverter() DateTime? createdAt,@JsonKey(name: 'updated_at')@TimestampConverter() DateTime? updatedAt,@JsonKey(name: 'start_date')@TimestampConverter() DateTime? startDate,@JsonKey(name: 'end_date')@TimestampConverter() DateTime? endDate, List<String> tagsIds, String? description
});




}
/// @nodoc
class _$TMTaskCopyWithImpl<$Res>
    implements $TMTaskCopyWith<$Res> {
  _$TMTaskCopyWithImpl(this._self, this._then);

  final TMTask _self;
  final $Res Function(TMTask) _then;

/// Create a copy of TMTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projectId = null,Object? name = null,Object? status = null,Object? id = null,Object? ownerId = freezed,Object? responsibleIds = null,Object? archived = null,Object? archivedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? tagsIds = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: freezed == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String?,responsibleIds: null == responsibleIds ? _self.responsibleIds : responsibleIds // ignore: cast_nullable_to_non_nullable
as List<String>,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,archivedAt: freezed == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,tagsIds: null == tagsIds ? _self.tagsIds : tagsIds // ignore: cast_nullable_to_non_nullable
as List<String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TMTask].
extension TMTaskPatterns on TMTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TMTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TMTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TMTask value)  $default,){
final _that = this;
switch (_that) {
case _TMTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TMTask value)?  $default,){
final _that = this;
switch (_that) {
case _TMTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String projectId,  String name, @TMTaskStatusConverter()  TaskStatus status,  String id, @JsonKey(name: 'owner_id')  String? ownerId, @JsonKey(name: 'responsible_ids')  List<String> responsibleIds, @JsonKey(name: 'archived')  bool archived, @JsonKey(name: 'archived_at')@TimestampConverter()  DateTime? archivedAt, @JsonKey(name: 'created_at')@TimestampConverter()  DateTime? createdAt, @JsonKey(name: 'updated_at')@TimestampConverter()  DateTime? updatedAt, @JsonKey(name: 'start_date')@TimestampConverter()  DateTime? startDate, @JsonKey(name: 'end_date')@TimestampConverter()  DateTime? endDate,  List<String> tagsIds,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TMTask() when $default != null:
return $default(_that.projectId,_that.name,_that.status,_that.id,_that.ownerId,_that.responsibleIds,_that.archived,_that.archivedAt,_that.createdAt,_that.updatedAt,_that.startDate,_that.endDate,_that.tagsIds,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String projectId,  String name, @TMTaskStatusConverter()  TaskStatus status,  String id, @JsonKey(name: 'owner_id')  String? ownerId, @JsonKey(name: 'responsible_ids')  List<String> responsibleIds, @JsonKey(name: 'archived')  bool archived, @JsonKey(name: 'archived_at')@TimestampConverter()  DateTime? archivedAt, @JsonKey(name: 'created_at')@TimestampConverter()  DateTime? createdAt, @JsonKey(name: 'updated_at')@TimestampConverter()  DateTime? updatedAt, @JsonKey(name: 'start_date')@TimestampConverter()  DateTime? startDate, @JsonKey(name: 'end_date')@TimestampConverter()  DateTime? endDate,  List<String> tagsIds,  String? description)  $default,) {final _that = this;
switch (_that) {
case _TMTask():
return $default(_that.projectId,_that.name,_that.status,_that.id,_that.ownerId,_that.responsibleIds,_that.archived,_that.archivedAt,_that.createdAt,_that.updatedAt,_that.startDate,_that.endDate,_that.tagsIds,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String projectId,  String name, @TMTaskStatusConverter()  TaskStatus status,  String id, @JsonKey(name: 'owner_id')  String? ownerId, @JsonKey(name: 'responsible_ids')  List<String> responsibleIds, @JsonKey(name: 'archived')  bool archived, @JsonKey(name: 'archived_at')@TimestampConverter()  DateTime? archivedAt, @JsonKey(name: 'created_at')@TimestampConverter()  DateTime? createdAt, @JsonKey(name: 'updated_at')@TimestampConverter()  DateTime? updatedAt, @JsonKey(name: 'start_date')@TimestampConverter()  DateTime? startDate, @JsonKey(name: 'end_date')@TimestampConverter()  DateTime? endDate,  List<String> tagsIds,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _TMTask() when $default != null:
return $default(_that.projectId,_that.name,_that.status,_that.id,_that.ownerId,_that.responsibleIds,_that.archived,_that.archivedAt,_that.createdAt,_that.updatedAt,_that.startDate,_that.endDate,_that.tagsIds,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TMTask implements TMTask {
  const _TMTask({required this.projectId, required this.name, @TMTaskStatusConverter() this.status = TaskStatus.todo, this.id = '', @JsonKey(name: 'owner_id') this.ownerId, @JsonKey(name: 'responsible_ids') final  List<String> responsibleIds = const [], @JsonKey(name: 'archived') this.archived = false, @JsonKey(name: 'archived_at')@TimestampConverter() this.archivedAt, @JsonKey(name: 'created_at')@TimestampConverter() this.createdAt, @JsonKey(name: 'updated_at')@TimestampConverter() this.updatedAt, @JsonKey(name: 'start_date')@TimestampConverter() this.startDate, @JsonKey(name: 'end_date')@TimestampConverter() this.endDate, final  List<String> tagsIds = const [], this.description}): _responsibleIds = responsibleIds,_tagsIds = tagsIds;
  factory _TMTask.fromJson(Map<String, dynamic> json) => _$TMTaskFromJson(json);

@override final  String projectId;
@override final  String name;
@override@JsonKey()@TMTaskStatusConverter() final  TaskStatus status;
@override@JsonKey() final  String id;
// @JsonKey(name: 'is_complete') @Default(false) bool isComplete,
@override@JsonKey(name: 'owner_id') final  String? ownerId;
 final  List<String> _responsibleIds;
@override@JsonKey(name: 'responsible_ids') List<String> get responsibleIds {
  if (_responsibleIds is EqualUnmodifiableListView) return _responsibleIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_responsibleIds);
}

@override@JsonKey(name: 'archived') final  bool archived;
@override@JsonKey(name: 'archived_at')@TimestampConverter() final  DateTime? archivedAt;
@override@JsonKey(name: 'created_at')@TimestampConverter() final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at')@TimestampConverter() final  DateTime? updatedAt;
@override@JsonKey(name: 'start_date')@TimestampConverter() final  DateTime? startDate;
@override@JsonKey(name: 'end_date')@TimestampConverter() final  DateTime? endDate;
 final  List<String> _tagsIds;
@override@JsonKey() List<String> get tagsIds {
  if (_tagsIds is EqualUnmodifiableListView) return _tagsIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tagsIds);
}

@override final  String? description;

/// Create a copy of TMTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TMTaskCopyWith<_TMTask> get copyWith => __$TMTaskCopyWithImpl<_TMTask>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TMTaskToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TMTask&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&const DeepCollectionEquality().equals(other._responsibleIds, _responsibleIds)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._tagsIds, _tagsIds)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,projectId,name,status,id,ownerId,const DeepCollectionEquality().hash(_responsibleIds),archived,archivedAt,createdAt,updatedAt,startDate,endDate,const DeepCollectionEquality().hash(_tagsIds),description);

@override
String toString() {
  return 'TMTask(projectId: $projectId, name: $name, status: $status, id: $id, ownerId: $ownerId, responsibleIds: $responsibleIds, archived: $archived, archivedAt: $archivedAt, createdAt: $createdAt, updatedAt: $updatedAt, startDate: $startDate, endDate: $endDate, tagsIds: $tagsIds, description: $description)';
}


}

/// @nodoc
abstract mixin class _$TMTaskCopyWith<$Res> implements $TMTaskCopyWith<$Res> {
  factory _$TMTaskCopyWith(_TMTask value, $Res Function(_TMTask) _then) = __$TMTaskCopyWithImpl;
@override @useResult
$Res call({
 String projectId, String name,@TMTaskStatusConverter() TaskStatus status, String id,@JsonKey(name: 'owner_id') String? ownerId,@JsonKey(name: 'responsible_ids') List<String> responsibleIds,@JsonKey(name: 'archived') bool archived,@JsonKey(name: 'archived_at')@TimestampConverter() DateTime? archivedAt,@JsonKey(name: 'created_at')@TimestampConverter() DateTime? createdAt,@JsonKey(name: 'updated_at')@TimestampConverter() DateTime? updatedAt,@JsonKey(name: 'start_date')@TimestampConverter() DateTime? startDate,@JsonKey(name: 'end_date')@TimestampConverter() DateTime? endDate, List<String> tagsIds, String? description
});




}
/// @nodoc
class __$TMTaskCopyWithImpl<$Res>
    implements _$TMTaskCopyWith<$Res> {
  __$TMTaskCopyWithImpl(this._self, this._then);

  final _TMTask _self;
  final $Res Function(_TMTask) _then;

/// Create a copy of TMTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? name = null,Object? status = null,Object? id = null,Object? ownerId = freezed,Object? responsibleIds = null,Object? archived = null,Object? archivedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? tagsIds = null,Object? description = freezed,}) {
  return _then(_TMTask(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: freezed == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String?,responsibleIds: null == responsibleIds ? _self._responsibleIds : responsibleIds // ignore: cast_nullable_to_non_nullable
as List<String>,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,archivedAt: freezed == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,tagsIds: null == tagsIds ? _self._tagsIds : tagsIds // ignore: cast_nullable_to_non_nullable
as List<String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
