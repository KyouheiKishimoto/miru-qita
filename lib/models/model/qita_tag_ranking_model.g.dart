// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qita_tag_ranking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      followersCount: json['followers_count'] as int?,
      iconUrl: json['icon_url'] as String?,
      name: json['id'] as String?,
      itemsCount: json['items_count'] as int?,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'followers_count': instance.followersCount,
      'icon_url': instance.iconUrl,
      'id': instance.name,
      'items_count': instance.itemsCount,
    };
