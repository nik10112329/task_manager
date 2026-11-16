// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsEvent()';
}


}

/// @nodoc
class $NotificationsEventCopyWith<$Res>  {
$NotificationsEventCopyWith(NotificationsEvent _, $Res Function(NotificationsEvent) __);
}


/// Adds pattern-matching-related methods to [NotificationsEvent].
extension NotificationsEventPatterns on NotificationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadNotificationsEvent value)?  load,TResult Function( _MarkAsReadNotificationsEvent value)?  markAsRead,TResult Function( _OnDeleteNotificationsEvent value)?  delete,TResult Function( _MarkAllAsReadNotificationsEvent value)?  markAllAsRead,TResult Function( _NewNotificationReceivedNotificationsEvent value)?  newNotificationReceived,TResult Function( _PushRustoreNotificationsEvent value)?  pushRustoreNotification,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadNotificationsEvent() when load != null:
return load(_that);case _MarkAsReadNotificationsEvent() when markAsRead != null:
return markAsRead(_that);case _OnDeleteNotificationsEvent() when delete != null:
return delete(_that);case _MarkAllAsReadNotificationsEvent() when markAllAsRead != null:
return markAllAsRead(_that);case _NewNotificationReceivedNotificationsEvent() when newNotificationReceived != null:
return newNotificationReceived(_that);case _PushRustoreNotificationsEvent() when pushRustoreNotification != null:
return pushRustoreNotification(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadNotificationsEvent value)  load,required TResult Function( _MarkAsReadNotificationsEvent value)  markAsRead,required TResult Function( _OnDeleteNotificationsEvent value)  delete,required TResult Function( _MarkAllAsReadNotificationsEvent value)  markAllAsRead,required TResult Function( _NewNotificationReceivedNotificationsEvent value)  newNotificationReceived,required TResult Function( _PushRustoreNotificationsEvent value)  pushRustoreNotification,}){
final _that = this;
switch (_that) {
case _LoadNotificationsEvent():
return load(_that);case _MarkAsReadNotificationsEvent():
return markAsRead(_that);case _OnDeleteNotificationsEvent():
return delete(_that);case _MarkAllAsReadNotificationsEvent():
return markAllAsRead(_that);case _NewNotificationReceivedNotificationsEvent():
return newNotificationReceived(_that);case _PushRustoreNotificationsEvent():
return pushRustoreNotification(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadNotificationsEvent value)?  load,TResult? Function( _MarkAsReadNotificationsEvent value)?  markAsRead,TResult? Function( _OnDeleteNotificationsEvent value)?  delete,TResult? Function( _MarkAllAsReadNotificationsEvent value)?  markAllAsRead,TResult? Function( _NewNotificationReceivedNotificationsEvent value)?  newNotificationReceived,TResult? Function( _PushRustoreNotificationsEvent value)?  pushRustoreNotification,}){
final _that = this;
switch (_that) {
case _LoadNotificationsEvent() when load != null:
return load(_that);case _MarkAsReadNotificationsEvent() when markAsRead != null:
return markAsRead(_that);case _OnDeleteNotificationsEvent() when delete != null:
return delete(_that);case _MarkAllAsReadNotificationsEvent() when markAllAsRead != null:
return markAllAsRead(_that);case _NewNotificationReceivedNotificationsEvent() when newNotificationReceived != null:
return newNotificationReceived(_that);case _PushRustoreNotificationsEvent() when pushRustoreNotification != null:
return pushRustoreNotification(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String id)?  markAsRead,TResult Function( String id)?  delete,TResult Function()?  markAllAsRead,TResult Function( TMNotification notification)?  newNotificationReceived,TResult Function( String title,  String description,  String? image)?  pushRustoreNotification,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadNotificationsEvent() when load != null:
return load();case _MarkAsReadNotificationsEvent() when markAsRead != null:
return markAsRead(_that.id);case _OnDeleteNotificationsEvent() when delete != null:
return delete(_that.id);case _MarkAllAsReadNotificationsEvent() when markAllAsRead != null:
return markAllAsRead();case _NewNotificationReceivedNotificationsEvent() when newNotificationReceived != null:
return newNotificationReceived(_that.notification);case _PushRustoreNotificationsEvent() when pushRustoreNotification != null:
return pushRustoreNotification(_that.title,_that.description,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String id)  markAsRead,required TResult Function( String id)  delete,required TResult Function()  markAllAsRead,required TResult Function( TMNotification notification)  newNotificationReceived,required TResult Function( String title,  String description,  String? image)  pushRustoreNotification,}) {final _that = this;
switch (_that) {
case _LoadNotificationsEvent():
return load();case _MarkAsReadNotificationsEvent():
return markAsRead(_that.id);case _OnDeleteNotificationsEvent():
return delete(_that.id);case _MarkAllAsReadNotificationsEvent():
return markAllAsRead();case _NewNotificationReceivedNotificationsEvent():
return newNotificationReceived(_that.notification);case _PushRustoreNotificationsEvent():
return pushRustoreNotification(_that.title,_that.description,_that.image);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String id)?  markAsRead,TResult? Function( String id)?  delete,TResult? Function()?  markAllAsRead,TResult? Function( TMNotification notification)?  newNotificationReceived,TResult? Function( String title,  String description,  String? image)?  pushRustoreNotification,}) {final _that = this;
switch (_that) {
case _LoadNotificationsEvent() when load != null:
return load();case _MarkAsReadNotificationsEvent() when markAsRead != null:
return markAsRead(_that.id);case _OnDeleteNotificationsEvent() when delete != null:
return delete(_that.id);case _MarkAllAsReadNotificationsEvent() when markAllAsRead != null:
return markAllAsRead();case _NewNotificationReceivedNotificationsEvent() when newNotificationReceived != null:
return newNotificationReceived(_that.notification);case _PushRustoreNotificationsEvent() when pushRustoreNotification != null:
return pushRustoreNotification(_that.title,_that.description,_that.image);case _:
  return null;

}
}

}

