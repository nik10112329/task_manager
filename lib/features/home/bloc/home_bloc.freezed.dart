// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitializeHomeEvent value)?  initialize,TResult Function( _AddProjectHomeEvent value)?  addProject,TResult Function( _FetchTasksHomeEvent value)?  fetchTasks,TResult Function( _FetchUsersFromProjectsHomeEvent value)?  fetchUsersFromProjects,TResult Function( _UpdateProjectHomeEvent value)?  updateProject,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitializeHomeEvent() when initialize != null:
return initialize(_that);case _AddProjectHomeEvent() when addProject != null:
return addProject(_that);case _FetchTasksHomeEvent() when fetchTasks != null:
return fetchTasks(_that);case _FetchUsersFromProjectsHomeEvent() when fetchUsersFromProjects != null:
return fetchUsersFromProjects(_that);case _UpdateProjectHomeEvent() when updateProject != null:
return updateProject(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitializeHomeEvent value)  initialize,required TResult Function( _AddProjectHomeEvent value)  addProject,required TResult Function( _FetchTasksHomeEvent value)  fetchTasks,required TResult Function( _FetchUsersFromProjectsHomeEvent value)  fetchUsersFromProjects,required TResult Function( _UpdateProjectHomeEvent value)  updateProject,}){
final _that = this;
switch (_that) {
case _InitializeHomeEvent():
return initialize(_that);case _AddProjectHomeEvent():
return addProject(_that);case _FetchTasksHomeEvent():
return fetchTasks(_that);case _FetchUsersFromProjectsHomeEvent():
return fetchUsersFromProjects(_that);case _UpdateProjectHomeEvent():
return updateProject(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitializeHomeEvent value)?  initialize,TResult? Function( _AddProjectHomeEvent value)?  addProject,TResult? Function( _FetchTasksHomeEvent value)?  fetchTasks,TResult? Function( _FetchUsersFromProjectsHomeEvent value)?  fetchUsersFromProjects,TResult? Function( _UpdateProjectHomeEvent value)?  updateProject,}){
final _that = this;
switch (_that) {
case _InitializeHomeEvent() when initialize != null:
return initialize(_that);case _AddProjectHomeEvent() when addProject != null:
return addProject(_that);case _FetchTasksHomeEvent() when fetchTasks != null:
return fetchTasks(_that);case _FetchUsersFromProjectsHomeEvent() when fetchUsersFromProjects != null:
return fetchUsersFromProjects(_that);case _UpdateProjectHomeEvent() when updateProject != null:
return updateProject(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? userId)?  initialize,TResult Function( TMProject project)?  addProject,TResult Function( List<String> projectsIds)?  fetchTasks,TResult Function( String projectId)?  fetchUsersFromProjects,TResult Function( TMProject project)?  updateProject,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitializeHomeEvent() when initialize != null:
return initialize(_that.userId);case _AddProjectHomeEvent() when addProject != null:
return addProject(_that.project);case _FetchTasksHomeEvent() when fetchTasks != null:
return fetchTasks(_that.projectsIds);case _FetchUsersFromProjectsHomeEvent() when fetchUsersFromProjects != null:
return fetchUsersFromProjects(_that.projectId);case _UpdateProjectHomeEvent() when updateProject != null:
return updateProject(_that.project);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? userId)  initialize,required TResult Function( TMProject project)  addProject,required TResult Function( List<String> projectsIds)  fetchTasks,required TResult Function( String projectId)  fetchUsersFromProjects,required TResult Function( TMProject project)  updateProject,}) {final _that = this;
switch (_that) {
case _InitializeHomeEvent():
return initialize(_that.userId);case _AddProjectHomeEvent():
return addProject(_that.project);case _FetchTasksHomeEvent():
return fetchTasks(_that.projectsIds);case _FetchUsersFromProjectsHomeEvent():
return fetchUsersFromProjects(_that.projectId);case _UpdateProjectHomeEvent():
return updateProject(_that.project);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? userId)?  initialize,TResult? Function( TMProject project)?  addProject,TResult? Function( List<String> projectsIds)?  fetchTasks,TResult? Function( String projectId)?  fetchUsersFromProjects,TResult? Function( TMProject project)?  updateProject,}) {final _that = this;
switch (_that) {
case _InitializeHomeEvent() when initialize != null:
return initialize(_that.userId);case _AddProjectHomeEvent() when addProject != null:
return addProject(_that.project);case _FetchTasksHomeEvent() when fetchTasks != null:
return fetchTasks(_that.projectsIds);case _FetchUsersFromProjectsHomeEvent() when fetchUsersFromProjects != null:
return fetchUsersFromProjects(_that.projectId);case _UpdateProjectHomeEvent() when updateProject != null:
return updateProject(_that.project);case _:
  return null;

}
}

}

