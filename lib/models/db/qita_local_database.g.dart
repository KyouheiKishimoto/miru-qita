// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qita_local_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UserData extends DataClass implements Insertable<UserData> {
  final int? id;
  final String userId;
  final String name;
  final String image;
  final String description;
  final String facebookId;
  final int followCount;
  final int followerCount;
  final String githubName;
  final int itemsCount;
  final String linkedinId;
  final String location;
  final String organization;
  final int permanentId;
  final String twitterScreenName;
  final String websiteUrl;
  UserData(
      {this.id,
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
      required this.websiteUrl});
  factory UserData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserData(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ユーザID'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ユーザ名'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ユーザ画像'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}説明'])!,
      facebookId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}facebook_id'])!,
      followCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}フォロー数'])!,
      followerCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}フォロワー数'])!,
      githubName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}GitHubアカウント名'])!,
      itemsCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}投稿数'])!,
      linkedinId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}リンク'])!,
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}生息地'])!,
      organization: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}組織'])!,
      permanentId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}パーマメントID'])!,
      twitterScreenName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}Twitterの名前'])!,
      websiteUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}webサイト'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['ユーザID'] = Variable<String>(userId);
    map['ユーザ名'] = Variable<String>(name);
    map['ユーザ画像'] = Variable<String>(image);
    map['説明'] = Variable<String>(description);
    map['facebook_id'] = Variable<String>(facebookId);
    map['フォロー数'] = Variable<int>(followCount);
    map['フォロワー数'] = Variable<int>(followerCount);
    map['GitHubアカウント名'] = Variable<String>(githubName);
    map['投稿数'] = Variable<int>(itemsCount);
    map['リンク'] = Variable<String>(linkedinId);
    map['生息地'] = Variable<String>(location);
    map['組織'] = Variable<String>(organization);
    map['パーマメントID'] = Variable<int>(permanentId);
    map['Twitterの名前'] = Variable<String>(twitterScreenName);
    map['webサイト'] = Variable<String>(websiteUrl);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userId: Value(userId),
      name: Value(name),
      image: Value(image),
      description: Value(description),
      facebookId: Value(facebookId),
      followCount: Value(followCount),
      followerCount: Value(followerCount),
      githubName: Value(githubName),
      itemsCount: Value(itemsCount),
      linkedinId: Value(linkedinId),
      location: Value(location),
      organization: Value(organization),
      permanentId: Value(permanentId),
      twitterScreenName: Value(twitterScreenName),
      websiteUrl: Value(websiteUrl),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<int?>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      description: serializer.fromJson<String>(json['description']),
      facebookId: serializer.fromJson<String>(json['facebookId']),
      followCount: serializer.fromJson<int>(json['followCount']),
      followerCount: serializer.fromJson<int>(json['followerCount']),
      githubName: serializer.fromJson<String>(json['githubName']),
      itemsCount: serializer.fromJson<int>(json['itemsCount']),
      linkedinId: serializer.fromJson<String>(json['linkedinId']),
      location: serializer.fromJson<String>(json['location']),
      organization: serializer.fromJson<String>(json['organization']),
      permanentId: serializer.fromJson<int>(json['permanentId']),
      twitterScreenName: serializer.fromJson<String>(json['twitterScreenName']),
      websiteUrl: serializer.fromJson<String>(json['websiteUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'userId': serializer.toJson<String>(userId),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'description': serializer.toJson<String>(description),
      'facebookId': serializer.toJson<String>(facebookId),
      'followCount': serializer.toJson<int>(followCount),
      'followerCount': serializer.toJson<int>(followerCount),
      'githubName': serializer.toJson<String>(githubName),
      'itemsCount': serializer.toJson<int>(itemsCount),
      'linkedinId': serializer.toJson<String>(linkedinId),
      'location': serializer.toJson<String>(location),
      'organization': serializer.toJson<String>(organization),
      'permanentId': serializer.toJson<int>(permanentId),
      'twitterScreenName': serializer.toJson<String>(twitterScreenName),
      'websiteUrl': serializer.toJson<String>(websiteUrl),
    };
  }

  UserData copyWith(
          {int? id,
          String? userId,
          String? name,
          String? image,
          String? description,
          String? facebookId,
          int? followCount,
          int? followerCount,
          String? githubName,
          int? itemsCount,
          String? linkedinId,
          String? location,
          String? organization,
          int? permanentId,
          String? twitterScreenName,
          String? websiteUrl}) =>
      UserData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        image: image ?? this.image,
        description: description ?? this.description,
        facebookId: facebookId ?? this.facebookId,
        followCount: followCount ?? this.followCount,
        followerCount: followerCount ?? this.followerCount,
        githubName: githubName ?? this.githubName,
        itemsCount: itemsCount ?? this.itemsCount,
        linkedinId: linkedinId ?? this.linkedinId,
        location: location ?? this.location,
        organization: organization ?? this.organization,
        permanentId: permanentId ?? this.permanentId,
        twitterScreenName: twitterScreenName ?? this.twitterScreenName,
        websiteUrl: websiteUrl ?? this.websiteUrl,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('description: $description, ')
          ..write('facebookId: $facebookId, ')
          ..write('followCount: $followCount, ')
          ..write('followerCount: $followerCount, ')
          ..write('githubName: $githubName, ')
          ..write('itemsCount: $itemsCount, ')
          ..write('linkedinId: $linkedinId, ')
          ..write('location: $location, ')
          ..write('organization: $organization, ')
          ..write('permanentId: $permanentId, ')
          ..write('twitterScreenName: $twitterScreenName, ')
          ..write('websiteUrl: $websiteUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      userId,
      name,
      image,
      description,
      facebookId,
      followCount,
      followerCount,
      githubName,
      itemsCount,
      linkedinId,
      location,
      organization,
      permanentId,
      twitterScreenName,
      websiteUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.image == this.image &&
          other.description == this.description &&
          other.facebookId == this.facebookId &&
          other.followCount == this.followCount &&
          other.followerCount == this.followerCount &&
          other.githubName == this.githubName &&
          other.itemsCount == this.itemsCount &&
          other.linkedinId == this.linkedinId &&
          other.location == this.location &&
          other.organization == this.organization &&
          other.permanentId == this.permanentId &&
          other.twitterScreenName == this.twitterScreenName &&
          other.websiteUrl == this.websiteUrl);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int?> id;
  final Value<String> userId;
  final Value<String> name;
  final Value<String> image;
  final Value<String> description;
  final Value<String> facebookId;
  final Value<int> followCount;
  final Value<int> followerCount;
  final Value<String> githubName;
  final Value<int> itemsCount;
  final Value<String> linkedinId;
  final Value<String> location;
  final Value<String> organization;
  final Value<int> permanentId;
  final Value<String> twitterScreenName;
  final Value<String> websiteUrl;
  const UserCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.description = const Value.absent(),
    this.facebookId = const Value.absent(),
    this.followCount = const Value.absent(),
    this.followerCount = const Value.absent(),
    this.githubName = const Value.absent(),
    this.itemsCount = const Value.absent(),
    this.linkedinId = const Value.absent(),
    this.location = const Value.absent(),
    this.organization = const Value.absent(),
    this.permanentId = const Value.absent(),
    this.twitterScreenName = const Value.absent(),
    this.websiteUrl = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String name,
    required String image,
    required String description,
    required String facebookId,
    required int followCount,
    required int followerCount,
    required String githubName,
    required int itemsCount,
    required String linkedinId,
    required String location,
    required String organization,
    required int permanentId,
    required String twitterScreenName,
    required String websiteUrl,
  })  : userId = Value(userId),
        name = Value(name),
        image = Value(image),
        description = Value(description),
        facebookId = Value(facebookId),
        followCount = Value(followCount),
        followerCount = Value(followerCount),
        githubName = Value(githubName),
        itemsCount = Value(itemsCount),
        linkedinId = Value(linkedinId),
        location = Value(location),
        organization = Value(organization),
        permanentId = Value(permanentId),
        twitterScreenName = Value(twitterScreenName),
        websiteUrl = Value(websiteUrl);
  static Insertable<UserData> custom({
    Expression<int?>? id,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<String>? image,
    Expression<String>? description,
    Expression<String>? facebookId,
    Expression<int>? followCount,
    Expression<int>? followerCount,
    Expression<String>? githubName,
    Expression<int>? itemsCount,
    Expression<String>? linkedinId,
    Expression<String>? location,
    Expression<String>? organization,
    Expression<int>? permanentId,
    Expression<String>? twitterScreenName,
    Expression<String>? websiteUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'ユーザID': userId,
      if (name != null) 'ユーザ名': name,
      if (image != null) 'ユーザ画像': image,
      if (description != null) '説明': description,
      if (facebookId != null) 'facebook_id': facebookId,
      if (followCount != null) 'フォロー数': followCount,
      if (followerCount != null) 'フォロワー数': followerCount,
      if (githubName != null) 'GitHubアカウント名': githubName,
      if (itemsCount != null) '投稿数': itemsCount,
      if (linkedinId != null) 'リンク': linkedinId,
      if (location != null) '生息地': location,
      if (organization != null) '組織': organization,
      if (permanentId != null) 'パーマメントID': permanentId,
      if (twitterScreenName != null) 'Twitterの名前': twitterScreenName,
      if (websiteUrl != null) 'webサイト': websiteUrl,
    });
  }

  UserCompanion copyWith(
      {Value<int?>? id,
      Value<String>? userId,
      Value<String>? name,
      Value<String>? image,
      Value<String>? description,
      Value<String>? facebookId,
      Value<int>? followCount,
      Value<int>? followerCount,
      Value<String>? githubName,
      Value<int>? itemsCount,
      Value<String>? linkedinId,
      Value<String>? location,
      Value<String>? organization,
      Value<int>? permanentId,
      Value<String>? twitterScreenName,
      Value<String>? websiteUrl}) {
    return UserCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      facebookId: facebookId ?? this.facebookId,
      followCount: followCount ?? this.followCount,
      followerCount: followerCount ?? this.followerCount,
      githubName: githubName ?? this.githubName,
      itemsCount: itemsCount ?? this.itemsCount,
      linkedinId: linkedinId ?? this.linkedinId,
      location: location ?? this.location,
      organization: organization ?? this.organization,
      permanentId: permanentId ?? this.permanentId,
      twitterScreenName: twitterScreenName ?? this.twitterScreenName,
      websiteUrl: websiteUrl ?? this.websiteUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (userId.present) {
      map['ユーザID'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['ユーザ名'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['ユーザ画像'] = Variable<String>(image.value);
    }
    if (description.present) {
      map['説明'] = Variable<String>(description.value);
    }
    if (facebookId.present) {
      map['facebook_id'] = Variable<String>(facebookId.value);
    }
    if (followCount.present) {
      map['フォロー数'] = Variable<int>(followCount.value);
    }
    if (followerCount.present) {
      map['フォロワー数'] = Variable<int>(followerCount.value);
    }
    if (githubName.present) {
      map['GitHubアカウント名'] = Variable<String>(githubName.value);
    }
    if (itemsCount.present) {
      map['投稿数'] = Variable<int>(itemsCount.value);
    }
    if (linkedinId.present) {
      map['リンク'] = Variable<String>(linkedinId.value);
    }
    if (location.present) {
      map['生息地'] = Variable<String>(location.value);
    }
    if (organization.present) {
      map['組織'] = Variable<String>(organization.value);
    }
    if (permanentId.present) {
      map['パーマメントID'] = Variable<int>(permanentId.value);
    }
    if (twitterScreenName.present) {
      map['Twitterの名前'] = Variable<String>(twitterScreenName.value);
    }
    if (websiteUrl.present) {
      map['webサイト'] = Variable<String>(websiteUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('description: $description, ')
          ..write('facebookId: $facebookId, ')
          ..write('followCount: $followCount, ')
          ..write('followerCount: $followerCount, ')
          ..write('githubName: $githubName, ')
          ..write('itemsCount: $itemsCount, ')
          ..write('linkedinId: $linkedinId, ')
          ..write('location: $location, ')
          ..write('organization: $organization, ')
          ..write('permanentId: $permanentId, ')
          ..write('twitterScreenName: $twitterScreenName, ')
          ..write('websiteUrl: $websiteUrl')
          ..write(')'))
        .toString();
  }
}

class $UserTable extends User with TableInfo<$UserTable, UserData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UserTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'ユーザID', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'ユーザ名', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'ユーザ画像', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      '説明', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _facebookIdMeta = const VerificationMeta('facebookId');
  @override
  late final GeneratedColumn<String?> facebookId = GeneratedColumn<String?>(
      'facebook_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _followCountMeta =
      const VerificationMeta('followCount');
  @override
  late final GeneratedColumn<int?> followCount = GeneratedColumn<int?>(
      'フォロー数', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _followerCountMeta =
      const VerificationMeta('followerCount');
  @override
  late final GeneratedColumn<int?> followerCount = GeneratedColumn<int?>(
      'フォロワー数', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _githubNameMeta = const VerificationMeta('githubName');
  @override
  late final GeneratedColumn<String?> githubName = GeneratedColumn<String?>(
      'GitHubアカウント名', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _itemsCountMeta = const VerificationMeta('itemsCount');
  @override
  late final GeneratedColumn<int?> itemsCount = GeneratedColumn<int?>(
      '投稿数', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _linkedinIdMeta = const VerificationMeta('linkedinId');
  @override
  late final GeneratedColumn<String?> linkedinId = GeneratedColumn<String?>(
      'リンク', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  @override
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      '生息地', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _organizationMeta =
      const VerificationMeta('organization');
  @override
  late final GeneratedColumn<String?> organization = GeneratedColumn<String?>(
      '組織', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _permanentIdMeta =
      const VerificationMeta('permanentId');
  @override
  late final GeneratedColumn<int?> permanentId = GeneratedColumn<int?>(
      'パーマメントID', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _twitterScreenNameMeta =
      const VerificationMeta('twitterScreenName');
  @override
  late final GeneratedColumn<String?> twitterScreenName =
      GeneratedColumn<String?>('Twitterの名前', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _websiteUrlMeta = const VerificationMeta('websiteUrl');
  @override
  late final GeneratedColumn<String?> websiteUrl = GeneratedColumn<String?>(
      'webサイト', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        name,
        image,
        description,
        facebookId,
        followCount,
        followerCount,
        githubName,
        itemsCount,
        linkedinId,
        location,
        organization,
        permanentId,
        twitterScreenName,
        websiteUrl
      ];
  @override
  String get aliasedName => _alias ?? 'user';
  @override
  String get actualTableName => 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ユーザID')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['ユーザID']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('ユーザ名')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['ユーザ名']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('ユーザ画像')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['ユーザ画像']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('説明')) {
      context.handle(_descriptionMeta,
          description.isAcceptableOrUnknown(data['説明']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('facebook_id')) {
      context.handle(
          _facebookIdMeta,
          facebookId.isAcceptableOrUnknown(
              data['facebook_id']!, _facebookIdMeta));
    } else if (isInserting) {
      context.missing(_facebookIdMeta);
    }
    if (data.containsKey('フォロー数')) {
      context.handle(_followCountMeta,
          followCount.isAcceptableOrUnknown(data['フォロー数']!, _followCountMeta));
    } else if (isInserting) {
      context.missing(_followCountMeta);
    }
    if (data.containsKey('フォロワー数')) {
      context.handle(
          _followerCountMeta,
          followerCount.isAcceptableOrUnknown(
              data['フォロワー数']!, _followerCountMeta));
    } else if (isInserting) {
      context.missing(_followerCountMeta);
    }
    if (data.containsKey('GitHubアカウント名')) {
      context.handle(
          _githubNameMeta,
          githubName.isAcceptableOrUnknown(
              data['GitHubアカウント名']!, _githubNameMeta));
    } else if (isInserting) {
      context.missing(_githubNameMeta);
    }
    if (data.containsKey('投稿数')) {
      context.handle(_itemsCountMeta,
          itemsCount.isAcceptableOrUnknown(data['投稿数']!, _itemsCountMeta));
    } else if (isInserting) {
      context.missing(_itemsCountMeta);
    }
    if (data.containsKey('リンク')) {
      context.handle(_linkedinIdMeta,
          linkedinId.isAcceptableOrUnknown(data['リンク']!, _linkedinIdMeta));
    } else if (isInserting) {
      context.missing(_linkedinIdMeta);
    }
    if (data.containsKey('生息地')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['生息地']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('組織')) {
      context.handle(_organizationMeta,
          organization.isAcceptableOrUnknown(data['組織']!, _organizationMeta));
    } else if (isInserting) {
      context.missing(_organizationMeta);
    }
    if (data.containsKey('パーマメントID')) {
      context.handle(
          _permanentIdMeta,
          permanentId.isAcceptableOrUnknown(
              data['パーマメントID']!, _permanentIdMeta));
    } else if (isInserting) {
      context.missing(_permanentIdMeta);
    }
    if (data.containsKey('Twitterの名前')) {
      context.handle(
          _twitterScreenNameMeta,
          twitterScreenName.isAcceptableOrUnknown(
              data['Twitterの名前']!, _twitterScreenNameMeta));
    } else if (isInserting) {
      context.missing(_twitterScreenNameMeta);
    }
    if (data.containsKey('webサイト')) {
      context.handle(_websiteUrlMeta,
          websiteUrl.isAcceptableOrUnknown(data['webサイト']!, _websiteUrlMeta));
    } else if (isInserting) {
      context.missing(_websiteUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return UserData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(_db, alias);
  }
}

class FreeWordData extends DataClass implements Insertable<FreeWordData> {
  final int? id;
  final String freeWord;
  FreeWordData({this.id, required this.freeWord});
  factory FreeWordData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FreeWordData(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      freeWord: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}フリーワード'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['フリーワード'] = Variable<String>(freeWord);
    return map;
  }

  FreeWordCompanion toCompanion(bool nullToAbsent) {
    return FreeWordCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      freeWord: Value(freeWord),
    );
  }

  factory FreeWordData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FreeWordData(
      id: serializer.fromJson<int?>(json['id']),
      freeWord: serializer.fromJson<String>(json['freeWord']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'freeWord': serializer.toJson<String>(freeWord),
    };
  }

  FreeWordData copyWith({int? id, String? freeWord}) => FreeWordData(
        id: id ?? this.id,
        freeWord: freeWord ?? this.freeWord,
      );
  @override
  String toString() {
    return (StringBuffer('FreeWordData(')
          ..write('id: $id, ')
          ..write('freeWord: $freeWord')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, freeWord);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FreeWordData &&
          other.id == this.id &&
          other.freeWord == this.freeWord);
}

class FreeWordCompanion extends UpdateCompanion<FreeWordData> {
  final Value<int?> id;
  final Value<String> freeWord;
  const FreeWordCompanion({
    this.id = const Value.absent(),
    this.freeWord = const Value.absent(),
  });
  FreeWordCompanion.insert({
    this.id = const Value.absent(),
    required String freeWord,
  }) : freeWord = Value(freeWord);
  static Insertable<FreeWordData> custom({
    Expression<int?>? id,
    Expression<String>? freeWord,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (freeWord != null) 'フリーワード': freeWord,
    });
  }

  FreeWordCompanion copyWith({Value<int?>? id, Value<String>? freeWord}) {
    return FreeWordCompanion(
      id: id ?? this.id,
      freeWord: freeWord ?? this.freeWord,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (freeWord.present) {
      map['フリーワード'] = Variable<String>(freeWord.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FreeWordCompanion(')
          ..write('id: $id, ')
          ..write('freeWord: $freeWord')
          ..write(')'))
        .toString();
  }
}

class $FreeWordTable extends FreeWord
    with TableInfo<$FreeWordTable, FreeWordData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FreeWordTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _freeWordMeta = const VerificationMeta('freeWord');
  @override
  late final GeneratedColumn<String?> freeWord = GeneratedColumn<String?>(
      'フリーワード', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, freeWord];
  @override
  String get aliasedName => _alias ?? 'free_word';
  @override
  String get actualTableName => 'free_word';
  @override
  VerificationContext validateIntegrity(Insertable<FreeWordData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('フリーワード')) {
      context.handle(_freeWordMeta,
          freeWord.isAcceptableOrUnknown(data['フリーワード']!, _freeWordMeta));
    } else if (isInserting) {
      context.missing(_freeWordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FreeWordData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FreeWordData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FreeWordTable createAlias(String alias) {
    return $FreeWordTable(_db, alias);
  }
}

abstract class _$QitaLocalDatabase extends GeneratedDatabase {
  _$QitaLocalDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $UserTable user = $UserTable(this);
  late final $FreeWordTable freeWord = $FreeWordTable(this);
  late final UserDao userDao = UserDao(this as QitaLocalDatabase);
  late final FreeWordDao freeWordDao = FreeWordDao(this as QitaLocalDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [user, freeWord];
}