/// @nodoc


class _LoadNotificationsEvent extends NotificationsEvent {
  const _LoadNotificationsEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadNotificationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsEvent.load()';
}


}




/// @nodoc


class _MarkAsReadNotificationsEvent extends NotificationsEvent {
  const _MarkAsReadNotificationsEvent(this.id): super._();
  

 final  String id;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkAsReadNotificationsEventCopyWith<_MarkAsReadNotificationsEvent> get copyWith => __$MarkAsReadNotificationsEventCopyWithImpl<_MarkAsReadNotificationsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAsReadNotificationsEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'NotificationsEvent.markAsRead(id: $id)';
}


}

/// @nodoc
abstract mixin class _$MarkAsReadNotificationsEventCopyWith<$Res> implements $NotificationsEventCopyWith<$Res> {
  factory _$MarkAsReadNotificationsEventCopyWith(_MarkAsReadNotificationsEvent value, $Res Function(_MarkAsReadNotificationsEvent) _then) = __$MarkAsReadNotificationsEventCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$MarkAsReadNotificationsEventCopyWithImpl<$Res>
    implements _$MarkAsReadNotificationsEventCopyWith<$Res> {
  __$MarkAsReadNotificationsEventCopyWithImpl(this._self, this._then);

  final _MarkAsReadNotificationsEvent _self;
  final $Res Function(_MarkAsReadNotificationsEvent) _then;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_MarkAsReadNotificationsEvent(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OnDeleteNotificationsEvent extends NotificationsEvent {
  const _OnDeleteNotificationsEvent(this.id): super._();
  

 final  String id;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnDeleteNotificationsEventCopyWith<_OnDeleteNotificationsEvent> get copyWith => __$OnDeleteNotificationsEventCopyWithImpl<_OnDeleteNotificationsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnDeleteNotificationsEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'NotificationsEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class _$OnDeleteNotificationsEventCopyWith<$Res> implements $NotificationsEventCopyWith<$Res> {
  factory _$OnDeleteNotificationsEventCopyWith(_OnDeleteNotificationsEvent value, $Res Function(_OnDeleteNotificationsEvent) _then) = __$OnDeleteNotificationsEventCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$OnDeleteNotificationsEventCopyWithImpl<$Res>
    implements _$OnDeleteNotificationsEventCopyWith<$Res> {
  __$OnDeleteNotificationsEventCopyWithImpl(this._self, this._then);

  final _OnDeleteNotificationsEvent _self;
  final $Res Function(_OnDeleteNotificationsEvent) _then;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_OnDeleteNotificationsEvent(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _MarkAllAsReadNotificationsEvent extends NotificationsEvent {
  const _MarkAllAsReadNotificationsEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAllAsReadNotificationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsEvent.markAllAsRead()';
}


}




/// @nodoc


class _NewNotificationReceivedNotificationsEvent extends NotificationsEvent {
  const _NewNotificationReceivedNotificationsEvent(this.notification): super._();
  

 final  TMNotification notification;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewNotificationReceivedNotificationsEventCopyWith<_NewNotificationReceivedNotificationsEvent> get copyWith => __$NewNotificationReceivedNotificationsEventCopyWithImpl<_NewNotificationReceivedNotificationsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewNotificationReceivedNotificationsEvent&&(identical(other.notification, notification) || other.notification == notification));
}


@override
int get hashCode => Object.hash(runtimeType,notification);

@override
String toString() {
  return 'NotificationsEvent.newNotificationReceived(notification: $notification)';
}


}

/// @nodoc
abstract mixin class _$NewNotificationReceivedNotificationsEventCopyWith<$Res> implements $NotificationsEventCopyWith<$Res> {
  factory _$NewNotificationReceivedNotificationsEventCopyWith(_NewNotificationReceivedNotificationsEvent value, $Res Function(_NewNotificationReceivedNotificationsEvent) _then) = __$NewNotificationReceivedNotificationsEventCopyWithImpl;
@useResult
$Res call({
 TMNotification notification
});


$TMNotificationCopyWith<$Res> get notification;

}
/// @nodoc
class __$NewNotificationReceivedNotificationsEventCopyWithImpl<$Res>
    implements _$NewNotificationReceivedNotificationsEventCopyWith<$Res> {
  __$NewNotificationReceivedNotificationsEventCopyWithImpl(this._self, this._then);

  final _NewNotificationReceivedNotificationsEvent _self;
  final $Res Function(_NewNotificationReceivedNotificationsEvent) _then;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notification = null,}) {
  return _then(_NewNotificationReceivedNotificationsEvent(
null == notification ? _self.notification : notification // ignore: cast_nullable_to_non_nullable
as TMNotification,
  ));
}

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TMNotificationCopyWith<$Res> get notification {
  
  return $TMNotificationCopyWith<$Res>(_self.notification, (value) {
    return _then(_self.copyWith(notification: value));
  });
}
}

/// @nodoc


class _PushRustoreNotificationsEvent extends NotificationsEvent {
  const _PushRustoreNotificationsEvent({required this.title, required this.description, this.image}): super._();
  

 final  String title;
 final  String description;
 final  String? image;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PushRustoreNotificationsEventCopyWith<_PushRustoreNotificationsEvent> get copyWith => __$PushRustoreNotificationsEventCopyWithImpl<_PushRustoreNotificationsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PushRustoreNotificationsEvent&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,image);

@override
String toString() {
  return 'NotificationsEvent.pushRustoreNotification(title: $title, description: $description, image: $image)';
}


}

