import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:miru_qita/data/common/load_status.dart';
import 'package:miru_qita/data/common/search_type.dart';
import 'package:miru_qita/models/model/freeword_history_model.dart';
import 'package:miru_qita/models/model/qita_user_model.dart';
import 'package:miru_qita/models/repository/qita_repository.dart';

/// 検索画面のViewModel
class SearchViewModel extends ChangeNotifier {
  late final QitaRepository _qitaRepository;

  SearchViewModel({qitaRepository}) {
    _qitaRepository = qitaRepository;
  }

  // 通信状況
  LoadStatus _loadStatus = LoadStatus.DONE;
  LoadStatus get loadStatus => _loadStatus;

  // 検索タイプ
  SearchType _searchType = SearchType.FREEWORD;
  SearchType get searchType => _searchType;

  // 検索のエラータイプ
  SearchErrorType _searchErrorType = SearchErrorType.DONE;
  SearchErrorType get searchErrorType => _searchErrorType;

  // 検索フォームコントローラー
  TextEditingController _qitaEditTextController = TextEditingController();
  TextEditingController get qitaEditTextController => _qitaEditTextController;

  // フリーワードデータ
  List<FreeWordHistory>? _freeWordHistory;
  List<FreeWordHistory>? get freewordHistory => _freeWordHistory;

  // ユーザーデータ
  // User情報
  List<QitaUserData>? _qitaListUserData;
  List<QitaUserData>? get qitaListUserData => _qitaListUserData;

  /// 検索タイプを変更する
  changeSearchType(SearchType searchType) {
    _searchType = searchType;
    notifyListeners();
  }

  /// 検索内容をLocalDBに保存する
  saveSearchWord(SearchType searchType, String searchWord) async{
    await _qitaRepository.saveSearchWord(searchType,searchWord);
  }

  /// LocalDBからフリーワードを取得する
  getFreeWordDataFromLocalDB() async{
    await _qitaRepository.getFreeWordDataFromLocalDB();
  }

  getUserIdDataFromLocalDB() async{
    await _qitaRepository.getQitaUserDataFromLocalDB();
  }

  /// フリーワードを削除する
  deleteFreeWord(String freeWord) async{
    await _qitaRepository.deleteFreeWord(freeWord);
  }

  /// UserIdを削除する
  deleteUserId(String userId) async{
    await _qitaRepository.deleteUserId(userId);
  }

  /// 検索タイプごとに条件があれば制御するメソッド
  ///
  /// [String] 検索ワード
  ///
  /// return[bool] 検索OK：True , 検索NG；False
  bool canSearchQitaArticleData(String searchWord) {
    if (searchType == SearchType.USERID) {
      if (isEditTextData(searchWord)) {
        return true;
      }else{
        showEditTextErrorMessage();
        return false;
      }
    }else{
      return true;
    }
  }

  /// Qitaユーザーが存在するかどうか
  ///
  /// [String]　QitaID
  ///
  /// return[bool] true:存在する, false:存在しない
  Future<bool> existsQitaUserData(String userId) async{
    return await _qitaRepository.existsQitaUserData(userId);
  }

  /// 入力フォームに期待された内容がちゃんと入力されているかどうか
  ///
  /// [editText]入力された内容
  ///
  /// return[bool] true:正常値 / false:異常値
  bool isEditTextData(String editText) {
    if (editText.isNotEmpty) {
      if (RegExp(r'^[0-9a-zA-Z.?/-_]*$').hasMatch(editText)) {
        return true;
      } else {
        _searchErrorType = SearchErrorType.NOT_ALPHANUMERIC;
        return false;
      }
    } else {
      _searchErrorType = SearchErrorType.EMPTY;
      return false;
    }
  }

  /// 入力フォームのエラー内容をトーストで表示する
  showEditTextErrorMessage() {
    Fluttertoast.showToast(
      timeInSecForIosWeb: 1,
      msg: "入力エラー : ${_searchErrorType.errorMessage}",
    );
  }

  /// 入力フォームのエラー内容をトーストで表示する
  showNoneQitaUserErrorMessage() {
    Fluttertoast.showToast(
      timeInSecForIosWeb: 1,
      msg: "入力エラー :　ユーザーが存在しませんでした。",
    );
  }

  /// リポジトリの値を取得し、Viewに自動更新する処理
  onRepositoryUpdated(QitaRepository repository) {
    _freeWordHistory = repository.freeWordHistory;
    _qitaListUserData = repository.qitaListUserData;
    notifyListeners();
  }

}
