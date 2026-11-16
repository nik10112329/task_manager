// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectEvent()';
}


}

/// @nodoc
class $ProjectEventCopyWith<$Res>  {
$ProjectEventCopyWith(ProjectEvent _, $Res Function(ProjectEvent) __);
}


/// Adds pattern-matching-related methods to [ProjectEvent].
extension ProjectEventPatterns on ProjectEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitializeProjectEvent value)?  initialize,TResult Function( _AddTaskProjectEvent value)?  addTask,TResult Function( _FetchTasksProjectEvent value)?  fetchTasks,TResult Function( _FetchUsersProjectEvent value)?  fetchUsers,TResult Function( _UpdateProjectProjectEvent value)?  updateProject,TResult Function( _DeleteTaskProjectEvent value)?  deleteTask,TResult Function( _UpdateTaskProjectEvent value)?  updateTask,TResult Function( _AddTagProjectEvent value)?  addTag,TResult Function( _FetchTagsProjectEvent value)?  fetchTags,TResult Function( _FilterTasksProjectEvent value)?  filterTasks,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitializeProjectEvent() when initialize != null:
return initialize(_that);case _AddTaskProjectEvent() when addTask != null:
return addTask(_that);case _FetchTasksProjectEvent() when fetchTasks != null:
return fetchTasks(_that);case _FetchUsersProjectEvent() when fetchUsers != null:
return fetchUsers(_that);case _UpdateProjectProjectEvent() when updateProject != null:
return updateProject(_that);case _DeleteTaskProjectEvent() when deleteTask != null:
return deleteTask(_that);case _UpdateTaskProjectEvent() when updateTask != null:
return updateTask(_that);case _AddTagProjectEvent() when addTag != null:
return addTag(_that);case _FetchTagsProjectEvent() when fetchTags != null:
return fetchTags(_that);case _FilterTasksProjectEvent() when filterTasks != null:
return filterTasks(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitializeProjectEvent value)  initialize,required TResult Function( _AddTaskProjectEvent value)  addTask,required TResult Function( _FetchTasksProjectEvent value)  fetchTasks,required TResult Function( _FetchUsersProjectEvent value)  fetchUsers,required TResult Function( _UpdateProjectProjectEvent value)  updateProject,required TResult Function( _DeleteTaskProjectEvent value)  deleteTask,required TResult Function( _UpdateTaskProjectEvent value)  updateTask,required TResult Function( _AddTagProjectEvent value)  addTag,required TResult Function( _FetchTagsProjectEvent value)  fetchTags,required TResult Function( _FilterTasksProjectEvent value)  filterTasks,}){
final _that = this;
switch (_that) {
case _InitializeProjectEvent():
return initialize(_that);case _AddTaskProjectEvent():
return addTask(_that);case _FetchTasksProjectEvent():
return fetchTasks(_that);case _FetchUsersProjectEvent():
return fetchUsers(_that);case _UpdateProjectProjectEvent():
return updateProject(_that);case _DeleteTaskProjectEvent():
return deleteTask(_that);case _UpdateTaskProjectEvent():
return updateTask(_that);case _AddTagProjectEvent():
return addTag(_that);case _FetchTagsProjectEvent():
return fetchTags(_that);case _FilterTasksProjectEvent():
return filterTasks(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitializeProjectEvent value)?  initialize,TResult? Function( _AddTaskProjectEvent value)?  addTask,TResult? Function( _FetchTasksProjectEvent value)?  fetchTasks,TResult? Function( _FetchUsersProjectEvent value)?  fetchUsers,TResult? Function( _UpdateProjectProjectEvent value)?  updateProject,TResult? Function( _DeleteTaskProjectEvent value)?  deleteTask,TResult? Function( _UpdateTaskProjectEvent value)?  updateTask,TResult? Function( _AddTagProjectEvent value)?  addTag,TResult? Function( _FetchTagsProjectEvent value)?  fetchTags,TResult? Function( _FilterTasksProjectEvent value)?  filterTasks,}){
final _that = this;
switch (_that) {
case _InitializeProjectEvent() when initialize != null:
return initialize(_that);case _AddTaskProjectEvent() when addTask != null:
return addTask(_that);case _FetchTasksProjectEvent() when fetchTasks != null:
return fetchTasks(_that);case _FetchUsersProjectEvent() when fetchUsers != null:
return fetchUsers(_that);case _UpdateProjectProjectEvent() when updateProject != null:
return updateProject(_that);case _DeleteTaskProjectEvent() when deleteTask != null:
return deleteTask(_that);case _UpdateTaskProjectEvent() when updateTask != null:
return updateTask(_that);case _AddTagProjectEvent() when addTag != null:
return addTag(_that);case _FetchTagsProjectEvent() when fetchTags != null:
return fetchTags(_that);case _FilterTasksProjectEvent() when filterTasks != null:
return filterTasks(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TMProject project)?  initialize,TResult Function( String projectId,  TMTask task)?  addTask,TResult Function()?  fetchTasks,TResult Function()?  fetchUsers,TResult Function( TMProject project)?  updateProject,TResult Function( TMTask task)?  deleteTask,TResult Function( TMTask task)?  updateTask,TResult Function( TMTaskTag tag)?  addTag,TResult Function( List<String> tagsIds)?  fetchTags,TResult Function( List<TMUser> users,  List<TMTaskTag> tags,  List<TaskStatus> statuses,  DateTime? deadline)?  filterTasks,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitializeProjectEvent() when initialize != null:
return initialize(_that.project);case _AddTaskProjectEvent() when addTask != null:
return addTask(_that.projectId,_that.task);case _FetchTasksProjectEvent() when fetchTasks != null:
return fetchTasks();case _FetchUsersProjectEvent() when fetchUsers != null:
return fetchUsers();case _UpdateProjectProjectEvent() when updateProject != null:
return updateProject(_that.project);case _DeleteTaskProjectEvent() when deleteTask != null:
return deleteTask(_that.task);case _UpdateTaskProjectEvent() when updateTask != null:
return updateTask(_that.task);case _AddTagProjectEvent() when addTag != null:
return addTag(_that.tag);case _FetchTagsProjectEvent() when fetchTags != null:
return fetchTags(_that.tagsIds);case _FilterTasksProjectEvent() when filterTasks != null:
return filterTasks(_that.users,_that.tags,_that.statuses,_that.deadline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TMProject project)  initialize,required TResult Function( String projectId,  TMTask task)  addTask,required TResult Function()  fetchTasks,required TResult Function()  fetchUsers,required TResult Function( TMProject project)  updateProject,required TResult Function( TMTask task)  deleteTask,required TResult Function( TMTask task)  updateTask,required TResult Function( TMTaskTag tag)  addTag,required TResult Function( List<String> tagsIds)  fetchTags,required TResult Function( List<TMUser> users,  List<TMTaskTag> tags,  List<TaskStatus> statuses,  DateTime? deadline)  filterTasks,}) {final _that = this;
switch (_that) {
case _InitializeProjectEvent():
return initialize(_that.project);case _AddTaskProjectEvent():
return addTask(_that.projectId,_that.task);case _FetchTasksProjectEvent():
return fetchTasks();case _FetchUsersProjectEvent():
return fetchUsers();case _UpdateProjectProjectEvent():
return updateProject(_that.project);case _DeleteTaskProjectEvent():
return deleteTask(_that.task);case _UpdateTaskProjectEvent():
return updateTask(_that.task);case _AddTagProjectEvent():
return addTag(_that.tag);case _FetchTagsProjectEvent():
return fetchTags(_that.tagsIds);case _FilterTasksProjectEvent():
return filterTasks(_that.users,_that.tags,_that.statuses,_that.deadline);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TMProject project)?  initialize,TResult? Function( String projectId,  TMTask task)?  addTask,TResult? Function()?  fetchTasks,TResult? Function()?  fetchUsers,TResult? Function( TMProject project)?  updateProject,TResult? Function( TMTask task)?  deleteTask,TResult? Function( TMTask task)?  updateTask,TResult? Function( TMTaskTag tag)?  addTag,TResult? Function( List<String> tagsIds)?  fetchTags,TResult? Function( List<TMUser> users,  List<TMTaskTag> tags,  List<TaskStatus> statuses,  DateTime? deadline)?  filterTasks,}) {final _that = this;
switch (_that) {
case _InitializeProjectEvent() when initialize != null:
return initialize(_that.project);case _AddTaskProjectEvent() when addTask != null:
return addTask(_that.projectId,_that.task);case _FetchTasksProjectEvent() when fetchTasks != null:
return fetchTasks();case _FetchUsersProjectEvent() when fetchUsers != null:
return fetchUsers();case _UpdateProjectProjectEvent() when updateProject != null:
return updateProject(_that.project);case _DeleteTaskProjectEvent() when deleteTask != null:
return deleteTask(_that.task);case _UpdateTaskProjectEvent() when updateTask != null:
return updateTask(_that.task);case _AddTagProjectEvent() when addTag != null:
return addTag(_that.tag);case _FetchTagsProjectEvent() when fetchTags != null:
return fetchTags(_that.tagsIds);case _FilterTasksProjectEvent() when filterTasks != null:
return filterTasks(_that.users,_that.tags,_that.statuses,_that.deadline);case _:
  return null;

}
}

}

