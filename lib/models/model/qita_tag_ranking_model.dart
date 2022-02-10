
import 'package:json_annotation/json_annotation.dart';

part 'qita_tag_ranking_model.g.dart';

/// 言語のモデル
@JsonSerializable()
class Tag {
  @JsonKey(name: "followers_count")
  final int? followersCount;
  @JsonKey(name: "icon_url")
  final String? iconUrl;
  @JsonKey(name: "id")
  final String? name;
  @JsonKey(name: "items_count")
  final int? itemsCount;

  Tag({this.followersCount,this.iconUrl,this.name,this.itemsCount});

  factory Tag.fromJson(Map<String, dynamic> json) =>
      _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}