/// @nodoc


class _InitializeHomeEvent extends HomeEvent with DiagnosticableTreeMixin {
  const _InitializeHomeEvent({this.userId}): super._();
  

 final  String? userId;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitializeHomeEventCopyWith<_InitializeHomeEvent> get copyWith => __$InitializeHomeEventCopyWithImpl<_InitializeHomeEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.initialize'))
    ..add(DiagnosticsProperty('userId', userId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitializeHomeEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.initialize(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$InitializeHomeEventCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$InitializeHomeEventCopyWith(_InitializeHomeEvent value, $Res Function(_InitializeHomeEvent) _then) = __$InitializeHomeEventCopyWithImpl;
@useResult
$Res call({
 String? userId
});




}
/// @nodoc
class __$InitializeHomeEventCopyWithImpl<$Res>
    implements _$InitializeHomeEventCopyWith<$Res> {
  __$InitializeHomeEventCopyWithImpl(this._self, this._then);

  final _InitializeHomeEvent _self;
  final $Res Function(_InitializeHomeEvent) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = freezed,}) {
  return _then(_InitializeHomeEvent(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _AddProjectHomeEvent extends HomeEvent with DiagnosticableTreeMixin {
  const _AddProjectHomeEvent({required this.project}): super._();
  

 final  TMProject project;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddProjectHomeEventCopyWith<_AddProjectHomeEvent> get copyWith => __$AddProjectHomeEventCopyWithImpl<_AddProjectHomeEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.addProject'))
    ..add(DiagnosticsProperty('project', project));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddProjectHomeEvent&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.addProject(project: $project)';
}


}

/// @nodoc
abstract mixin class _$AddProjectHomeEventCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$AddProjectHomeEventCopyWith(_AddProjectHomeEvent value, $Res Function(_AddProjectHomeEvent) _then) = __$AddProjectHomeEventCopyWithImpl;
@useResult
$Res call({
 TMProject project
});


$TMProjectCopyWith<$Res> get project;

}
/// @nodoc
class __$AddProjectHomeEventCopyWithImpl<$Res>
    implements _$AddProjectHomeEventCopyWith<$Res> {
  __$AddProjectHomeEventCopyWithImpl(this._self, this._then);

  final _AddProjectHomeEvent _self;
  final $Res Function(_AddProjectHomeEvent) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(_AddProjectHomeEvent(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as TMProject,
  ));
}

/// Create a copy of HomeEvent
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


class _FetchTasksHomeEvent extends HomeEvent with DiagnosticableTreeMixin {
  const _FetchTasksHomeEvent({required final  List<String> projectsIds}): _projectsIds = projectsIds,super._();
  

 final  List<String> _projectsIds;
 List<String> get projectsIds {
  if (_projectsIds is EqualUnmodifiableListView) return _projectsIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projectsIds);
}


/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchTasksHomeEventCopyWith<_FetchTasksHomeEvent> get copyWith => __$FetchTasksHomeEventCopyWithImpl<_FetchTasksHomeEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.fetchTasks'))
    ..add(DiagnosticsProperty('projectsIds', projectsIds));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchTasksHomeEvent&&const DeepCollectionEquality().equals(other._projectsIds, _projectsIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projectsIds));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.fetchTasks(projectsIds: $projectsIds)';
}


}