/// @nodoc


class _InitializeProjectEvent extends ProjectEvent {
  const _InitializeProjectEvent(this.project): super._();
  

 final  TMProject project;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitializeProjectEventCopyWith<_InitializeProjectEvent> get copyWith => __$InitializeProjectEventCopyWithImpl<_InitializeProjectEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitializeProjectEvent&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString() {
  return 'ProjectEvent.initialize(project: $project)';
}


}

/// @nodoc
abstract mixin class _$InitializeProjectEventCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory _$InitializeProjectEventCopyWith(_InitializeProjectEvent value, $Res Function(_InitializeProjectEvent) _then) = __$InitializeProjectEventCopyWithImpl;
@useResult
$Res call({
 TMProject project
});


$TMProjectCopyWith<$Res> get project;

}
/// @nodoc
class __$InitializeProjectEventCopyWithImpl<$Res>
    implements _$InitializeProjectEventCopyWith<$Res> {
  __$InitializeProjectEventCopyWithImpl(this._self, this._then);

  final _InitializeProjectEvent _self;
  final $Res Function(_InitializeProjectEvent) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(_InitializeProjectEvent(
null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as TMProject,
  ));
}

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMProjectCopyWith<$Res> get project {
  
  return $TMProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

/// @nodoc


class _AddTaskProjectEvent extends ProjectEvent {
  const _AddTaskProjectEvent({required this.projectId, required this.task}): super._();
  

 final  String projectId;
 final  TMTask task;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddTaskProjectEventCopyWith<_AddTaskProjectEvent> get copyWith => __$AddTaskProjectEventCopyWithImpl<_AddTaskProjectEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTaskProjectEvent&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,task);

@override
String toString() {
  return 'ProjectEvent.addTask(projectId: $projectId, task: $task)';
}


}

/// @nodoc
abstract mixin class _$AddTaskProjectEventCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory _$AddTaskProjectEventCopyWith(_AddTaskProjectEvent value, $Res Function(_AddTaskProjectEvent) _then) = __$AddTaskProjectEventCopyWithImpl;
@useResult
$Res call({
 String projectId, TMTask task
});


$TMTaskCopyWith<$Res> get task;

}
/// @nodoc
class __$AddTaskProjectEventCopyWithImpl<$Res>
    implements _$AddTaskProjectEventCopyWith<$Res> {
  __$AddTaskProjectEventCopyWithImpl(this._self, this._then);

  final _AddTaskProjectEvent _self;
  final $Res Function(_AddTaskProjectEvent) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? task = null,}) {
  return _then(_AddTaskProjectEvent(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TMTask,
  ));
}

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMTaskCopyWith<$Res> get task {
  
  return $TMTaskCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}

/// @nodoc


class _FetchTasksProjectEvent extends ProjectEvent {
  const _FetchTasksProjectEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchTasksProjectEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectEvent.fetchTasks()';
}


}




/// @nodoc


class _FetchUsersProjectEvent extends ProjectEvent {
  const _FetchUsersProjectEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchUsersProjectEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectEvent.fetchUsers()';
}


}




/// @nodoc


class _UpdateProjectProjectEvent extends ProjectEvent {
  const _UpdateProjectProjectEvent({required this.project}): super._();
  

 final  TMProject project;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProjectProjectEventCopyWith<_UpdateProjectProjectEvent> get copyWith => __$UpdateProjectProjectEventCopyWithImpl<_UpdateProjectProjectEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProjectProjectEvent&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString() {
  return 'ProjectEvent.updateProject(project: $project)';
}


}

/// @nodoc
abstract mixin class _$UpdateProjectProjectEventCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory _$UpdateProjectProjectEventCopyWith(_UpdateProjectProjectEvent value, $Res Function(_UpdateProjectProjectEvent) _then) = __$UpdateProjectProjectEventCopyWithImpl;
@useResult
$Res call({
 TMProject project
});


$TMProjectCopyWith<$Res> get project;

}
/// @nodoc
class __$UpdateProjectProjectEventCopyWithImpl<$Res>
    implements _$UpdateProjectProjectEventCopyWith<$Res> {
  __$UpdateProjectProjectEventCopyWithImpl(this._self, this._then);

  final _UpdateProjectProjectEvent _self;
  final $Res Function(_UpdateProjectProjectEvent) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(_UpdateProjectProjectEvent(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as TMProject,
  ));
}

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMProjectCopyWith<$Res> get project {
  
  return $TMProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

/// @nodoc


class _DeleteTaskProjectEvent extends ProjectEvent {
  const _DeleteTaskProjectEvent({required this.task}): super._();
  

 final  TMTask task;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteTaskProjectEventCopyWith<_DeleteTaskProjectEvent> get copyWith => __$DeleteTaskProjectEventCopyWithImpl<_DeleteTaskProjectEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteTaskProjectEvent&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'ProjectEvent.deleteTask(task: $task)';
}


}

