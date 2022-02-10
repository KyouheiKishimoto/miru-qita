import 'package:drift/drift.dart';
import 'package:miru_qita/models/db/table/freeword_table.dart';
import 'package:miru_qita/models/db/qita_local_database.dart';

part 'freeword_dao.g.dart';

/// フリーワードテーブルの操作
@DriftAccessor(tables: [FreeWord])
class FreeWordDao extends DatabaseAccessor<QitaLocalDatabase> with _$FreeWordDaoMixin {
  FreeWordDao(QitaLocalDatabase attachedDatabase) : super(attachedDatabase);

  /// 特定のFreeWordを1レコード削除する
  deleteFreeWord(String deleteWord) async{
    await (delete(freeWord)..where((it) => it.freeWord.equals(deleteWord))).go();
  }

  /// インサート処理
  Future insertFreeWordData(FreeWordData insertData) async {
    await batch(
          (batch) {
        batch.insert(freeWord, insertData);
      },
    );
  }

  /// 全データ取得
  Future<List<FreeWordData>?>? get getAllFreeWordData => select(freeWord).get();

  /// インサートしたあと全てのデータを取得しなおして返す
  Future<List<FreeWordData>?>? insertAndReadFreeWordDataFromDB(
      FreeWordData freeWordData) => transaction(() async{
    await insertFreeWordData(freeWordData);
    return await getAllFreeWordData;
  });
}