import 'package:json_annotation/json_annotation.dart';

part 'follow.g.dart';

@JsonSerializable()
class Follow {
  final String idNovel;
  final String idChapter;

  const Follow({
    this.idNovel = '',
    this.idChapter = '',
  });

  Follow copyWith({
    String? idNovel,
    String? idChapter,
  }) {
    return Follow(
        idNovel: idNovel ?? this.idNovel,
        idChapter: idChapter ?? this.idChapter);
  }

  factory Follow.fromJson(Map<String, dynamic> json) =>
      _$FollowFromJson(json);

  Map<String, dynamic> toJson() => _$FollowToJson(this);
}