/// @nodoc
abstract mixin class _$DeleteTaskProjectEventCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory _$DeleteTaskProjectEventCopyWith(_DeleteTaskProjectEvent value, $Res Function(_DeleteTaskProjectEvent) _then) = __$DeleteTaskProjectEventCopyWithImpl;
@useResult
$Res call({
 TMTask task
});


$TMTaskCopyWith<$Res> get task;

}
/// @nodoc
class __$DeleteTaskProjectEventCopyWithImpl<$Res>
    implements _$DeleteTaskProjectEventCopyWith<$Res> {
  __$DeleteTaskProjectEventCopyWithImpl(this._self, this._then);

  final _DeleteTaskProjectEvent _self;
  final $Res Function(_DeleteTaskProjectEvent) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = null,}) {
  return _then(_DeleteTaskProjectEvent(
task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TMTask,
  ));
}

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMTaskCopyWith<$Res> get task {
  
  return $TMTaskCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}

/// @nodoc


class _UpdateTaskProjectEvent extends ProjectEvent {
  const _UpdateTaskProjectEvent({required this.task}): super._();
  

 final  TMTask task;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTaskProjectEventCopyWith<_UpdateTaskProjectEvent> get copyWith => __$UpdateTaskProjectEventCopyWithImpl<_UpdateTaskProjectEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTaskProjectEvent&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'ProjectEvent.updateTask(task: $task)';
}


}

/// @nodoc
abstract mixin class _$UpdateTaskProjectEventCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory _$UpdateTaskProjectEventCopyWith(_UpdateTaskProjectEvent value, $Res Function(_UpdateTaskProjectEvent) _then) = __$UpdateTaskProjectEventCopyWithImpl;
@useResult
$Res call({
 TMTask task
});


$TMTaskCopyWith<$Res> get task;

}
/// @nodoc
class __$UpdateTaskProjectEventCopyWithImpl<$Res>
    implements _$UpdateTaskProjectEventCopyWith<$Res> {
  __$UpdateTaskProjectEventCopyWithImpl(this._self, this._then);

  final _UpdateTaskProjectEvent _self;
  final $Res Function(_UpdateTaskProjectEvent) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = null,}) {
  return _then(_UpdateTaskProjectEvent(
task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TMTask,
  ));
}

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMTaskCopyWith<$Res> get task {
  
  return $TMTaskCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}

/// @nodoc


class _AddTagProjectEvent extends ProjectEvent {
  const _AddTagProjectEvent({required this.tag}): super._();
  

 final  TMTaskTag tag;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddTagProjectEventCopyWith<_AddTagProjectEvent> get copyWith => __$AddTagProjectEventCopyWithImpl<_AddTagProjectEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTagProjectEvent&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,tag);

@override
String toString() {
  return 'ProjectEvent.addTag(tag: $tag)';
}


}

/// @nodoc
abstract mixin class _$AddTagProjectEventCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory _$AddTagProjectEventCopyWith(_AddTagProjectEvent value, $Res Function(_AddTagProjectEvent) _then) = __$AddTagProjectEventCopyWithImpl;
@useResult
$Res call({
 TMTaskTag tag
});


$TMTaskTagCopyWith<$Res> get tag;

}
/// @nodoc
class __$AddTagProjectEventCopyWithImpl<$Res>
    implements _$AddTagProjectEventCopyWith<$Res> {
  __$AddTagProjectEventCopyWithImpl(this._self, this._then);

  final _AddTagProjectEvent _self;
  final $Res Function(_AddTagProjectEvent) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tag = null,}) {
  return _then(_AddTagProjectEvent(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as TMTaskTag,
  ));
}

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMTaskTagCopyWith<$Res> get tag {
  
  return $TMTaskTagCopyWith<$Res>(_self.tag, (value) {
    return _then(_self.copyWith(tag: value));
  });
}
}

/// @nodoc


class _FetchTagsProjectEvent extends ProjectEvent {
  const _FetchTagsProjectEvent({required final  List<String> tagsIds}): _tagsIds = tagsIds,super._();
  

 final  List<String> _tagsIds;
 List<String> get tagsIds {
  if (_tagsIds is EqualUnmodifiableListView) return _tagsIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tagsIds);
}


/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchTagsProjectEventCopyWith<_FetchTagsProjectEvent> get copyWith => __$FetchTagsProjectEventCopyWithImpl<_FetchTagsProjectEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchTagsProjectEvent&&const DeepCollectionEquality().equals(other._tagsIds, _tagsIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tagsIds));

@override
String toString() {
  return 'ProjectEvent.fetchTags(tagsIds: $tagsIds)';
}


}

/// @nodoc
abstract mixin class _$FetchTagsProjectEventCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory _$FetchTagsProjectEventCopyWith(_FetchTagsProjectEvent value, $Res Function(_FetchTagsProjectEvent) _then) = __$FetchTagsProjectEventCopyWithImpl;
@useResult
$Res call({
 List<String> tagsIds
});




}
/// @nodoc
class __$FetchTagsProjectEventCopyWithImpl<$Res>
    implements _$FetchTagsProjectEventCopyWith<$Res> {
  __$FetchTagsProjectEventCopyWithImpl(this._self, this._then);

  final _FetchTagsProjectEvent _self;
  final $Res Function(_FetchTagsProjectEvent) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tagsIds = null,}) {
  return _then(_FetchTagsProjectEvent(
tagsIds: null == tagsIds ? _self._tagsIds : tagsIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class _FilterTasksProjectEvent extends ProjectEvent {
  const _FilterTasksProjectEvent({required final  List<TMUser> users, required final  List<TMTaskTag> tags, required final  List<TaskStatus> statuses, this.deadline}): _users = users,_tags = tags,_statuses = statuses,super._();
  

 final  List<TMUser> _users;
 List<TMUser> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

 final  List<TMTaskTag> _tags;
 List<TMTaskTag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<TaskStatus> _statuses;
 List<TaskStatus> get statuses {
  if (_statuses is EqualUnmodifiableListView) return _statuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_statuses);
}

 final  DateTime? deadline;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterTasksProjectEventCopyWith<_FilterTasksProjectEvent> get copyWith => __$FilterTasksProjectEventCopyWithImpl<_FilterTasksProjectEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterTasksProjectEvent&&const DeepCollectionEquality().equals(other._users, _users)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._statuses, _statuses)&&(identical(other.deadline, deadline) || other.deadline == deadline));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_statuses),deadline);

@override
String toString() {
  return 'ProjectEvent.filterTasks(users: $users, tags: $tags, statuses: $statuses, deadline: $deadline)';
}


}

