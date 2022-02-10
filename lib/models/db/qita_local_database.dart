import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:miru_qita/models/db/table/freeword_table.dart';
import 'package:miru_qita/models/db/table/user_table.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'dao/freeword_dao.dart';
import 'dao/user_dao.dart';

part 'qita_local_database.g.dart';

/// LocalDBの基本データを設定
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'qita_local_database.db'));
    return NativeDatabase(file);
  });
}

/// LocalDBを構築
@DriftDatabase(tables: [User,FreeWord], daos: [UserDao,FreeWordDao])
class QitaLocalDatabase extends _$QitaLocalDatabase {

  QitaLocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}