/// @nodoc
abstract mixin class _$FetchTasksHomeEventCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$FetchTasksHomeEventCopyWith(_FetchTasksHomeEvent value, $Res Function(_FetchTasksHomeEvent) _then) = __$FetchTasksHomeEventCopyWithImpl;
@useResult
$Res call({
 List<String> projectsIds
});




}
/// @nodoc
class __$FetchTasksHomeEventCopyWithImpl<$Res>
    implements _$FetchTasksHomeEventCopyWith<$Res> {
  __$FetchTasksHomeEventCopyWithImpl(this._self, this._then);

  final _FetchTasksHomeEvent _self;
  final $Res Function(_FetchTasksHomeEvent) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectsIds = null,}) {
  return _then(_FetchTasksHomeEvent(
projectsIds: null == projectsIds ? _self._projectsIds : projectsIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class _FetchUsersFromProjectsHomeEvent extends HomeEvent with DiagnosticableTreeMixin {
  const _FetchUsersFromProjectsHomeEvent({required this.projectId}): super._();
  

 final  String projectId;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchUsersFromProjectsHomeEventCopyWith<_FetchUsersFromProjectsHomeEvent> get copyWith => __$FetchUsersFromProjectsHomeEventCopyWithImpl<_FetchUsersFromProjectsHomeEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.fetchUsersFromProjects'))
    ..add(DiagnosticsProperty('projectId', projectId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchUsersFromProjectsHomeEvent&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.fetchUsersFromProjects(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class _$FetchUsersFromProjectsHomeEventCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$FetchUsersFromProjectsHomeEventCopyWith(_FetchUsersFromProjectsHomeEvent value, $Res Function(_FetchUsersFromProjectsHomeEvent) _then) = __$FetchUsersFromProjectsHomeEventCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class __$FetchUsersFromProjectsHomeEventCopyWithImpl<$Res>
    implements _$FetchUsersFromProjectsHomeEventCopyWith<$Res> {
  __$FetchUsersFromProjectsHomeEventCopyWithImpl(this._self, this._then);

  final _FetchUsersFromProjectsHomeEvent _self;
  final $Res Function(_FetchUsersFromProjectsHomeEvent) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(_FetchUsersFromProjectsHomeEvent(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdateProjectHomeEvent extends HomeEvent with DiagnosticableTreeMixin {
  const _UpdateProjectHomeEvent({required this.project}): super._();
  

 final  TMProject project;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProjectHomeEventCopyWith<_UpdateProjectHomeEvent> get copyWith => __$UpdateProjectHomeEventCopyWithImpl<_UpdateProjectHomeEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.updateProject'))
    ..add(DiagnosticsProperty('project', project));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProjectHomeEvent&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.updateProject(project: $project)';
}


}

/// @nodoc
abstract mixin class _$UpdateProjectHomeEventCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$UpdateProjectHomeEventCopyWith(_UpdateProjectHomeEvent value, $Res Function(_UpdateProjectHomeEvent) _then) = __$UpdateProjectHomeEventCopyWithImpl;
@useResult
$Res call({
 TMProject project
});


$TMProjectCopyWith<$Res> get project;

}
/// @nodoc
class __$UpdateProjectHomeEventCopyWithImpl<$Res>
    implements _$UpdateProjectHomeEventCopyWith<$Res> {
  __$UpdateProjectHomeEventCopyWithImpl(this._self, this._then);

  final _UpdateProjectHomeEvent _self;
  final $Res Function(_UpdateProjectHomeEvent) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(_UpdateProjectHomeEvent(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as TMProject,
  ));
}

/// Create a copy of HomeEvent
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
mixin _$HomeState implements DiagnosticableTreeMixin {

 List<TMProject>? get projects; List<TMTask>? get tasks; List<String>? get taskTypes;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState'))
    ..add(DiagnosticsProperty('projects', projects))..add(DiagnosticsProperty('tasks', tasks))..add(DiagnosticsProperty('taskTypes', taskTypes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.projects, projects)&&const DeepCollectionEquality().equals(other.tasks, tasks)&&const DeepCollectionEquality().equals(other.taskTypes, taskTypes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(projects),const DeepCollectionEquality().hash(tasks),const DeepCollectionEquality().hash(taskTypes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState(projects: $projects, tasks: $tasks, taskTypes: $taskTypes)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<TMProject>? projects, List<TMTask>? tasks, List<String>? taskTypes
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projects = freezed,Object? tasks = freezed,Object? taskTypes = freezed,}) {
  return _then(_self.copyWith(
projects: freezed == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<TMProject>?,tasks: freezed == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,taskTypes: freezed == taskTypes ? _self.taskTypes : taskTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _IdleHomeState value)?  idle,TResult Function( _LoadingHomeState value)?  loading,TResult Function( _LoadingProjectsHomeState value)?  loadingProjects,TResult Function( _ErrorHomeState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdleHomeState() when idle != null:
return idle(_that);case _LoadingHomeState() when loading != null:
return loading(_that);case _LoadingProjectsHomeState() when loadingProjects != null:
return loadingProjects(_that);case _ErrorHomeState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _IdleHomeState value)  idle,required TResult Function( _LoadingHomeState value)  loading,required TResult Function( _LoadingProjectsHomeState value)  loadingProjects,required TResult Function( _ErrorHomeState value)  error,}){
final _that = this;
switch (_that) {
case _IdleHomeState():
return idle(_that);case _LoadingHomeState():
return loading(_that);case _LoadingProjectsHomeState():
return loadingProjects(_that);case _ErrorHomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _IdleHomeState value)?  idle,TResult? Function( _LoadingHomeState value)?  loading,TResult? Function( _LoadingProjectsHomeState value)?  loadingProjects,TResult? Function( _ErrorHomeState value)?  error,}){
final _that = this;
switch (_that) {
case _IdleHomeState() when idle != null:
return idle(_that);case _LoadingHomeState() when loading != null:
return loading(_that);case _LoadingProjectsHomeState() when loadingProjects != null:
return loadingProjects(_that);case _ErrorHomeState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<TMProject>? projects,  List<TMTask>? tasks,  List<String>? taskTypes)?  idle,TResult Function( List<TMProject>? projects,  List<TMTask>? tasks,  List<String>? taskTypes)?  loading,TResult Function( List<TMProject>? projects,  List<TMTask>? tasks,  List<String>? taskTypes)?  loadingProjects,TResult Function( String errorMessage,  List<TMProject>? projects,  List<TMTask>? tasks,  List<String>? taskTypes)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdleHomeState() when idle != null:
return idle(_that.projects,_that.tasks,_that.taskTypes);case _LoadingHomeState() when loading != null:
return loading(_that.projects,_that.tasks,_that.taskTypes);case _LoadingProjectsHomeState() when loadingProjects != null:
return loadingProjects(_that.projects,_that.tasks,_that.taskTypes);case _ErrorHomeState() when error != null:
return error(_that.errorMessage,_that.projects,_that.tasks,_that.taskTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<TMProject>? projects,  List<TMTask>? tasks,  List<String>? taskTypes)  idle,required TResult Function( List<TMProject>? projects,  List<TMTask>? tasks,  List<String>? taskTypes)  loading,required TResult Function( List<TMProject>? projects,  List<TMTask>? tasks,  List<String>? taskTypes)  loadingProjects,required TResult Function( String errorMessage,  List<TMProject>? projects,  List<TMTask>? tasks,  List<String>? taskTypes)  error,}) {final _that = this;
switch (_that) {
case _IdleHomeState():
return idle(_that.projects,_that.tasks,_that.taskTypes);case _LoadingHomeState():
return loading(_that.projects,_that.tasks,_that.taskTypes);case _LoadingProjectsHomeState():
return loadingProjects(_that.projects,_that.tasks,_that.taskTypes);case _ErrorHomeState():
return error(_that.errorMessage,_that.projects,_that.tasks,_that.taskTypes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<TMProject>? projects,  List<TMTask>? tasks,  List<String>? taskTypes)?  idle,TResult? Function( List<TMProject>? projects,  List<TMTask>? tasks,  List<String>? taskTypes)?  loading,TResult? Function( List<TMProject>? projects,  List<TMTask>? tasks,  List<String>? taskTypes)?  loadingProjects,TResult? Function( String errorMessage,  List<TMProject>? projects,  List<TMTask>? tasks,  List<String>? taskTypes)?  error,}) {final _that = this;
switch (_that) {
case _IdleHomeState() when idle != null:
return idle(_that.projects,_that.tasks,_that.taskTypes);case _LoadingHomeState() when loading != null:
return loading(_that.projects,_that.tasks,_that.taskTypes);case _LoadingProjectsHomeState() when loadingProjects != null:
return loadingProjects(_that.projects,_that.tasks,_that.taskTypes);case _ErrorHomeState() when error != null:
return error(_that.errorMessage,_that.projects,_that.tasks,_that.taskTypes);case _:
  return null;

}
}

}

/// @nodoc


class _IdleHomeState extends HomeState with DiagnosticableTreeMixin {
  const _IdleHomeState({final  List<TMProject>? projects, final  List<TMTask>? tasks, final  List<String>? taskTypes}): _projects = projects,_tasks = tasks,_taskTypes = taskTypes,super._();
  

 final  List<TMProject>? _projects;
@override List<TMProject>? get projects {
  final value = _projects;
  if (value == null) return null;
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMTask>? _tasks;
@override List<TMTask>? get tasks {
  final value = _tasks;
  if (value == null) return null;
  if (_tasks is EqualUnmodifiableListView) return _tasks;
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


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdleHomeStateCopyWith<_IdleHomeState> get copyWith => __$IdleHomeStateCopyWithImpl<_IdleHomeState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.idle'))
    ..add(DiagnosticsProperty('projects', projects))..add(DiagnosticsProperty('tasks', tasks))..add(DiagnosticsProperty('taskTypes', taskTypes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdleHomeState&&const DeepCollectionEquality().equals(other._projects, _projects)&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&const DeepCollectionEquality().equals(other._taskTypes, _taskTypes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects),const DeepCollectionEquality().hash(_tasks),const DeepCollectionEquality().hash(_taskTypes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.idle(projects: $projects, tasks: $tasks, taskTypes: $taskTypes)';
}


}

/// @nodoc
abstract mixin class _$IdleHomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$IdleHomeStateCopyWith(_IdleHomeState value, $Res Function(_IdleHomeState) _then) = __$IdleHomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<TMProject>? projects, List<TMTask>? tasks, List<String>? taskTypes
});




}
/// @nodoc
class __$IdleHomeStateCopyWithImpl<$Res>
    implements _$IdleHomeStateCopyWith<$Res> {
  __$IdleHomeStateCopyWithImpl(this._self, this._then);

  final _IdleHomeState _self;
  final $Res Function(_IdleHomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = freezed,Object? tasks = freezed,Object? taskTypes = freezed,}) {
  return _then(_IdleHomeState(
projects: freezed == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<TMProject>?,tasks: freezed == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,taskTypes: freezed == taskTypes ? _self._taskTypes : taskTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

/// @nodoc


class _LoadingHomeState extends HomeState with DiagnosticableTreeMixin {
  const _LoadingHomeState({final  List<TMProject>? projects, final  List<TMTask>? tasks, final  List<String>? taskTypes}): _projects = projects,_tasks = tasks,_taskTypes = taskTypes,super._();
  

 final  List<TMProject>? _projects;
@override List<TMProject>? get projects {
  final value = _projects;
  if (value == null) return null;
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMTask>? _tasks;
@override List<TMTask>? get tasks {
  final value = _tasks;
  if (value == null) return null;
  if (_tasks is EqualUnmodifiableListView) return _tasks;
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


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingHomeStateCopyWith<_LoadingHomeState> get copyWith => __$LoadingHomeStateCopyWithImpl<_LoadingHomeState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.loading'))
    ..add(DiagnosticsProperty('projects', projects))..add(DiagnosticsProperty('tasks', tasks))..add(DiagnosticsProperty('taskTypes', taskTypes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingHomeState&&const DeepCollectionEquality().equals(other._projects, _projects)&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&const DeepCollectionEquality().equals(other._taskTypes, _taskTypes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects),const DeepCollectionEquality().hash(_tasks),const DeepCollectionEquality().hash(_taskTypes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.loading(projects: $projects, tasks: $tasks, taskTypes: $taskTypes)';
}


}

/// @nodoc
abstract mixin class _$LoadingHomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$LoadingHomeStateCopyWith(_LoadingHomeState value, $Res Function(_LoadingHomeState) _then) = __$LoadingHomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<TMProject>? projects, List<TMTask>? tasks, List<String>? taskTypes
});




}
/// @nodoc
class __$LoadingHomeStateCopyWithImpl<$Res>
    implements _$LoadingHomeStateCopyWith<$Res> {
  __$LoadingHomeStateCopyWithImpl(this._self, this._then);

  final _LoadingHomeState _self;
  final $Res Function(_LoadingHomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = freezed,Object? tasks = freezed,Object? taskTypes = freezed,}) {
  return _then(_LoadingHomeState(
projects: freezed == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<TMProject>?,tasks: freezed == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,taskTypes: freezed == taskTypes ? _self._taskTypes : taskTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

/// @nodoc


class _LoadingProjectsHomeState extends HomeState with DiagnosticableTreeMixin {
  const _LoadingProjectsHomeState({final  List<TMProject>? projects, final  List<TMTask>? tasks, final  List<String>? taskTypes}): _projects = projects,_tasks = tasks,_taskTypes = taskTypes,super._();
  

 final  List<TMProject>? _projects;
@override List<TMProject>? get projects {
  final value = _projects;
  if (value == null) return null;
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMTask>? _tasks;
@override List<TMTask>? get tasks {
  final value = _tasks;
  if (value == null) return null;
  if (_tasks is EqualUnmodifiableListView) return _tasks;
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


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingProjectsHomeStateCopyWith<_LoadingProjectsHomeState> get copyWith => __$LoadingProjectsHomeStateCopyWithImpl<_LoadingProjectsHomeState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.loadingProjects'))
    ..add(DiagnosticsProperty('projects', projects))..add(DiagnosticsProperty('tasks', tasks))..add(DiagnosticsProperty('taskTypes', taskTypes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingProjectsHomeState&&const DeepCollectionEquality().equals(other._projects, _projects)&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&const DeepCollectionEquality().equals(other._taskTypes, _taskTypes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects),const DeepCollectionEquality().hash(_tasks),const DeepCollectionEquality().hash(_taskTypes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.loadingProjects(projects: $projects, tasks: $tasks, taskTypes: $taskTypes)';
}


}

/// @nodoc
abstract mixin class _$LoadingProjectsHomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$LoadingProjectsHomeStateCopyWith(_LoadingProjectsHomeState value, $Res Function(_LoadingProjectsHomeState) _then) = __$LoadingProjectsHomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<TMProject>? projects, List<TMTask>? tasks, List<String>? taskTypes
});




}
/// @nodoc
class __$LoadingProjectsHomeStateCopyWithImpl<$Res>
    implements _$LoadingProjectsHomeStateCopyWith<$Res> {
  __$LoadingProjectsHomeStateCopyWithImpl(this._self, this._then);

  final _LoadingProjectsHomeState _self;
  final $Res Function(_LoadingProjectsHomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = freezed,Object? tasks = freezed,Object? taskTypes = freezed,}) {
  return _then(_LoadingProjectsHomeState(
projects: freezed == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<TMProject>?,tasks: freezed == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,taskTypes: freezed == taskTypes ? _self._taskTypes : taskTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

/// @nodoc


class _ErrorHomeState extends HomeState with DiagnosticableTreeMixin {
  const _ErrorHomeState({required this.errorMessage, final  List<TMProject>? projects, final  List<TMTask>? tasks, final  List<String>? taskTypes}): _projects = projects,_tasks = tasks,_taskTypes = taskTypes,super._();
  

 final  String errorMessage;
 final  List<TMProject>? _projects;
@override List<TMProject>? get projects {
  final value = _projects;
  if (value == null) return null;
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TMTask>? _tasks;
@override List<TMTask>? get tasks {
  final value = _tasks;
  if (value == null) return null;
  if (_tasks is EqualUnmodifiableListView) return _tasks;
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


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorHomeStateCopyWith<_ErrorHomeState> get copyWith => __$ErrorHomeStateCopyWithImpl<_ErrorHomeState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.error'))
    ..add(DiagnosticsProperty('errorMessage', errorMessage))..add(DiagnosticsProperty('projects', projects))..add(DiagnosticsProperty('tasks', tasks))..add(DiagnosticsProperty('taskTypes', taskTypes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorHomeState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._projects, _projects)&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&const DeepCollectionEquality().equals(other._taskTypes, _taskTypes));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,const DeepCollectionEquality().hash(_projects),const DeepCollectionEquality().hash(_tasks),const DeepCollectionEquality().hash(_taskTypes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.error(errorMessage: $errorMessage, projects: $projects, tasks: $tasks, taskTypes: $taskTypes)';
}


}

/// @nodoc
abstract mixin class _$ErrorHomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$ErrorHomeStateCopyWith(_ErrorHomeState value, $Res Function(_ErrorHomeState) _then) = __$ErrorHomeStateCopyWithImpl;
@override @useResult
$Res call({
 String errorMessage, List<TMProject>? projects, List<TMTask>? tasks, List<String>? taskTypes
});




}
/// @nodoc
class __$ErrorHomeStateCopyWithImpl<$Res>
    implements _$ErrorHomeStateCopyWith<$Res> {
  __$ErrorHomeStateCopyWithImpl(this._self, this._then);

  final _ErrorHomeState _self;
  final $Res Function(_ErrorHomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,Object? projects = freezed,Object? tasks = freezed,Object? taskTypes = freezed,}) {
  return _then(_ErrorHomeState(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,projects: freezed == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<TMProject>?,tasks: freezed == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TMTask>?,taskTypes: freezed == taskTypes ? _self._taskTypes : taskTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

/// @nodoc
mixin _$HomeSideEffect implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeSideEffect'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeSideEffect()';
}


}

/// @nodoc
class $HomeSideEffectCopyWith<$Res>  {
$HomeSideEffectCopyWith(HomeSideEffect _, $Res Function(HomeSideEffect) __);
}


/// Adds pattern-matching-related methods to [HomeSideEffect].
extension HomeSideEffectPatterns on HomeSideEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TaskAddedHomeSideEffect value)?  taskAdded,TResult Function( _ProjectFetchedHomeSideEffect value)?  projectFetched,TResult Function( _TasksFetchedHomeSideEffect value)?  tasksFetched,TResult Function( _ProjectUsersFetchedHomeSideEffect value)?  projectUsersFetched,TResult Function( _ProjectUpdatedHomeSideEffect value)?  projectUpdated,TResult Function( _TaskUpdatedHomeSideEffect value)?  taskUpdated,TResult Function( _TaskDeletedHomeSideEffect value)?  taskDeleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskAddedHomeSideEffect() when taskAdded != null:
return taskAdded(_that);case _ProjectFetchedHomeSideEffect() when projectFetched != null:
return projectFetched(_that);case _TasksFetchedHomeSideEffect() when tasksFetched != null:
return tasksFetched(_that);case _ProjectUsersFetchedHomeSideEffect() when projectUsersFetched != null:
return projectUsersFetched(_that);case _ProjectUpdatedHomeSideEffect() when projectUpdated != null:
return projectUpdated(_that);case _TaskUpdatedHomeSideEffect() when taskUpdated != null:
return taskUpdated(_that);case _TaskDeletedHomeSideEffect() when taskDeleted != null:
return taskDeleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TaskAddedHomeSideEffect value)  taskAdded,required TResult Function( _ProjectFetchedHomeSideEffect value)  projectFetched,required TResult Function( _TasksFetchedHomeSideEffect value)  tasksFetched,required TResult Function( _ProjectUsersFetchedHomeSideEffect value)  projectUsersFetched,required TResult Function( _ProjectUpdatedHomeSideEffect value)  projectUpdated,required TResult Function( _TaskUpdatedHomeSideEffect value)  taskUpdated,required TResult Function( _TaskDeletedHomeSideEffect value)  taskDeleted,}){
final _that = this;
switch (_that) {
case _TaskAddedHomeSideEffect():
return taskAdded(_that);case _ProjectFetchedHomeSideEffect():
return projectFetched(_that);case _TasksFetchedHomeSideEffect():
return tasksFetched(_that);case _ProjectUsersFetchedHomeSideEffect():
return projectUsersFetched(_that);case _ProjectUpdatedHomeSideEffect():
return projectUpdated(_that);case _TaskUpdatedHomeSideEffect():
return taskUpdated(_that);case _TaskDeletedHomeSideEffect():
return taskDeleted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TaskAddedHomeSideEffect value)?  taskAdded,TResult? Function( _ProjectFetchedHomeSideEffect value)?  projectFetched,TResult? Function( _TasksFetchedHomeSideEffect value)?  tasksFetched,TResult? Function( _ProjectUsersFetchedHomeSideEffect value)?  projectUsersFetched,TResult? Function( _ProjectUpdatedHomeSideEffect value)?  projectUpdated,TResult? Function( _TaskUpdatedHomeSideEffect value)?  taskUpdated,TResult? Function( _TaskDeletedHomeSideEffect value)?  taskDeleted,}){
final _that = this;
switch (_that) {
case _TaskAddedHomeSideEffect() when taskAdded != null:
return taskAdded(_that);case _ProjectFetchedHomeSideEffect() when projectFetched != null:
return projectFetched(_that);case _TasksFetchedHomeSideEffect() when tasksFetched != null:
return tasksFetched(_that);case _ProjectUsersFetchedHomeSideEffect() when projectUsersFetched != null:
return projectUsersFetched(_that);case _ProjectUpdatedHomeSideEffect() when projectUpdated != null:
return projectUpdated(_that);case _TaskUpdatedHomeSideEffect() when taskUpdated != null:
return taskUpdated(_that);case _TaskDeletedHomeSideEffect() when taskDeleted != null:
return taskDeleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  taskAdded,TResult Function()?  projectFetched,TResult Function()?  tasksFetched,TResult Function( List<TMUser> projectUsers)?  projectUsersFetched,TResult Function()?  projectUpdated,TResult Function()?  taskUpdated,TResult Function()?  taskDeleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskAddedHomeSideEffect() when taskAdded != null:
return taskAdded();case _ProjectFetchedHomeSideEffect() when projectFetched != null:
return projectFetched();case _TasksFetchedHomeSideEffect() when tasksFetched != null:
return tasksFetched();case _ProjectUsersFetchedHomeSideEffect() when projectUsersFetched != null:
return projectUsersFetched(_that.projectUsers);case _ProjectUpdatedHomeSideEffect() when projectUpdated != null:
return projectUpdated();case _TaskUpdatedHomeSideEffect() when taskUpdated != null:
return taskUpdated();case _TaskDeletedHomeSideEffect() when taskDeleted != null:
return taskDeleted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  taskAdded,required TResult Function()  projectFetched,required TResult Function()  tasksFetched,required TResult Function( List<TMUser> projectUsers)  projectUsersFetched,required TResult Function()  projectUpdated,required TResult Function()  taskUpdated,required TResult Function()  taskDeleted,}) {final _that = this;
switch (_that) {
case _TaskAddedHomeSideEffect():
return taskAdded();case _ProjectFetchedHomeSideEffect():
return projectFetched();case _TasksFetchedHomeSideEffect():
return tasksFetched();case _ProjectUsersFetchedHomeSideEffect():
return projectUsersFetched(_that.projectUsers);case _ProjectUpdatedHomeSideEffect():
return projectUpdated();case _TaskUpdatedHomeSideEffect():
return taskUpdated();case _TaskDeletedHomeSideEffect():
return taskDeleted();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  taskAdded,TResult? Function()?  projectFetched,TResult? Function()?  tasksFetched,TResult? Function( List<TMUser> projectUsers)?  projectUsersFetched,TResult? Function()?  projectUpdated,TResult? Function()?  taskUpdated,TResult? Function()?  taskDeleted,}) {final _that = this;
switch (_that) {
case _TaskAddedHomeSideEffect() when taskAdded != null:
return taskAdded();case _ProjectFetchedHomeSideEffect() when projectFetched != null:
return projectFetched();case _TasksFetchedHomeSideEffect() when tasksFetched != null:
return tasksFetched();case _ProjectUsersFetchedHomeSideEffect() when projectUsersFetched != null:
return projectUsersFetched(_that.projectUsers);case _ProjectUpdatedHomeSideEffect() when projectUpdated != null:
return projectUpdated();case _TaskUpdatedHomeSideEffect() when taskUpdated != null:
return taskUpdated();case _TaskDeletedHomeSideEffect() when taskDeleted != null:
return taskDeleted();case _:
  return null;

}
}

}

/// @nodoc


class _TaskAddedHomeSideEffect extends HomeSideEffect with DiagnosticableTreeMixin {
  const _TaskAddedHomeSideEffect(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeSideEffect.taskAdded'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskAddedHomeSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeSideEffect.taskAdded()';
}


}




/// @nodoc


class _ProjectFetchedHomeSideEffect extends HomeSideEffect with DiagnosticableTreeMixin {
  const _ProjectFetchedHomeSideEffect(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeSideEffect.projectFetched'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectFetchedHomeSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeSideEffect.projectFetched()';
}


}




/// @nodoc


class _TasksFetchedHomeSideEffect extends HomeSideEffect with DiagnosticableTreeMixin {
  const _TasksFetchedHomeSideEffect(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeSideEffect.tasksFetched'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasksFetchedHomeSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeSideEffect.tasksFetched()';
}


}




/// @nodoc


class _ProjectUsersFetchedHomeSideEffect extends HomeSideEffect with DiagnosticableTreeMixin {
  const _ProjectUsersFetchedHomeSideEffect({required final  List<TMUser> projectUsers}): _projectUsers = projectUsers,super._();
  

 final  List<TMUser> _projectUsers;
 List<TMUser> get projectUsers {
  if (_projectUsers is EqualUnmodifiableListView) return _projectUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projectUsers);
}


/// Create a copy of HomeSideEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectUsersFetchedHomeSideEffectCopyWith<_ProjectUsersFetchedHomeSideEffect> get copyWith => __$ProjectUsersFetchedHomeSideEffectCopyWithImpl<_ProjectUsersFetchedHomeSideEffect>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeSideEffect.projectUsersFetched'))
    ..add(DiagnosticsProperty('projectUsers', projectUsers));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectUsersFetchedHomeSideEffect&&const DeepCollectionEquality().equals(other._projectUsers, _projectUsers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projectUsers));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeSideEffect.projectUsersFetched(projectUsers: $projectUsers)';
}


}

/// @nodoc
abstract mixin class _$ProjectUsersFetchedHomeSideEffectCopyWith<$Res> implements $HomeSideEffectCopyWith<$Res> {
  factory _$ProjectUsersFetchedHomeSideEffectCopyWith(_ProjectUsersFetchedHomeSideEffect value, $Res Function(_ProjectUsersFetchedHomeSideEffect) _then) = __$ProjectUsersFetchedHomeSideEffectCopyWithImpl;
@useResult
$Res call({
 List<TMUser> projectUsers
});




}
/// @nodoc
class __$ProjectUsersFetchedHomeSideEffectCopyWithImpl<$Res>
    implements _$ProjectUsersFetchedHomeSideEffectCopyWith<$Res> {
  __$ProjectUsersFetchedHomeSideEffectCopyWithImpl(this._self, this._then);

  final _ProjectUsersFetchedHomeSideEffect _self;
  final $Res Function(_ProjectUsersFetchedHomeSideEffect) _then;

/// Create a copy of HomeSideEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectUsers = null,}) {
  return _then(_ProjectUsersFetchedHomeSideEffect(
projectUsers: null == projectUsers ? _self._projectUsers : projectUsers // ignore: cast_nullable_to_non_nullable
as List<TMUser>,
  ));
}


}

/// @nodoc


class _ProjectUpdatedHomeSideEffect extends HomeSideEffect with DiagnosticableTreeMixin {
  const _ProjectUpdatedHomeSideEffect(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeSideEffect.projectUpdated'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectUpdatedHomeSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeSideEffect.projectUpdated()';
}


}




/// @nodoc


class _TaskUpdatedHomeSideEffect extends HomeSideEffect with DiagnosticableTreeMixin {
  const _TaskUpdatedHomeSideEffect(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeSideEffect.taskUpdated'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskUpdatedHomeSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeSideEffect.taskUpdated()';
}


}




/// @nodoc


class _TaskDeletedHomeSideEffect extends HomeSideEffect with DiagnosticableTreeMixin {
  const _TaskDeletedHomeSideEffect(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeSideEffect.taskDeleted'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskDeletedHomeSideEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeSideEffect.taskDeleted()';
}


}




// dart format on