/// @nodoc
abstract mixin class _$FilterTasksProjectEventCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory _$FilterTasksProjectEventCopyWith(_FilterTasksProjectEvent value, $Res Function(_FilterTasksProjectEvent) _then) = __$FilterTasksProjectEventCopyWithImpl;
@useResult
$Res call({
 List<TMUser> users, List<TMTaskTag> tags, List<TaskStatus> statuses, DateTime? deadline
});




}
/// @nodoc
class __$FilterTasksProjectEventCopyWithImpl<$Res>
    implements _$FilterTasksProjectEventCopyWith<$Res> {
  __$FilterTasksProjectEventCopyWithImpl(this._self, this._then);

  final _FilterTasksProjectEvent _self;
  final $Res Function(_FilterTasksProjectEvent) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,Object? tags = null,Object? statuses = null,Object? deadline = freezed,}) {
  return _then(_FilterTasksProjectEvent(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<TMUser>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TMTaskTag>,statuses: null == statuses ? _self._statuses : statuses // ignore: cast_nullable_to_non_nullable
as List<TaskStatus>,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$ProjectSideEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectSideEffect()';
}


}

/// @nodoc
class $ProjectSideEffectCopyWith<$Res>  {
$ProjectSideEffectCopyWith(ProjectSideEffect _, $Res Function(ProjectSideEffect) __);
}


/// Adds pattern-matching-related methods to [ProjectSideEffect].
extension ProjectSideEffectPatterns on ProjectSideEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TaskAddedProjectSideEffect value)?  taskAdded,TResult Function( _ProjectFetchedProjectSideEffect value)?  projectFetched,TResult Function( _TasksFetchedProjectSideEffect value)?  tasksFetched,TResult Function( _ProjectUsersFetchedProjectSideEffect value)?  projectUsersFetched,TResult Function( _ProjectUpdatedProjectSideEffect value)?  projectUpdated,TResult Function( _TaskUpdatedProjectSideEffect value)?  taskUpdated,TResult Function( _TaskDeletedProjectSideEffect value)?  taskDeleted,TResult Function( _TagAddedProjectSideEffect value)?  tagAdded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskAddedProjectSideEffect() when taskAdded != null:
return taskAdded(_that);case _ProjectFetchedProjectSideEffect() when projectFetched != null:
return projectFetched(_that);case _TasksFetchedProjectSideEffect() when tasksFetched != null:
return tasksFetched(_that);case _ProjectUsersFetchedProjectSideEffect() when projectUsersFetched != null:
return projectUsersFetched(_that);case _ProjectUpdatedProjectSideEffect() when projectUpdated != null:
return projectUpdated(_that);case _TaskUpdatedProjectSideEffect() when taskUpdated != null:
return taskUpdated(_that);case _TaskDeletedProjectSideEffect() when taskDeleted != null:
return taskDeleted(_that);case _TagAddedProjectSideEffect() when tagAdded != null:
return tagAdded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TaskAddedProjectSideEffect value)  taskAdded,required TResult Function( _ProjectFetchedProjectSideEffect value)  projectFetched,required TResult Function( _TasksFetchedProjectSideEffect value)  tasksFetched,required TResult Function( _ProjectUsersFetchedProjectSideEffect value)  projectUsersFetched,required TResult Function( _ProjectUpdatedProjectSideEffect value)  projectUpdated,required TResult Function( _TaskUpdatedProjectSideEffect value)  taskUpdated,required TResult Function( _TaskDeletedProjectSideEffect value)  taskDeleted,required TResult Function( _TagAddedProjectSideEffect value)  tagAdded,}){
final _that = this;
switch (_that) {
case _TaskAddedProjectSideEffect():
return taskAdded(_that);case _ProjectFetchedProjectSideEffect():
return projectFetched(_that);case _TasksFetchedProjectSideEffect():
return tasksFetched(_that);case _ProjectUsersFetchedProjectSideEffect():
return projectUsersFetched(_that);case _ProjectUpdatedProjectSideEffect():
return projectUpdated(_that);case _TaskUpdatedProjectSideEffect():
return taskUpdated(_that);case _TaskDeletedProjectSideEffect():
return taskDeleted(_that);case _TagAddedProjectSideEffect():
return tagAdded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TaskAddedProjectSideEffect value)?  taskAdded,TResult? Function( _ProjectFetchedProjectSideEffect value)?  projectFetched,TResult? Function( _TasksFetchedProjectSideEffect value)?  tasksFetched,TResult? Function( _ProjectUsersFetchedProjectSideEffect value)?  projectUsersFetched,TResult? Function( _ProjectUpdatedProjectSideEffect value)?  projectUpdated,TResult? Function( _TaskUpdatedProjectSideEffect value)?  taskUpdated,TResult? Function( _TaskDeletedProjectSideEffect value)?  taskDeleted,TResult? Function( _TagAddedProjectSideEffect value)?  tagAdded,}){
final _that = this;
switch (_that) {
case _TaskAddedProjectSideEffect() when taskAdded != null:
return taskAdded(_that);case _ProjectFetchedProjectSideEffect() when projectFetched != null:
return projectFetched(_that);case _TasksFetchedProjectSideEffect() when tasksFetched != null:
return tasksFetched(_that);case _ProjectUsersFetchedProjectSideEffect() when projectUsersFetched != null:
return projectUsersFetched(_that);case _ProjectUpdatedProjectSideEffect() when projectUpdated != null:
return projectUpdated(_that);case _TaskUpdatedProjectSideEffect() when taskUpdated != null:
return taskUpdated(_that);case _TaskDeletedProjectSideEffect() when taskDeleted != null:
return taskDeleted(_that);case _TagAddedProjectSideEffect() when tagAdded != null:
return tagAdded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  taskAdded,TResult Function()?  projectFetched,TResult Function()?  tasksFetched,TResult Function( List<TMUser> projectUsers)?  projectUsersFetched,TResult Function()?  projectUpdated,TResult Function()?  taskUpdated,TResult Function()?  taskDeleted,TResult Function()?  tagAdded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskAddedProjectSideEffect() when taskAdded != null:
return taskAdded();case _ProjectFetchedProjectSideEffect() when projectFetched != null:
return projectFetched();case _TasksFetchedProjectSideEffect() when tasksFetched != null:
return tasksFetched();case _ProjectUsersFetchedProjectSideEffect() when projectUsersFetched != null:
return projectUsersFetched(_that.projectUsers);case _ProjectUpdatedProjectSideEffect() when projectUpdated != null:
return projectUpdated();case _TaskUpdatedProjectSideEffect() when taskUpdated != null:
return taskUpdated();case _TaskDeletedProjectSideEffect() when taskDeleted != null:
return taskDeleted();case _TagAddedProjectSideEffect() when tagAdded != null:
return tagAdded();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  taskAdded,required TResult Function()  projectFetched,required TResult Function()  tasksFetched,required TResult Function( List<TMUser> projectUsers)  projectUsersFetched,required TResult Function()  projectUpdated,required TResult Function()  taskUpdated,required TResult Function()  taskDeleted,required TResult Function()  tagAdded,}) {final _that = this;
switch (_that) {
case _TaskAddedProjectSideEffect():
return taskAdded();case _ProjectFetchedProjectSideEffect():
return projectFetched();case _TasksFetchedProjectSideEffect():
return tasksFetched();case _ProjectUsersFetchedProjectSideEffect():
return projectUsersFetched(_that.projectUsers);case _ProjectUpdatedProjectSideEffect():
return projectUpdated();case _TaskUpdatedProjectSideEffect():
return taskUpdated();case _TaskDeletedProjectSideEffect():
return taskDeleted();case _TagAddedProjectSideEffect():
return tagAdded();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  taskAdded,TResult? Function()?  projectFetched,TResult? Function()?  tasksFetched,TResult? Function( List<TMUser> projectUsers)?  projectUsersFetched,TResult? Function()?  projectUpdated,TResult? Function()?  taskUpdated,TResult? Function()?  taskDeleted,TResult? Function()?  tagAdded,}) {final _that = this;
switch (_that) {
case _TaskAddedProjectSideEffect() when taskAdded != null:
return taskAdded();case _ProjectFetchedProjectSideEffect() when projectFetched != null:
return projectFetched();case _TasksFetchedProjectSideEffect() when tasksFetched != null:
return tasksFetched();case _ProjectUsersFetchedProjectSideEffect() when projectUsersFetched != null:
return projectUsersFetched(_that.projectUsers);case _ProjectUpdatedProjectSideEffect() when projectUpdated != null:
return projectUpdated();case _TaskUpdatedProjectSideEffect() when taskUpdated != null:
return taskUpdated();case _TaskDeletedProjectSideEffect() when taskDeleted != null:
return taskDeleted();case _TagAddedProjectSideEffect() when tagAdded != null:
return tagAdded();case _:
  return null;

}
}

}

