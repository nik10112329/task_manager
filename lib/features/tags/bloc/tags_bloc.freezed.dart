// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tags_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TagsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TagsEvent()';
}


}

/// @nodoc
class $TagsEventCopyWith<$Res>  {
$TagsEventCopyWith(TagsEvent _, $Res Function(TagsEvent) __);
}


/// Adds pattern-matching-related methods to [TagsEvent].
extension TagsEventPatterns on TagsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchTagsTagsEvent value)?  fetchTags,TResult Function( _FetchTagsFromTaskTagsEvent value)?  fetchTagsFromTask,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchTagsTagsEvent() when fetchTags != null:
return fetchTags(_that);case _FetchTagsFromTaskTagsEvent() when fetchTagsFromTask != null:
return fetchTagsFromTask(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchTagsTagsEvent value)  fetchTags,required TResult Function( _FetchTagsFromTaskTagsEvent value)  fetchTagsFromTask,}){
final _that = this;
switch (_that) {
case _FetchTagsTagsEvent():
return fetchTags(_that);case _FetchTagsFromTaskTagsEvent():
return fetchTagsFromTask(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchTagsTagsEvent value)?  fetchTags,TResult? Function( _FetchTagsFromTaskTagsEvent value)?  fetchTagsFromTask,}){
final _that = this;
switch (_that) {
case _FetchTagsTagsEvent() when fetchTags != null:
return fetchTags(_that);case _FetchTagsFromTaskTagsEvent() when fetchTagsFromTask != null:
return fetchTagsFromTask(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<String> tagsIds)?  fetchTags,TResult Function( String taskId)?  fetchTagsFromTask,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchTagsTagsEvent() when fetchTags != null:
return fetchTags(_that.tagsIds);case _FetchTagsFromTaskTagsEvent() when fetchTagsFromTask != null:
return fetchTagsFromTask(_that.taskId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<String> tagsIds)  fetchTags,required TResult Function( String taskId)  fetchTagsFromTask,}) {final _that = this;
switch (_that) {
case _FetchTagsTagsEvent():
return fetchTags(_that.tagsIds);case _FetchTagsFromTaskTagsEvent():
return fetchTagsFromTask(_that.taskId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<String> tagsIds)?  fetchTags,TResult? Function( String taskId)?  fetchTagsFromTask,}) {final _that = this;
switch (_that) {
case _FetchTagsTagsEvent() when fetchTags != null:
return fetchTags(_that.tagsIds);case _FetchTagsFromTaskTagsEvent() when fetchTagsFromTask != null:
return fetchTagsFromTask(_that.taskId);case _:
  return null;

}
}

}

/// @nodoc


class _FetchTagsTagsEvent extends TagsEvent {
  const _FetchTagsTagsEvent({required final  List<String> tagsIds}): _tagsIds = tagsIds,super._();
  

 final  List<String> _tagsIds;
 List<String> get tagsIds {
  if (_tagsIds is EqualUnmodifiableListView) return _tagsIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tagsIds);
}


/// Create a copy of TagsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchTagsTagsEventCopyWith<_FetchTagsTagsEvent> get copyWith => __$FetchTagsTagsEventCopyWithImpl<_FetchTagsTagsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchTagsTagsEvent&&const DeepCollectionEquality().equals(other._tagsIds, _tagsIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tagsIds));

@override
String toString() {
  return 'TagsEvent.fetchTags(tagsIds: $tagsIds)';
}


}

