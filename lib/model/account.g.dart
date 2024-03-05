// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      accountId: json.keys as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      imgUser: json['imgUser'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      password: json['password'] as String? ?? '',
      follows: (json['follows'] as List<dynamic>?)
              ?.map((e) => Follow.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'name': instance.name,
      'email': instance.email,
      'imgUser': instance.imgUser,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': instance.dateOfBirth,
      'password': instance.password,
      'follows': instance.follows,
    };