/// @nodoc


class _TaskAddedProjectSideEffect extends ProjectSideEffect {
  const _TaskAddedProjectSideEffect(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskAddedProjectSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectSideEffect.taskAdded()';
}


}




/// @nodoc


class _ProjectFetchedProjectSideEffect extends ProjectSideEffect {
  const _ProjectFetchedProjectSideEffect(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectFetchedProjectSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectSideEffect.projectFetched()';
}


}




/// @nodoc


class _TasksFetchedProjectSideEffect extends ProjectSideEffect {
  const _TasksFetchedProjectSideEffect(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasksFetchedProjectSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectSideEffect.tasksFetched()';
}


}




/// @nodoc


class _ProjectUsersFetchedProjectSideEffect extends ProjectSideEffect {
  const _ProjectUsersFetchedProjectSideEffect({required final  List<TMUser> projectUsers}): _projectUsers = projectUsers,super._();
  

 final  List<TMUser> _projectUsers;
 List<TMUser> get projectUsers {
  if (_projectUsers is EqualUnmodifiableListView) return _projectUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projectUsers);
}


/// Create a copy of ProjectSideEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectUsersFetchedProjectSideEffectCopyWith<_ProjectUsersFetchedProjectSideEffect> get copyWith => __$ProjectUsersFetchedProjectSideEffectCopyWithImpl<_ProjectUsersFetchedProjectSideEffect>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectUsersFetchedProjectSideEffect&&const DeepCollectionEquality().equals(other._projectUsers, _projectUsers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projectUsers));

@override
String toString() {
  return 'ProjectSideEffect.projectUsersFetched(projectUsers: $projectUsers)';
}


}

/// @nodoc
abstract mixin class _$ProjectUsersFetchedProjectSideEffectCopyWith<$Res> implements $ProjectSideEffectCopyWith<$Res> {
  factory _$ProjectUsersFetchedProjectSideEffectCopyWith(_ProjectUsersFetchedProjectSideEffect value, $Res Function(_ProjectUsersFetchedProjectSideEffect) _then) = __$ProjectUsersFetchedProjectSideEffectCopyWithImpl;
@useResult
$Res call({
 List<TMUser> projectUsers
});




}
/// @nodoc
class __$ProjectUsersFetchedProjectSideEffectCopyWithImpl<$Res>
    implements _$ProjectUsersFetchedProjectSideEffectCopyWith<$Res> {
  __$ProjectUsersFetchedProjectSideEffectCopyWithImpl(this._self, this._then);

  final _ProjectUsersFetchedProjectSideEffect _self;
  final $Res Function(_ProjectUsersFetchedProjectSideEffect) _then;

/// Create a copy of ProjectSideEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectUsers = null,}) {
  return _then(_ProjectUsersFetchedProjectSideEffect(
projectUsers: null == projectUsers ? _self._projectUsers : projectUsers // ignore: cast_nullable_to_non_nullable
as List<TMUser>,
  ));
}


}

/// @nodoc


class _ProjectUpdatedProjectSideEffect extends ProjectSideEffect {
  const _ProjectUpdatedProjectSideEffect(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectUpdatedProjectSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectSideEffect.projectUpdated()';
}


}




/// @nodoc


class _TaskUpdatedProjectSideEffect extends ProjectSideEffect {
  const _TaskUpdatedProjectSideEffect(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskUpdatedProjectSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectSideEffect.taskUpdated()';
}


}




/// @nodoc


class _TaskDeletedProjectSideEffect extends ProjectSideEffect {
  const _TaskDeletedProjectSideEffect(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskDeletedProjectSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectSideEffect.taskDeleted()';
}


}




/// @nodoc


class _TagAddedProjectSideEffect extends ProjectSideEffect {
  const _TagAddedProjectSideEffect(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagAddedProjectSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectSideEffect.tagAdded()';
}


}




/// @nodoc
mixin _$ProjectState {

 TMProject get project; List<TMTask>? get tasks; List<TMTask>? get filteredTasks; List<TMUser>? get users; List<TMTaskTag>? get tags; List<String>? get taskTypes;
/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectStateCopyWith<ProjectState> get copyWith => _$ProjectStateCopyWithImpl<ProjectState>(this as ProjectState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectState&&(identical(other.project, project) || other.project == project)&&const DeepCollectionEquality().equals(other.tasks, tasks)&&const DeepCollectionEquality().equals(other.filteredTasks, filteredTasks)&&const DeepCollectionEquality().equals(other.users, users)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.taskTypes, taskTypes));
}


@override
int get hashCode => Object.hash(runtimeType,project,const DeepCollectionEquality().hash(tasks),const DeepCollectionEquality().hash(filteredTasks),const DeepCollectionEquality().hash(users),const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(taskTypes));

@override
String toString() {
  return 'ProjectState(project: $project, tasks: $tasks, filteredTasks: $filteredTasks, users: $users, tags: $tags, taskTypes: $taskTypes)';
}


}