/// @nodoc
abstract mixin class _$PushRustoreNotificationsEventCopyWith<$Res> implements $NotificationsEventCopyWith<$Res> {
  factory _$PushRustoreNotificationsEventCopyWith(_PushRustoreNotificationsEvent value, $Res Function(_PushRustoreNotificationsEvent) _then) = __$PushRustoreNotificationsEventCopyWithImpl;
@useResult
$Res call({
 String title, String description, String? image
});




}
/// @nodoc
class __$PushRustoreNotificationsEventCopyWithImpl<$Res>
    implements _$PushRustoreNotificationsEventCopyWith<$Res> {
  __$PushRustoreNotificationsEventCopyWithImpl(this._self, this._then);

  final _PushRustoreNotificationsEvent _self;
  final $Res Function(_PushRustoreNotificationsEvent) _then;

/// Create a copy of NotificationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? image = freezed,}) {
  return _then(_PushRustoreNotificationsEvent(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$NotificationsState {

 List<TMNotification> get notifications;
/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsStateCopyWith<NotificationsState> get copyWith => _$NotificationsStateCopyWithImpl<NotificationsState>(this as NotificationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsState&&const DeepCollectionEquality().equals(other.notifications, notifications));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(notifications));

@override
String toString() {
  return 'NotificationsState(notifications: $notifications)';
}


}

/// @nodoc
abstract mixin class $NotificationsStateCopyWith<$Res>  {
  factory $NotificationsStateCopyWith(NotificationsState value, $Res Function(NotificationsState) _then) = _$NotificationsStateCopyWithImpl;
@useResult
$Res call({
 List<TMNotification> notifications
});




}
/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._self, this._then);

  final NotificationsState _self;
  final $Res Function(NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notifications = null,}) {
  return _then(_self.copyWith(
notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<TMNotification>,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitialNotificationState value)?  initial,TResult Function( _LoadingNotificationState value)?  loading,TResult Function( _IdleNotificationState value)?  idle,TResult Function( _ErrorNotificationState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialNotificationState() when initial != null:
return initial(_that);case _LoadingNotificationState() when loading != null:
return loading(_that);case _IdleNotificationState() when idle != null:
return idle(_that);case _ErrorNotificationState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitialNotificationState value)  initial,required TResult Function( _LoadingNotificationState value)  loading,required TResult Function( _IdleNotificationState value)  idle,required TResult Function( _ErrorNotificationState value)  error,}){
final _that = this;
switch (_that) {
case _InitialNotificationState():
return initial(_that);case _LoadingNotificationState():
return loading(_that);case _IdleNotificationState():
return idle(_that);case _ErrorNotificationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitialNotificationState value)?  initial,TResult? Function( _LoadingNotificationState value)?  loading,TResult? Function( _IdleNotificationState value)?  idle,TResult? Function( _ErrorNotificationState value)?  error,}){
final _that = this;
switch (_that) {
case _InitialNotificationState() when initial != null:
return initial(_that);case _LoadingNotificationState() when loading != null:
return loading(_that);case _IdleNotificationState() when idle != null:
return idle(_that);case _ErrorNotificationState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<TMNotification> notifications)?  initial,TResult Function( List<TMNotification> notifications)?  loading,TResult Function( List<TMNotification> notifications,  int unreadCount)?  idle,TResult Function( List<TMNotification> notifications,  String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialNotificationState() when initial != null:
return initial(_that.notifications);case _LoadingNotificationState() when loading != null:
return loading(_that.notifications);case _IdleNotificationState() when idle != null:
return idle(_that.notifications,_that.unreadCount);case _ErrorNotificationState() when error != null:
return error(_that.notifications,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<TMNotification> notifications)  initial,required TResult Function( List<TMNotification> notifications)  loading,required TResult Function( List<TMNotification> notifications,  int unreadCount)  idle,required TResult Function( List<TMNotification> notifications,  String message)  error,}) {final _that = this;
switch (_that) {
case _InitialNotificationState():
return initial(_that.notifications);case _LoadingNotificationState():
return loading(_that.notifications);case _IdleNotificationState():
return idle(_that.notifications,_that.unreadCount);case _ErrorNotificationState():
return error(_that.notifications,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<TMNotification> notifications)?  initial,TResult? Function( List<TMNotification> notifications)?  loading,TResult? Function( List<TMNotification> notifications,  int unreadCount)?  idle,TResult? Function( List<TMNotification> notifications,  String message)?  error,}) {final _that = this;
switch (_that) {
case _InitialNotificationState() when initial != null:
return initial(_that.notifications);case _LoadingNotificationState() when loading != null:
return loading(_that.notifications);case _IdleNotificationState() when idle != null:
return idle(_that.notifications,_that.unreadCount);case _ErrorNotificationState() when error != null:
return error(_that.notifications,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _InitialNotificationState extends NotificationsState {
  const _InitialNotificationState({required final  List<TMNotification> notifications}): _notifications = notifications,super._();
  

 final  List<TMNotification> _notifications;
@override List<TMNotification> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}


/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialNotificationStateCopyWith<_InitialNotificationState> get copyWith => __$InitialNotificationStateCopyWithImpl<_InitialNotificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialNotificationState&&const DeepCollectionEquality().equals(other._notifications, _notifications));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications));

