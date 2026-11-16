// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TMUser _$TMUserFromJson(Map<String, dynamic> json) => _TMUser(
  id: json['id'] as String,
  email: json['email'] as String,
  signInMethod: $enumDecode(_$SignInMethodEnumMap, json['signInMethod']),
  idLinkedProvider: json['idLinkedProvider'] as String?,
  linkedProviders:
      (json['linkedProviders'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SignInMethodEnumMap, e))
          .toList() ??
      const [],
  rustoreTokens:
      (json['rustoreTokens'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  displayName: json['displayName'] as String?,
  photoUrl: json['photoUrl'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  emailVerified: json['emailVerified'] as bool? ?? false,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  lastLoginAt: json['lastLoginAt'] == null
      ? null
      : DateTime.parse(json['lastLoginAt'] as String),
);

Map<String, dynamic> _$TMUserToJson(_TMUser instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'signInMethod': _$SignInMethodEnumMap[instance.signInMethod]!,
  'idLinkedProvider': instance.idLinkedProvider,
  'linkedProviders': instance.linkedProviders
      .map((e) => _$SignInMethodEnumMap[e]!)
      .toList(),
  'rustoreTokens': instance.rustoreTokens,
  'displayName': instance.displayName,
  'photoUrl': instance.photoUrl,
  'phoneNumber': instance.phoneNumber,
  'emailVerified': instance.emailVerified,
  'createdAt': instance.createdAt?.toIso8601String(),
  'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
};

const _$SignInMethodEnumMap = {
  SignInMethod.google: 'google',
  SignInMethod.emailPassword: 'email_password',
  SignInMethod.apple: 'apple',
  SignInMethod.facebook: 'facebook',
  SignInMethod.vk: 'vk',
  SignInMethod.github: 'github',
};