/// @nodoc
abstract mixin class $ProjectStateCopyWith<$Res>  {
  factory $ProjectStateCopyWith(ProjectState value, $Res Function(ProjectState) _then) = _$ProjectStateCopyWithImpl;
@useResult
$Res call({
 TMProject project, List<TMTask>? tasks, List<TMTask>? filteredTasks, List<TMUser>? users, List<TMTaskTag>? tags, List<String>? taskTypes
});


$TMProjectCopyWith<$Res> get project;

}
/// @nodoc
class _$ProjectStateCopyWithImpl<$Res>
    implements $ProjectStateCopyWith<$Res> {
  _$ProjectStateCopyWithImpl(this._self, this._then);

  final ProjectState _self;
  final $Res Function(ProjectState) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? project = null,Object? tasks = freezed,Object? filteredTasks = freezed,Object? users = freezed,Object? tags = freezed,Object? taskTypes = freezed,}) {
  return _then(_self.copyWith(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as TMProject,tasks: freezed == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,filteredTasks: freezed == filteredTasks ? _self.filteredTasks : filteredTasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,users: freezed == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<TMUser>?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<TMTaskTag>?,taskTypes: freezed == taskTypes ? _self.taskTypes : taskTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMProjectCopyWith<$Res> get project {
  
  return $TMProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectState].
extension ProjectStatePatterns on ProjectState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _IdleProjectsState value)?  idle,TResult Function( _LoadingProjectsState value)?  loading,TResult Function( _LoadingProjectsProjectsState value)?  loadingProjects,TResult Function( _ErrorProjectsState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdleProjectsState() when idle != null:
return idle(_that);case _LoadingProjectsState() when loading != null:
return loading(_that);case _LoadingProjectsProjectsState() when loadingProjects != null:
return loadingProjects(_that);case _ErrorProjectsState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _IdleProjectsState value)  idle,required TResult Function( _LoadingProjectsState value)  loading,required TResult Function( _LoadingProjectsProjectsState value)  loadingProjects,required TResult Function( _ErrorProjectsState value)  error,}){
final _that = this;
switch (_that) {
case _IdleProjectsState():
return idle(_that);case _LoadingProjectsState():
return loading(_that);case _LoadingProjectsProjectsState():
return loadingProjects(_that);case _ErrorProjectsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _IdleProjectsState value)?  idle,TResult? Function( _LoadingProjectsState value)?  loading,TResult? Function( _LoadingProjectsProjectsState value)?  loadingProjects,TResult? Function( _ErrorProjectsState value)?  error,}){
final _that = this;
switch (_that) {
case _IdleProjectsState() when idle != null:
return idle(_that);case _LoadingProjectsState() when loading != null:
return loading(_that);case _LoadingProjectsProjectsState() when loadingProjects != null:
return loadingProjects(_that);case _ErrorProjectsState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TMProject project,  List<TMTask>? tasks,  List<TMTask>? filteredTasks,  List<TMUser>? users,  List<TMTaskTag>? tags,  List<String>? taskTypes)?  idle,TResult Function( TMProject project,  List<TMTask>? tasks,  List<TMTask>? filteredTasks,  List<TMUser>? users,  List<TMTaskTag>? tags,  List<String>? taskTypes)?  loading,TResult Function( TMProject project,  List<TMTask>? tasks,  List<TMTask>? filteredTasks,  List<TMUser>? users,  List<TMTaskTag>? tags,  List<String>? taskTypes)?  loadingProjects,TResult Function( String errorMessage,  TMProject project,  List<TMTask>? tasks,  List<TMTask>? filteredTasks,  List<TMUser>? users,  List<TMTaskTag>? tags,  List<String>? taskTypes)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdleProjectsState() when idle != null:
return idle(_that.project,_that.tasks,_that.filteredTasks,_that.users,_that.tags,_that.taskTypes);case _LoadingProjectsState() when loading != null:
return loading(_that.project,_that.tasks,_that.filteredTasks,_that.users,_that.tags,_that.taskTypes);case _LoadingProjectsProjectsState() when loadingProjects != null:
return loadingProjects(_that.project,_that.tasks,_that.filteredTasks,_that.users,_that.tags,_that.taskTypes);case _ErrorProjectsState() when error != null:
return error(_that.errorMessage,_that.project,_that.tasks,_that.filteredTasks,_that.users,_that.tags,_that.taskTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TMProject project,  List<TMTask>? tasks,  List<TMTask>? filteredTasks,  List<TMUser>? users,  List<TMTaskTag>? tags,  List<String>? taskTypes)  idle,required TResult Function( TMProject project,  List<TMTask>? tasks,  List<TMTask>? filteredTasks,  List<TMUser>? users,  List<TMTaskTag>? tags,  List<String>? taskTypes)  loading,required TResult Function( TMProject project,  List<TMTask>? tasks,  List<TMTask>? filteredTasks,  List<TMUser>? users,  List<TMTaskTag>? tags,  List<String>? taskTypes)  loadingProjects,required TResult Function( String errorMessage,  TMProject project,  List<TMTask>? tasks,  List<TMTask>? filteredTasks,  List<TMUser>? users,  List<TMTaskTag>? tags,  List<String>? taskTypes)  error,}) {final _that = this;
switch (_that) {
case _IdleProjectsState():
return idle(_that.project,_that.tasks,_that.filteredTasks,_that.users,_that.tags,_that.taskTypes);case _LoadingProjectsState():
return loading(_that.project,_that.tasks,_that.filteredTasks,_that.users,_that.tags,_that.taskTypes);case _LoadingProjectsProjectsState():
return loadingProjects(_that.project,_that.tasks,_that.filteredTasks,_that.users,_that.tags,_that.taskTypes);case _ErrorProjectsState():
return error(_that.errorMessage,_that.project,_that.tasks,_that.filteredTasks,_that.users,_that.tags,_that.taskTypes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TMProject project,  List<TMTask>? tasks,  List<TMTask>? filteredTasks,  List<TMUser>? users,  List<TMTaskTag>? tags,  List<String>? taskTypes)?  idle,TResult? Function( TMProject project,  List<TMTask>? tasks,  List<TMTask>? filteredTasks,  List<TMUser>? users,  List<TMTaskTag>? tags,  List<String>? taskTypes)?  loading,TResult? Function( TMProject project,  List<TMTask>? tasks,  List<TMTask>? filteredTasks,  List<TMUser>? users,  List<TMTaskTag>? tags,  List<String>? taskTypes)?  loadingProjects,TResult? Function( String errorMessage,  TMProject project,  List<TMTask>? tasks,  List<TMTask>? filteredTasks,  List<TMUser>? users,  List<TMTaskTag>? tags,  List<String>? taskTypes)?  error,}) {final _that = this;
switch (_that) {
case _IdleProjectsState() when idle != null:
return idle(_that.project,_that.tasks,_that.filteredTasks,_that.users,_that.tags,_that.taskTypes);case _LoadingProjectsState() when loading != null:
return loading(_that.project,_that.tasks,_that.filteredTasks,_that.users,_that.tags,_that.taskTypes);case _LoadingProjectsProjectsState() when loadingProjects != null:
return loadingProjects(_that.project,_that.tasks,_that.filteredTasks,_that.users,_that.tags,_that.taskTypes);case _ErrorProjectsState() when error != null:
return error(_that.errorMessage,_that.project,_that.tasks,_that.filteredTasks,_that.users,_that.tags,_that.taskTypes);case _:
  return null;

}
}

}