@override
String toString() {
  return 'NotificationsState.initial(notifications: $notifications)';
}


}

/// @nodoc
abstract mixin class _$InitialNotificationStateCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$InitialNotificationStateCopyWith(_InitialNotificationState value, $Res Function(_InitialNotificationState) _then) = __$InitialNotificationStateCopyWithImpl;
@override @useResult
$Res call({
 List<TMNotification> notifications
});




}
/// @nodoc
class __$InitialNotificationStateCopyWithImpl<$Res>
    implements _$InitialNotificationStateCopyWith<$Res> {
  __$InitialNotificationStateCopyWithImpl(this._self, this._then);

  final _InitialNotificationState _self;
  final $Res Function(_InitialNotificationState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,}) {
  return _then(_InitialNotificationState(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<TMNotification>,
  ));
}


}

/// @nodoc


class _LoadingNotificationState extends NotificationsState {
  const _LoadingNotificationState({required final  List<TMNotification> notifications}): _notifications = notifications,super._();
  

 final  List<TMNotification> _notifications;
@override List<TMNotification> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}


/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingNotificationStateCopyWith<_LoadingNotificationState> get copyWith => __$LoadingNotificationStateCopyWithImpl<_LoadingNotificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingNotificationState&&const DeepCollectionEquality().equals(other._notifications, _notifications));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications));