/// @nodoc
abstract mixin class _$FetchTagsTagsEventCopyWith<$Res> implements $TagsEventCopyWith<$Res> {
  factory _$FetchTagsTagsEventCopyWith(_FetchTagsTagsEvent value, $Res Function(_FetchTagsTagsEvent) _then) = __$FetchTagsTagsEventCopyWithImpl;
@useResult
$Res call({
 List<String> tagsIds
});




}
/// @nodoc
class __$FetchTagsTagsEventCopyWithImpl<$Res>
    implements _$FetchTagsTagsEventCopyWith<$Res> {
  __$FetchTagsTagsEventCopyWithImpl(this._self, this._then);

  final _FetchTagsTagsEvent _self;
  final $Res Function(_FetchTagsTagsEvent) _then;

/// Create a copy of TagsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tagsIds = null,}) {
  return _then(_FetchTagsTagsEvent(
tagsIds: null == tagsIds ? _self._tagsIds : tagsIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class _FetchTagsFromTaskTagsEvent extends TagsEvent {
  const _FetchTagsFromTaskTagsEvent({required this.taskId}): super._();
  

 final  String taskId;

/// Create a copy of TagsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchTagsFromTaskTagsEventCopyWith<_FetchTagsFromTaskTagsEvent> get copyWith => __$FetchTagsFromTaskTagsEventCopyWithImpl<_FetchTagsFromTaskTagsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchTagsFromTaskTagsEvent&&(identical(other.taskId, taskId) || other.taskId == taskId));
}


@override
int get hashCode => Object.hash(runtimeType,taskId);

@override
String toString() {
  return 'TagsEvent.fetchTagsFromTask(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class _$FetchTagsFromTaskTagsEventCopyWith<$Res> implements $TagsEventCopyWith<$Res> {
  factory _$FetchTagsFromTaskTagsEventCopyWith(_FetchTagsFromTaskTagsEvent value, $Res Function(_FetchTagsFromTaskTagsEvent) _then) = __$FetchTagsFromTaskTagsEventCopyWithImpl;
@useResult
$Res call({
 String taskId
});




}
/// @nodoc
class __$FetchTagsFromTaskTagsEventCopyWithImpl<$Res>
    implements _$FetchTagsFromTaskTagsEventCopyWith<$Res> {
  __$FetchTagsFromTaskTagsEventCopyWithImpl(this._self, this._then);

  final _FetchTagsFromTaskTagsEvent _self;
  final $Res Function(_FetchTagsFromTaskTagsEvent) _then;

/// Create a copy of TagsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskId = null,}) {
  return _then(_FetchTagsFromTaskTagsEvent(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$TagsState {

 List<TMTaskTag> get tags;
/// Create a copy of TagsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagsStateCopyWith<TagsState> get copyWith => _$TagsStateCopyWithImpl<TagsState>(this as TagsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagsState&&const DeepCollectionEquality().equals(other.tags, tags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'TagsState(tags: $tags)';
}


}

/// @nodoc
abstract mixin class $TagsStateCopyWith<$Res>  {
  factory $TagsStateCopyWith(TagsState value, $Res Function(TagsState) _then) = _$TagsStateCopyWithImpl;
@useResult
$Res call({
 List<TMTaskTag> tags
});




}
/// @nodoc
class _$TagsStateCopyWithImpl<$Res>
    implements $TagsStateCopyWith<$Res> {
  _$TagsStateCopyWithImpl(this._self, this._then);

  final TagsState _self;
  final $Res Function(TagsState) _then;

/// Create a copy of TagsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tags = null,}) {
  return _then(_self.copyWith(
tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<TMTaskTag>,
  ));
}

}


/// Adds pattern-matching-related methods to [TagsState].
extension TagsStatePatterns on TagsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _IdleTagsState value)?  idle,TResult Function( _LoadingTagsState value)?  loading,TResult Function( _ErrorTagsState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdleTagsState() when idle != null:
return idle(_that);case _LoadingTagsState() when loading != null:
return loading(_that);case _ErrorTagsState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _IdleTagsState value)  idle,required TResult Function( _LoadingTagsState value)  loading,required TResult Function( _ErrorTagsState value)  error,}){
final _that = this;
switch (_that) {
case _IdleTagsState():
return idle(_that);case _LoadingTagsState():
return loading(_that);case _ErrorTagsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _IdleTagsState value)?  idle,TResult? Function( _LoadingTagsState value)?  loading,TResult? Function( _ErrorTagsState value)?  error,}){
final _that = this;
switch (_that) {
case _IdleTagsState() when idle != null:
return idle(_that);case _LoadingTagsState() when loading != null:
return loading(_that);case _ErrorTagsState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<TMTaskTag> tags)?  idle,TResult Function( List<TMTaskTag> tags)?  loading,TResult Function( String errorMessage,  List<TMTaskTag> tags)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdleTagsState() when idle != null:
return idle(_that.tags);case _LoadingTagsState() when loading != null:
return loading(_that.tags);case _ErrorTagsState() when error != null:
return error(_that.errorMessage,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<TMTaskTag> tags)  idle,required TResult Function( List<TMTaskTag> tags)  loading,required TResult Function( String errorMessage,  List<TMTaskTag> tags)  error,}) {final _that = this;
switch (_that) {
case _IdleTagsState():
return idle(_that.tags);case _LoadingTagsState():
return loading(_that.tags);case _ErrorTagsState():
return error(_that.errorMessage,_that.tags);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<TMTaskTag> tags)?  idle,TResult? Function( List<TMTaskTag> tags)?  loading,TResult? Function( String errorMessage,  List<TMTaskTag> tags)?  error,}) {final _that = this;
switch (_that) {
case _IdleTagsState() when idle != null:
return idle(_that.tags);case _LoadingTagsState() when loading != null:
return loading(_that.tags);case _ErrorTagsState() when error != null:
return error(_that.errorMessage,_that.tags);case _:
  return null;

}
}

}

