// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Follow _$FollowFromJson(Map<String, dynamic> json) => Follow(
      idNovel: json.keys as String? ?? '',
      idChapter: json['idChapter'] as String? ?? '',
    );

Map<String, dynamic> _$FollowToJson(Follow instance) => <String, dynamic>{
      'idNovel': instance.idNovel,
      'idChapter': instance.idChapter,
    };
