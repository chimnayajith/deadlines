// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      userId: json['userId'] as String,
      displayName: json['displayName'] as String,
      emailAddress: json['emailAddress'] as String,
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'displayName': instance.displayName,
      'emailAddress': instance.emailAddress,
      'profileImage': instance.profileImage,
    };
