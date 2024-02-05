// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      userId: json['userId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      imgUser: json['imgUser'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      rate: json['rate'] as int? ?? 0,
      connect: json['connect'] as bool? ?? false,
      password: json['password'] as String? ?? '',
      follows: (json['follows'] as List<dynamic>?)
              ?.map((e) => Follow.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'imgUser': instance.imgUser,
      'phoneNumber': instance.phoneNumber,
      'rate': instance.rate,
      'connect': instance.connect,
      'password': instance.password,
      'follows': instance.follows,
    };
