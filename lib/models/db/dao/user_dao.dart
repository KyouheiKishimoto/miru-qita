import 'package:drift/drift.dart';
import 'package:miru_qita/models/db/table/user_table.dart';
import 'package:miru_qita/models/db/qita_local_database.dart';

part 'user_dao.g.dart';

/// ユーザーテーブルの操作
@DriftAccessor(tables: [User])
class UserDao extends DatabaseAccessor<QitaLocalDatabase> with _$UserDaoMixin {
  UserDao(QitaLocalDatabase attachedDatabase) : super(attachedDatabase);

  /// インサート処理
  Future insertQitaUserData(UserData insertData) async {
    await batch(
      (batch) {
        batch.insert(user, insertData);
      },
    );
  }

  /// 全データ取得
  Future<List<UserData>?>? get getAllQitaUserData => select(user).get();

  /// インサートしたあと全てのデータを取得しなおして返す
  Future<List<UserData>?>? insertAndReadFreeWordDataFromDB(
      UserData userData) => transaction(() async{
    await insertQitaUserData(userData);
    return await getAllQitaUserData;
  });

  /// 特定のユーザー情報を取得する
  Future<UserData?> getSearchHistoryData(UserData selectData) async {
    return (select(user)
          ..where((t) => t.userId.equals(selectData.userId.toString()))
          ..limit(1))
        .getSingleOrNull();
  }

  /// 特定のUserIdを削除する
  deleteUserId(userId) async{
    await (delete(user)..where((it) => it.userId.equals(userId))).go();
  }
}