@override
String toString() {
  return 'NotificationsState.loading(notifications: $notifications)';
}


}

/// @nodoc
abstract mixin class _$LoadingNotificationStateCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$LoadingNotificationStateCopyWith(_LoadingNotificationState value, $Res Function(_LoadingNotificationState) _then) = __$LoadingNotificationStateCopyWithImpl;
@override @useResult
$Res call({
 List<TMNotification> notifications
});




}
/// @nodoc
class __$LoadingNotificationStateCopyWithImpl<$Res>
    implements _$LoadingNotificationStateCopyWith<$Res> {
  __$LoadingNotificationStateCopyWithImpl(this._self, this._then);

  final _LoadingNotificationState _self;
  final $Res Function(_LoadingNotificationState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,}) {
  return _then(_LoadingNotificationState(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<TMNotification>,
  ));
}


}

/// @nodoc


class _IdleNotificationState extends NotificationsState {
  const _IdleNotificationState({required final  List<TMNotification> notifications, required this.unreadCount}): _notifications = notifications,super._();
  

 final  List<TMNotification> _notifications;
@override List<TMNotification> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

 final  int unreadCount;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdleNotificationStateCopyWith<_IdleNotificationState> get copyWith => __$IdleNotificationStateCopyWithImpl<_IdleNotificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdleNotificationState&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),unreadCount);

@override
String toString() {
  return 'NotificationsState.idle(notifications: $notifications, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class _$IdleNotificationStateCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$IdleNotificationStateCopyWith(_IdleNotificationState value, $Res Function(_IdleNotificationState) _then) = __$IdleNotificationStateCopyWithImpl;
@override @useResult
$Res call({
 List<TMNotification> notifications, int unreadCount
});




}
/// @nodoc
class __$IdleNotificationStateCopyWithImpl<$Res>
    implements _$IdleNotificationStateCopyWith<$Res> {
  __$IdleNotificationStateCopyWithImpl(this._self, this._then);

  final _IdleNotificationState _self;
  final $Res Function(_IdleNotificationState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? unreadCount = null,}) {
  return _then(_IdleNotificationState(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<TMNotification>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ErrorNotificationState extends NotificationsState {
  const _ErrorNotificationState({required final  List<TMNotification> notifications, required this.message}): _notifications = notifications,super._();
  

 final  List<TMNotification> _notifications;
@override List<TMNotification> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

 final  String message;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorNotificationStateCopyWith<_ErrorNotificationState> get copyWith => __$ErrorNotificationStateCopyWithImpl<_ErrorNotificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorNotificationState&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),message);

@override
String toString() {
  return 'NotificationsState.error(notifications: $notifications, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorNotificationStateCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$ErrorNotificationStateCopyWith(_ErrorNotificationState value, $Res Function(_ErrorNotificationState) _then) = __$ErrorNotificationStateCopyWithImpl;
@override @useResult
$Res call({
 List<TMNotification> notifications, String message
});




}
/// @nodoc
class __$ErrorNotificationStateCopyWithImpl<$Res>
    implements _$ErrorNotificationStateCopyWith<$Res> {
  __$ErrorNotificationStateCopyWithImpl(this._self, this._then);

  final _ErrorNotificationState _self;
  final $Res Function(_ErrorNotificationState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? message = null,}) {
  return _then(_ErrorNotificationState(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<TMNotification>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
