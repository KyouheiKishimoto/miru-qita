import 'package:json_annotation/json_annotation.dart';
import 'package:miru_qita/models/model/qita_user_model.dart';

part 'qita_article_model.g.dart';

/// Qita記事のモデル
@JsonSerializable()
class Article {
  @JsonKey(name: "rendered_body")
  final String? renderedBody;
  final String? body;
  final bool coediting;
  @JsonKey(name: "comments_count")
  final int? commentsCount;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  final String? group;
  final String? id;
  @JsonKey(name: "likes_count")
  final int? likesCount;
  final bool private;
  @JsonKey(name: "reactions_count")
  final int? reactionsCount;
  final List<Tags>? tags;
  final String? title;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  final String? url;
  final QitaUserData user;
  @JsonKey(name: "page_views_count")
  final int? pageViewsCount;
  @JsonKey(name: "team_membership")
  final String? teamMembership;

  Article({
    required this.renderedBody,
    required this.body,
    required this.coediting,
    required this.commentsCount,
    required this.createdAt,
    required this.group,
    required this.id,
    required this.likesCount,
    required this.private,
    required this.reactionsCount,
    required this.tags,
    required this.title,
    required this.updatedAt,
    required this.url,
    required this.user,
    required this.pageViewsCount,
    required this.teamMembership,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

/// Qita記事のタグモデル
@JsonSerializable()
class Tags {
  final String? name;

  Tags({this.name});

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);

  Map<String, dynamic> toJson() => _$TagsToJson(this);
}