/// @nodoc


class _IdleProjectsState extends ProjectState {
  const _IdleProjectsState({required this.project, final  List<TMTask>? tasks, final  List<TMTask>? filteredTasks, final  List<TMUser>? users, final  List<TMTaskTag>? tags, final  List<String>? taskTypes}): _tasks = tasks,_filteredTasks = filteredTasks,_users = users,_tags = tags,_taskTypes = taskTypes,super._();
  

@override final  TMProject project;
 final  List<TMTask>? _tasks;
@override List<TMTask>? get tasks {
  final value = _tasks;
  if (value == null) return null;
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMTask>? _filteredTasks;
@override List<TMTask>? get filteredTasks {
  final value = _filteredTasks;
  if (value == null) return null;
  if (_filteredTasks is EqualUnmodifiableListView) return _filteredTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMUser>? _users;
@override List<TMUser>? get users {
  final value = _users;
  if (value == null) return null;
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMTaskTag>? _tags;
@override List<TMTaskTag>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _taskTypes;
@override List<String>? get taskTypes {
  final value = _taskTypes;
  if (value == null) return null;
  if (_taskTypes is EqualUnmodifiableListView) return _taskTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdleProjectsStateCopyWith<_IdleProjectsState> get copyWith => __$IdleProjectsStateCopyWithImpl<_IdleProjectsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdleProjectsState&&(identical(other.project, project) || other.project == project)&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&const DeepCollectionEquality().equals(other._filteredTasks, _filteredTasks)&&const DeepCollectionEquality().equals(other._users, _users)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._taskTypes, _taskTypes));
}


@override
int get hashCode => Object.hash(runtimeType,project,const DeepCollectionEquality().hash(_tasks),const DeepCollectionEquality().hash(_filteredTasks),const DeepCollectionEquality().hash(_users),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_taskTypes));

@override
String toString() {
  return 'ProjectState.idle(project: $project, tasks: $tasks, filteredTasks: $filteredTasks, users: $users, tags: $tags, taskTypes: $taskTypes)';
}


}

/// @nodoc
abstract mixin class _$IdleProjectsStateCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory _$IdleProjectsStateCopyWith(_IdleProjectsState value, $Res Function(_IdleProjectsState) _then) = __$IdleProjectsStateCopyWithImpl;
@override @useResult
$Res call({
 TMProject project, List<TMTask>? tasks, List<TMTask>? filteredTasks, List<TMUser>? users, List<TMTaskTag>? tags, List<String>? taskTypes
});


