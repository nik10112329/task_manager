// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchUsersEvent {

 String get searchQuery; int get limit;
/// Create a copy of SearchUsersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchUsersEventCopyWith<SearchUsersEvent> get copyWith => _$SearchUsersEventCopyWithImpl<SearchUsersEvent>(this as SearchUsersEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsersEvent&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,limit);

@override
String toString() {
  return 'SearchUsersEvent(searchQuery: $searchQuery, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $SearchUsersEventCopyWith<$Res>  {
  factory $SearchUsersEventCopyWith(SearchUsersEvent value, $Res Function(SearchUsersEvent) _then) = _$SearchUsersEventCopyWithImpl;
@useResult
$Res call({
 String searchQuery, int limit
});




}
/// @nodoc
class _$SearchUsersEventCopyWithImpl<$Res>
    implements $SearchUsersEventCopyWith<$Res> {
  _$SearchUsersEventCopyWithImpl(this._self, this._then);

  final SearchUsersEvent _self;
  final $Res Function(SearchUsersEvent) _then;

/// Create a copy of SearchUsersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchQuery = null,Object? limit = null,}) {
  return _then(_self.copyWith(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchUsersEvent].
extension SearchUsersEventPatterns on SearchUsersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SearchUsersSearchUsersEvent value)?  searchUsers,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchUsersSearchUsersEvent() when searchUsers != null:
return searchUsers(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SearchUsersSearchUsersEvent value)  searchUsers,}){
final _that = this;
switch (_that) {
case _SearchUsersSearchUsersEvent():
return searchUsers(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SearchUsersSearchUsersEvent value)?  searchUsers,}){
final _that = this;
switch (_that) {
case _SearchUsersSearchUsersEvent() when searchUsers != null:
return searchUsers(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String searchQuery,  int limit)?  searchUsers,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchUsersSearchUsersEvent() when searchUsers != null:
return searchUsers(_that.searchQuery,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String searchQuery,  int limit)  searchUsers,}) {final _that = this;
switch (_that) {
case _SearchUsersSearchUsersEvent():
return searchUsers(_that.searchQuery,_that.limit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String searchQuery,  int limit)?  searchUsers,}) {final _that = this;
switch (_that) {
case _SearchUsersSearchUsersEvent() when searchUsers != null:
return searchUsers(_that.searchQuery,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class _SearchUsersSearchUsersEvent extends SearchUsersEvent {
  const _SearchUsersSearchUsersEvent({required this.searchQuery, required this.limit}): super._();
  

@override final  String searchQuery;
@override final  int limit;

/// Create a copy of SearchUsersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchUsersSearchUsersEventCopyWith<_SearchUsersSearchUsersEvent> get copyWith => __$SearchUsersSearchUsersEventCopyWithImpl<_SearchUsersSearchUsersEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchUsersSearchUsersEvent&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,limit);

@override
String toString() {
  return 'SearchUsersEvent.searchUsers(searchQuery: $searchQuery, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$SearchUsersSearchUsersEventCopyWith<$Res> implements $SearchUsersEventCopyWith<$Res> {
  factory _$SearchUsersSearchUsersEventCopyWith(_SearchUsersSearchUsersEvent value, $Res Function(_SearchUsersSearchUsersEvent) _then) = __$SearchUsersSearchUsersEventCopyWithImpl;
@override @useResult
$Res call({
 String searchQuery, int limit
});




}
/// @nodoc
class __$SearchUsersSearchUsersEventCopyWithImpl<$Res>
    implements _$SearchUsersSearchUsersEventCopyWith<$Res> {
  __$SearchUsersSearchUsersEventCopyWithImpl(this._self, this._then);

  final _SearchUsersSearchUsersEvent _self;
  final $Res Function(_SearchUsersSearchUsersEvent) _then;

/// Create a copy of SearchUsersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchQuery = null,Object? limit = null,}) {
  return _then(_SearchUsersSearchUsersEvent(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$SearchUsersState {

 List<TMUser> get users;
/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchUsersStateCopyWith<SearchUsersState> get copyWith => _$SearchUsersStateCopyWithImpl<SearchUsersState>(this as SearchUsersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsersState&&const DeepCollectionEquality().equals(other.users, users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users));

@override
String toString() {
  return 'SearchUsersState(users: $users)';
}


}

/// @nodoc
abstract mixin class $SearchUsersStateCopyWith<$Res>  {
  factory $SearchUsersStateCopyWith(SearchUsersState value, $Res Function(SearchUsersState) _then) = _$SearchUsersStateCopyWithImpl;
@useResult
$Res call({
 List<TMUser> users
});




}
/// @nodoc
class _$SearchUsersStateCopyWithImpl<$Res>
    implements $SearchUsersStateCopyWith<$Res> {
  _$SearchUsersStateCopyWithImpl(this._self, this._then);

  final SearchUsersState _self;
  final $Res Function(SearchUsersState) _then;

/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<TMUser>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchUsersState].
extension SearchUsersStatePatterns on SearchUsersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _IdleSearchUsersState value)?  idle,TResult Function( _LoadingSearchUsersState value)?  loading,TResult Function( _ErrorSearchUsersState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdleSearchUsersState() when idle != null:
return idle(_that);case _LoadingSearchUsersState() when loading != null:
return loading(_that);case _ErrorSearchUsersState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _IdleSearchUsersState value)  idle,required TResult Function( _LoadingSearchUsersState value)  loading,required TResult Function( _ErrorSearchUsersState value)  error,}){
final _that = this;
switch (_that) {
case _IdleSearchUsersState():
return idle(_that);case _LoadingSearchUsersState():
return loading(_that);case _ErrorSearchUsersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _IdleSearchUsersState value)?  idle,TResult? Function( _LoadingSearchUsersState value)?  loading,TResult? Function( _ErrorSearchUsersState value)?  error,}){
final _that = this;
switch (_that) {
case _IdleSearchUsersState() when idle != null:
return idle(_that);case _LoadingSearchUsersState() when loading != null:
return loading(_that);case _ErrorSearchUsersState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<TMUser> users)?  idle,TResult Function( List<TMUser> users)?  loading,TResult Function( String errorMessage,  List<TMUser> users)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdleSearchUsersState() when idle != null:
return idle(_that.users);case _LoadingSearchUsersState() when loading != null:
return loading(_that.users);case _ErrorSearchUsersState() when error != null:
return error(_that.errorMessage,_that.users);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<TMUser> users)  idle,required TResult Function( List<TMUser> users)  loading,required TResult Function( String errorMessage,  List<TMUser> users)  error,}) {final _that = this;
switch (_that) {
case _IdleSearchUsersState():
return idle(_that.users);case _LoadingSearchUsersState():
return loading(_that.users);case _ErrorSearchUsersState():
return error(_that.errorMessage,_that.users);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<TMUser> users)?  idle,TResult? Function( List<TMUser> users)?  loading,TResult? Function( String errorMessage,  List<TMUser> users)?  error,}) {final _that = this;
switch (_that) {
case _IdleSearchUsersState() when idle != null:
return idle(_that.users);case _LoadingSearchUsersState() when loading != null:
return loading(_that.users);case _ErrorSearchUsersState() when error != null:
return error(_that.errorMessage,_that.users);case _:
  return null;

}
}

}

