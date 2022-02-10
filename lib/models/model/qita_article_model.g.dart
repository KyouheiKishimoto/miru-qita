// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qita_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      renderedBody: json['rendered_body'] as String?,
      body: json['body'] as String?,
      coediting: json['coediting'] as bool,
      commentsCount: json['comments_count'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      group: json['group'] as String?,
      id: json['id'] as String?,
      likesCount: json['likes_count'] as int?,
      private: json['private'] as bool,
      reactionsCount: json['reactions_count'] as int?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tags.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      url: json['url'] as String?,
      user: QitaUserData.fromJson(json['user'] as Map<String, dynamic>),
      pageViewsCount: json['page_views_count'] as int?,
      teamMembership: json['team_membership'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'rendered_body': instance.renderedBody,
      'body': instance.body,
      'coediting': instance.coediting,
      'comments_count': instance.commentsCount,
      'created_at': instance.createdAt?.toIso8601String(),
      'group': instance.group,
      'id': instance.id,
      'likes_count': instance.likesCount,
      'private': instance.private,
      'reactions_count': instance.reactionsCount,
      'tags': instance.tags,
      'title': instance.title,
      'updated_at': instance.updatedAt.toIso8601String(),
      'url': instance.url,
      'user': instance.user,
      'page_views_count': instance.pageViewsCount,
      'team_membership': instance.teamMembership,
    };

Tags _$TagsFromJson(Map<String, dynamic> json) => Tags(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'name': instance.name,
    };
