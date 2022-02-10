// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qita_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QitaUserData _$QitaUserDataFromJson(Map<String, dynamic> json) => QitaUserData(
      userId: json['id'] as String?,
      name: json['name'] as String?,
      image: json['profile_image_url'] as String?,
      description: json['description'] as String?,
      facebookId: json['facebook_id'] as String?,
      followCount: json['followees_count'] as int,
      followerCount: json['followers_count'] as int,
      githubName: json['github_login_name'] as String?,
      itemsCount: json['items_count'] as int,
      linkedinId: json['linkedin_id'] as String?,
      location: json['location'] as String?,
      organization: json['organization'] as String?,
      permanentId: json['permanent_id'] as int,
      twitterScreenName: json['twitter_screen_name'] as String?,
      websiteUrl: json['website_url'] as String?,
    );

Map<String, dynamic> _$QitaUserDataToJson(QitaUserData instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'name': instance.name,
      'profile_image_url': instance.image,
      'description': instance.description,
      'facebook_id': instance.facebookId,
      'followees_count': instance.followCount,
      'followers_count': instance.followerCount,
      'github_login_name': instance.githubName,
      'items_count': instance.itemsCount,
      'linkedin_id': instance.linkedinId,
      'location': instance.location,
      'organization': instance.organization,
      'permanent_id': instance.permanentId,
      'twitter_screen_name': instance.twitterScreenName,
      'website_url': instance.websiteUrl,
    };
