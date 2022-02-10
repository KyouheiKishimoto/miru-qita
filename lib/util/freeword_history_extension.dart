import 'package:miru_qita/models/db/qita_local_database.dart';
import 'package:miru_qita/models/model/freeword_history_model.dart';


/// モデルクラスからテーブルのモデルクラスにコンバート処理
extension ConvertToUserData on FreeWordHistory? {
  FreeWordData toFreeWordData(FreeWordHistory freeWordHistory) {
    return FreeWordData(
      id: freeWordHistory.id ?? null,
      freeWord: freeWordHistory.freeWord ?? "",
    );
  }
}

/// モデルクラスからテーブルのモデルクラスにコンバート処理
extension ConvertToFreeWordHistory on List<FreeWordHistory>? {
  List<FreeWordData>? toFreeWordData(List<FreeWordHistory> freeWordHistory) {
    List<FreeWordData>? freeWordDatas = [];
    freeWordHistory.forEach((value) {
      freeWordDatas.add(FreeWordData(freeWord: value.freeWord ?? ""));
    });
    return freeWordDatas;
  }
}

/// テーブルのモデルクラスからモデルクラスにコンバート処理
extension ConvertToFreeWordData on List<FreeWordData>? {
  List<FreeWordHistory>? toFreeWordHistory(List<FreeWordData> freeWordData) {
    List<FreeWordHistory>? freeWordHistorys = [];
    freeWordData.forEach((value) {
      freeWordHistorys.add(FreeWordHistory(
        id: null,
        freeWord: value.freeWord,
      ));
    });
    return freeWordHistorys;
  }
}
