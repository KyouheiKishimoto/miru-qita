
import 'package:json_annotation/json_annotation.dart';

part 'qita_user_model.g.dart';

/// Qitaユーザーモデル
@JsonSerializable()
class QitaUserData {
  @JsonKey(name: "id")
  final String? userId;
  final String? name;
  @JsonKey(name: "profile_image_url")
  final String? image;
  final String? description;
  @JsonKey(name: "facebook_id")
  final String? facebookId;
  @JsonKey(name: "followees_count")
  final int followCount;
  @JsonKey(name: "followers_count")
  final int followerCount;
  @JsonKey(name: "github_login_name")
  final String? githubName;
  @JsonKey(name: "items_count")
  final int itemsCount;
  @JsonKey(name: "linkedin_id")
  final String? linkedinId;
  final String? location;
  final String? organization;
  @JsonKey(name: "permanent_id")
  final int permanentId;
  @JsonKey(name: "twitter_screen_name")
  final String? twitterScreenName;
  @JsonKey(name: "website_url")
  final String? websiteUrl;

  QitaUserData({
    required this.userId,
    required this.name,
    required this.image,
    required this.description,
    required this.facebookId,
    required this.followCount,
    required this.followerCount,
    required this.githubName,
    required this.itemsCount,
    required this.linkedinId,
    required this.location,
    required this.organization,
    required this.permanentId,
    required this.twitterScreenName,
    required this.websiteUrl,
  });

  factory QitaUserData.fromJson(Map<String, dynamic> json) =>
      _$QitaUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$QitaUserDataToJson(this);
}