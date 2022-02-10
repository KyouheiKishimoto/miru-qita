import 'package:fluttertoast/fluttertoast.dart';

/**
 * 通信状況
 */
enum LoadStatus {
  DONE,           // 完了または異常なし
  LOADING,        // ロード中
  RESPONSE_ERROR, // レスポンスエラー
  NETWORK_ERROR   // ネットワークエラー
}

/**
 * 通信状態のエラ〜メッセージ管理
 */
extension TypeExtension on LoadStatus {
  static final errorMessages = {
    LoadStatus.RESPONSE_ERROR: 'ユーザーが存在しません',
    LoadStatus.NETWORK_ERROR: 'ネットワークが不安定です。',
  };

  String? get errorMessage => errorMessages[this];
}

/**
 * 通信状態の管理クラスを宣言
 */
abstract class LoadManagement {

  LoadStatus _loadStatus = LoadStatus.DONE;
  LoadStatus get loadStatus => _loadStatus;

  /// 通信状態のエラーメッセージを表示する
  showLoadErrorMessage(){
    Fluttertoast.showToast(
      timeInSecForIosWeb: 1,
      msg: _loadStatus.errorMessage!,
    );
  }

  /// 通信状態をセットする
  ///
  /// [status] LoadStatus 通信状況
  ///
  /// 使用方法：基本はリポジトリで宣言しているローカル変数を参照して使用する。
  setLoadStatus(LoadStatus status){
    _loadStatus = status;
  }
}