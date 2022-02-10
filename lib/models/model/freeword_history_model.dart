import 'package:json_annotation/json_annotation.dart';

part 'freeword_history_model.g.dart';

/// Qita記事のモデル
@JsonSerializable()
class FreeWordHistory {
  final int? id;
  final String? freeWord;

  FreeWordHistory({required this.id, required this.freeWord});

  factory FreeWordHistory.fromJson(Map<String, dynamic> json) =>
      _$FreeWordHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$FreeWordHistoryToJson(this);

}
