import 'package:drift/drift.dart';


class User extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get userId => text().named("ユーザID")();
  TextColumn get name => text().named("ユーザ名")();
  TextColumn get image => text().named("ユーザ画像")();
  TextColumn get description => text().named("説明")();
  TextColumn get facebookId => text().named("facebook_id")();
  IntColumn get followCount => integer().named("フォロー数")();
  IntColumn get followerCount => integer().named("フォロワー数")();
  TextColumn get githubName => text().named("GitHubアカウント名")();
  IntColumn get itemsCount => integer().named("投稿数")();
  TextColumn get linkedinId => text().named("リンク")();
  TextColumn get location => text().named("生息地")();
  TextColumn get organization => text().named("組織")();
  IntColumn get permanentId => integer().named("パーマメントID")();
  TextColumn get twitterScreenName => text().named("Twitterの名前")();
  TextColumn get websiteUrl => text().named("webサイト")();
}