/// @nodoc


class _IdleSearchUsersState extends SearchUsersState {
  const _IdleSearchUsersState({required final  List<TMUser> users}): _users = users,super._();
  

 final  List<TMUser> _users;
@override List<TMUser> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdleSearchUsersStateCopyWith<_IdleSearchUsersState> get copyWith => __$IdleSearchUsersStateCopyWithImpl<_IdleSearchUsersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdleSearchUsersState&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'SearchUsersState.idle(users: $users)';
}


}

/// @nodoc
abstract mixin class _$IdleSearchUsersStateCopyWith<$Res> implements $SearchUsersStateCopyWith<$Res> {
  factory _$IdleSearchUsersStateCopyWith(_IdleSearchUsersState value, $Res Function(_IdleSearchUsersState) _then) = __$IdleSearchUsersStateCopyWithImpl;
@override @useResult
$Res call({
 List<TMUser> users
});




}
/// @nodoc
class __$IdleSearchUsersStateCopyWithImpl<$Res>
    implements _$IdleSearchUsersStateCopyWith<$Res> {
  __$IdleSearchUsersStateCopyWithImpl(this._self, this._then);

  final _IdleSearchUsersState _self;
  final $Res Function(_IdleSearchUsersState) _then;

/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(_IdleSearchUsersState(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<TMUser>,
  ));
}


}

/// @nodoc


class _LoadingSearchUsersState extends SearchUsersState {
  const _LoadingSearchUsersState({required final  List<TMUser> users}): _users = users,super._();
  

 final  List<TMUser> _users;
@override List<TMUser> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingSearchUsersStateCopyWith<_LoadingSearchUsersState> get copyWith => __$LoadingSearchUsersStateCopyWithImpl<_LoadingSearchUsersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingSearchUsersState&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'SearchUsersState.loading(users: $users)';
}


}

/// @nodoc
abstract mixin class _$LoadingSearchUsersStateCopyWith<$Res> implements $SearchUsersStateCopyWith<$Res> {
  factory _$LoadingSearchUsersStateCopyWith(_LoadingSearchUsersState value, $Res Function(_LoadingSearchUsersState) _then) = __$LoadingSearchUsersStateCopyWithImpl;
@override @useResult
$Res call({
 List<TMUser> users
});




}
/// @nodoc
class __$LoadingSearchUsersStateCopyWithImpl<$Res>
    implements _$LoadingSearchUsersStateCopyWith<$Res> {
  __$LoadingSearchUsersStateCopyWithImpl(this._self, this._then);

  final _LoadingSearchUsersState _self;
  final $Res Function(_LoadingSearchUsersState) _then;

/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(_LoadingSearchUsersState(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<TMUser>,
  ));
}


}

/// @nodoc


class _ErrorSearchUsersState extends SearchUsersState {
  const _ErrorSearchUsersState({required this.errorMessage, required final  List<TMUser> users}): _users = users,super._();
  

 final  String errorMessage;
 final  List<TMUser> _users;
@override List<TMUser> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorSearchUsersStateCopyWith<_ErrorSearchUsersState> get copyWith => __$ErrorSearchUsersStateCopyWithImpl<_ErrorSearchUsersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorSearchUsersState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'SearchUsersState.error(errorMessage: $errorMessage, users: $users)';
}


}

/// @nodoc
abstract mixin class _$ErrorSearchUsersStateCopyWith<$Res> implements $SearchUsersStateCopyWith<$Res> {
  factory _$ErrorSearchUsersStateCopyWith(_ErrorSearchUsersState value, $Res Function(_ErrorSearchUsersState) _then) = __$ErrorSearchUsersStateCopyWithImpl;
@override @useResult
$Res call({
 String errorMessage, List<TMUser> users
});




}
/// @nodoc
class __$ErrorSearchUsersStateCopyWithImpl<$Res>
    implements _$ErrorSearchUsersStateCopyWith<$Res> {
  __$ErrorSearchUsersStateCopyWithImpl(this._self, this._then);

  final _ErrorSearchUsersState _self;
  final $Res Function(_ErrorSearchUsersState) _then;

/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,Object? users = null,}) {
  return _then(_ErrorSearchUsersState(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<TMUser>,
  ));
}


}

// dart format on