/// @nodoc


class _IdleTagsState extends TagsState {
  const _IdleTagsState({required final  List<TMTaskTag> tags}): _tags = tags,super._();
  

 final  List<TMTaskTag> _tags;
@override List<TMTaskTag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of TagsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdleTagsStateCopyWith<_IdleTagsState> get copyWith => __$IdleTagsStateCopyWithImpl<_IdleTagsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdleTagsState&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'TagsState.idle(tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$IdleTagsStateCopyWith<$Res> implements $TagsStateCopyWith<$Res> {
  factory _$IdleTagsStateCopyWith(_IdleTagsState value, $Res Function(_IdleTagsState) _then) = __$IdleTagsStateCopyWithImpl;
@override @useResult
$Res call({
 List<TMTaskTag> tags
});




}
/// @nodoc
class __$IdleTagsStateCopyWithImpl<$Res>
    implements _$IdleTagsStateCopyWith<$Res> {
  __$IdleTagsStateCopyWithImpl(this._self, this._then);

  final _IdleTagsState _self;
  final $Res Function(_IdleTagsState) _then;

/// Create a copy of TagsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tags = null,}) {
  return _then(_IdleTagsState(
tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TMTaskTag>,
  ));
}


}

/// @nodoc


class _LoadingTagsState extends TagsState {
  const _LoadingTagsState({required final  List<TMTaskTag> tags}): _tags = tags,super._();
  

 final  List<TMTaskTag> _tags;
@override List<TMTaskTag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of TagsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingTagsStateCopyWith<_LoadingTagsState> get copyWith => __$LoadingTagsStateCopyWithImpl<_LoadingTagsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingTagsState&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'TagsState.loading(tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$LoadingTagsStateCopyWith<$Res> implements $TagsStateCopyWith<$Res> {
  factory _$LoadingTagsStateCopyWith(_LoadingTagsState value, $Res Function(_LoadingTagsState) _then) = __$LoadingTagsStateCopyWithImpl;
@override @useResult
$Res call({
 List<TMTaskTag> tags
});




}
/// @nodoc
class __$LoadingTagsStateCopyWithImpl<$Res>
    implements _$LoadingTagsStateCopyWith<$Res> {
  __$LoadingTagsStateCopyWithImpl(this._self, this._then);

  final _LoadingTagsState _self;
  final $Res Function(_LoadingTagsState) _then;

/// Create a copy of TagsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tags = null,}) {
  return _then(_LoadingTagsState(
tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TMTaskTag>,
  ));
}


}

/// @nodoc


class _ErrorTagsState extends TagsState {
  const _ErrorTagsState({required this.errorMessage, required final  List<TMTaskTag> tags}): _tags = tags,super._();
  

 final  String errorMessage;
 final  List<TMTaskTag> _tags;
@override List<TMTaskTag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of TagsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorTagsStateCopyWith<_ErrorTagsState> get copyWith => __$ErrorTagsStateCopyWithImpl<_ErrorTagsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorTagsState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'TagsState.error(errorMessage: $errorMessage, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$ErrorTagsStateCopyWith<$Res> implements $TagsStateCopyWith<$Res> {
  factory _$ErrorTagsStateCopyWith(_ErrorTagsState value, $Res Function(_ErrorTagsState) _then) = __$ErrorTagsStateCopyWithImpl;
@override @useResult
$Res call({
 String errorMessage, List<TMTaskTag> tags
});




}
/// @nodoc
class __$ErrorTagsStateCopyWithImpl<$Res>
    implements _$ErrorTagsStateCopyWith<$Res> {
  __$ErrorTagsStateCopyWithImpl(this._self, this._then);

  final _ErrorTagsState _self;
  final $Res Function(_ErrorTagsState) _then;

/// Create a copy of TagsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,Object? tags = null,}) {
  return _then(_ErrorTagsState(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TMTaskTag>,
  ));
}


}

// dart format on