@override $TMProjectCopyWith<$Res> get project;

}
/// @nodoc
class __$IdleProjectsStateCopyWithImpl<$Res>
    implements _$IdleProjectsStateCopyWith<$Res> {
  __$IdleProjectsStateCopyWithImpl(this._self, this._then);

  final _IdleProjectsState _self;
  final $Res Function(_IdleProjectsState) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? project = null,Object? tasks = freezed,Object? filteredTasks = freezed,Object? users = freezed,Object? tags = freezed,Object? taskTypes = freezed,}) {
  return _then(_IdleProjectsState(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as TMProject,tasks: freezed == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,filteredTasks: freezed == filteredTasks ? _self._filteredTasks : filteredTasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,users: freezed == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<TMUser>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TMTaskTag>?,taskTypes: freezed == taskTypes ? _self._taskTypes : taskTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMProjectCopyWith<$Res> get project {
  
  return $TMProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

/// @nodoc


class _LoadingProjectsState extends ProjectState {
  const _LoadingProjectsState({required this.project, final  List<TMTask>? tasks, final  List<TMTask>? filteredTasks, final  List<TMUser>? users, final  List<TMTaskTag>? tags, final  List<String>? taskTypes}): _tasks = tasks,_filteredTasks = filteredTasks,_users = users,_tags = tags,_taskTypes = taskTypes,super._();
  

@override final  TMProject project;
 final  List<TMTask>? _tasks;
@override List<TMTask>? get tasks {
  final value = _tasks;
  if (value == null) return null;
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMTask>? _filteredTasks;
@override List<TMTask>? get filteredTasks {
  final value = _filteredTasks;
  if (value == null) return null;
  if (_filteredTasks is EqualUnmodifiableListView) return _filteredTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMUser>? _users;
@override List<TMUser>? get users {
  final value = _users;
  if (value == null) return null;
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMTaskTag>? _tags;
@override List<TMTaskTag>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _taskTypes;
@override List<String>? get taskTypes {
  final value = _taskTypes;
  if (value == null) return null;
  if (_taskTypes is EqualUnmodifiableListView) return _taskTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingProjectsStateCopyWith<_LoadingProjectsState> get copyWith => __$LoadingProjectsStateCopyWithImpl<_LoadingProjectsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingProjectsState&&(identical(other.project, project) || other.project == project)&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&const DeepCollectionEquality().equals(other._filteredTasks, _filteredTasks)&&const DeepCollectionEquality().equals(other._users, _users)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._taskTypes, _taskTypes));
}


@override
int get hashCode => Object.hash(runtimeType,project,const DeepCollectionEquality().hash(_tasks),const DeepCollectionEquality().hash(_filteredTasks),const DeepCollectionEquality().hash(_users),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_taskTypes));

@override
String toString() {
  return 'ProjectState.loading(project: $project, tasks: $tasks, filteredTasks: $filteredTasks, users: $users, tags: $tags, taskTypes: $taskTypes)';
}


}

/// @nodoc
abstract mixin class _$LoadingProjectsStateCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory _$LoadingProjectsStateCopyWith(_LoadingProjectsState value, $Res Function(_LoadingProjectsState) _then) = __$LoadingProjectsStateCopyWithImpl;
@override @useResult
$Res call({
 TMProject project, List<TMTask>? tasks, List<TMTask>? filteredTasks, List<TMUser>? users, List<TMTaskTag>? tags, List<String>? taskTypes
});


@override $TMProjectCopyWith<$Res> get project;

}
/// @nodoc
class __$LoadingProjectsStateCopyWithImpl<$Res>
    implements _$LoadingProjectsStateCopyWith<$Res> {
  __$LoadingProjectsStateCopyWithImpl(this._self, this._then);

  final _LoadingProjectsState _self;
  final $Res Function(_LoadingProjectsState) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? project = null,Object? tasks = freezed,Object? filteredTasks = freezed,Object? users = freezed,Object? tags = freezed,Object? taskTypes = freezed,}) {
  return _then(_LoadingProjectsState(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as TMProject,tasks: freezed == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,filteredTasks: freezed == filteredTasks ? _self._filteredTasks : filteredTasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,users: freezed == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<TMUser>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TMTaskTag>?,taskTypes: freezed == taskTypes ? _self._taskTypes : taskTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMProjectCopyWith<$Res> get project {
  
  return $TMProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

/// @nodoc


class _LoadingProjectsProjectsState extends ProjectState {
  const _LoadingProjectsProjectsState({required this.project, final  List<TMTask>? tasks, final  List<TMTask>? filteredTasks, final  List<TMUser>? users, final  List<TMTaskTag>? tags, final  List<String>? taskTypes}): _tasks = tasks,_filteredTasks = filteredTasks,_users = users,_tags = tags,_taskTypes = taskTypes,super._();
  

@override final  TMProject project;
 final  List<TMTask>? _tasks;
@override List<TMTask>? get tasks {
  final value = _tasks;
  if (value == null) return null;
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMTask>? _filteredTasks;
@override List<TMTask>? get filteredTasks {
  final value = _filteredTasks;
  if (value == null) return null;
  if (_filteredTasks is EqualUnmodifiableListView) return _filteredTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMUser>? _users;
@override List<TMUser>? get users {
  final value = _users;
  if (value == null) return null;
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMTaskTag>? _tags;
@override List<TMTaskTag>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _taskTypes;
@override List<String>? get taskTypes {
  final value = _taskTypes;
  if (value == null) return null;
  if (_taskTypes is EqualUnmodifiableListView) return _taskTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingProjectsProjectsStateCopyWith<_LoadingProjectsProjectsState> get copyWith => __$LoadingProjectsProjectsStateCopyWithImpl<_LoadingProjectsProjectsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingProjectsProjectsState&&(identical(other.project, project) || other.project == project)&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&const DeepCollectionEquality().equals(other._filteredTasks, _filteredTasks)&&const DeepCollectionEquality().equals(other._users, _users)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._taskTypes, _taskTypes));
}


@override
int get hashCode => Object.hash(runtimeType,project,const DeepCollectionEquality().hash(_tasks),const DeepCollectionEquality().hash(_filteredTasks),const DeepCollectionEquality().hash(_users),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_taskTypes));

@override
String toString() {
  return 'ProjectState.loadingProjects(project: $project, tasks: $tasks, filteredTasks: $filteredTasks, users: $users, tags: $tags, taskTypes: $taskTypes)';
}


}

/// @nodoc
abstract mixin class _$LoadingProjectsProjectsStateCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory _$LoadingProjectsProjectsStateCopyWith(_LoadingProjectsProjectsState value, $Res Function(_LoadingProjectsProjectsState) _then) = __$LoadingProjectsProjectsStateCopyWithImpl;
@override @useResult
$Res call({
 TMProject project, List<TMTask>? tasks, List<TMTask>? filteredTasks, List<TMUser>? users, List<TMTaskTag>? tags, List<String>? taskTypes
});


@override $TMProjectCopyWith<$Res> get project;

}
/// @nodoc
class __$LoadingProjectsProjectsStateCopyWithImpl<$Res>
    implements _$LoadingProjectsProjectsStateCopyWith<$Res> {
  __$LoadingProjectsProjectsStateCopyWithImpl(this._self, this._then);

  final _LoadingProjectsProjectsState _self;
  final $Res Function(_LoadingProjectsProjectsState) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? project = null,Object? tasks = freezed,Object? filteredTasks = freezed,Object? users = freezed,Object? tags = freezed,Object? taskTypes = freezed,}) {
  return _then(_LoadingProjectsProjectsState(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as TMProject,tasks: freezed == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,filteredTasks: freezed == filteredTasks ? _self._filteredTasks : filteredTasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,users: freezed == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<TMUser>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TMTaskTag>?,taskTypes: freezed == taskTypes ? _self._taskTypes : taskTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMProjectCopyWith<$Res> get project {
  
  return $TMProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

/// @nodoc


class _ErrorProjectsState extends ProjectState {
  const _ErrorProjectsState({required this.errorMessage, required this.project, final  List<TMTask>? tasks, final  List<TMTask>? filteredTasks, final  List<TMUser>? users, final  List<TMTaskTag>? tags, final  List<String>? taskTypes}): _tasks = tasks,_filteredTasks = filteredTasks,_users = users,_tags = tags,_taskTypes = taskTypes,super._();
  

 final  String errorMessage;
@override final  TMProject project;
 final  List<TMTask>? _tasks;
@override List<TMTask>? get tasks {
  final value = _tasks;
  if (value == null) return null;
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMTask>? _filteredTasks;
@override List<TMTask>? get filteredTasks {
  final value = _filteredTasks;
  if (value == null) return null;
  if (_filteredTasks is EqualUnmodifiableListView) return _filteredTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMUser>? _users;
@override List<TMUser>? get users {
  final value = _users;
  if (value == null) return null;
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMTaskTag>? _tags;
@override List<TMTaskTag>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _taskTypes;
@override List<String>? get taskTypes {
  final value = _taskTypes;
  if (value == null) return null;
  if (_taskTypes is EqualUnmodifiableListView) return _taskTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorProjectsStateCopyWith<_ErrorProjectsState> get copyWith => __$ErrorProjectsStateCopyWithImpl<_ErrorProjectsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorProjectsState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.project, project) || other.project == project)&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&const DeepCollectionEquality().equals(other._filteredTasks, _filteredTasks)&&const DeepCollectionEquality().equals(other._users, _users)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._taskTypes, _taskTypes));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,project,const DeepCollectionEquality().hash(_tasks),const DeepCollectionEquality().hash(_filteredTasks),const DeepCollectionEquality().hash(_users),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_taskTypes));

@override
String toString() {
  return 'ProjectState.error(errorMessage: $errorMessage, project: $project, tasks: $tasks, filteredTasks: $filteredTasks, users: $users, tags: $tags, taskTypes: $taskTypes)';
}


}

/// @nodoc
abstract mixin class _$ErrorProjectsStateCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory _$ErrorProjectsStateCopyWith(_ErrorProjectsState value, $Res Function(_ErrorProjectsState) _then) = __$ErrorProjectsStateCopyWithImpl;
@override @useResult
$Res call({
 String errorMessage, TMProject project, List<TMTask>? tasks, List<TMTask>? filteredTasks, List<TMUser>? users, List<TMTaskTag>? tags, List<String>? taskTypes
});


@override $TMProjectCopyWith<$Res> get project;

}
/// @nodoc
class __$ErrorProjectsStateCopyWithImpl<$Res>
    implements _$ErrorProjectsStateCopyWith<$Res> {
  __$ErrorProjectsStateCopyWithImpl(this._self, this._then);

  final _ErrorProjectsState _self;
  final $Res Function(_ErrorProjectsState) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,Object? project = null,Object? tasks = freezed,Object? filteredTasks = freezed,Object? users = freezed,Object? tags = freezed,Object? taskTypes = freezed,}) {
  return _then(_ErrorProjectsState(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as TMProject,tasks: freezed == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,filteredTasks: freezed == filteredTasks ? _self._filteredTasks : filteredTasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,users: freezed == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<TMUser>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TMTaskTag>?,taskTypes: freezed == taskTypes ? _self._taskTypes : taskTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMProjectCopyWith<$Res> get project {
  
  return $TMProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

// dart format on
