// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tokens _$TokensFromJson(Map<String, dynamic> json) => _Tokens(
  accessToken: Token.fromJson(json['accessToken'] as Map<String, dynamic>),
  refreshToken: Token.fromJson(json['refreshToken'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TokensToJson(_Tokens instance) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};
