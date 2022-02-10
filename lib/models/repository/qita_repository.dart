import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:miru_qita/data/common/load_status.dart';
import 'package:miru_qita/data/common/search_type.dart';
import 'package:miru_qita/models/db/dao/freeword_dao.dart';
import 'package:miru_qita/models/db/dao/user_dao.dart';
import 'package:miru_qita/models/model/freeword_history_model.dart';
import 'package:miru_qita/models/model/qita_article_model.dart';
import 'package:miru_qita/models/model/qita_tag_ranking_model.dart';
import 'package:miru_qita/models/model/qita_user_model.dart';
import 'package:miru_qita/models/networking/qita_api_service.dart';
import 'package:miru_qita/util/qita_user_extension.dart';
import 'package:miru_qita/util/freeword_history_extension.dart';

/// Qita系のリポジトリ
class QitaRepository extends ChangeNotifier {
  late final QitaApiService _qitaApiService;
  late final UserDao _userDao;
  late final FreeWordDao _freeWordDao;

  QitaRepository({userDao, qitaApiService, freeWordDao}) {
    _userDao = userDao;
    _qitaApiService = qitaApiService;
    _freeWordDao = freeWordDao;
  }

  // 通信状況
  LoadStatus _loadStatus = LoadStatus.DONE;
  LoadStatus get loadStatus => _loadStatus;

  // 注目の言語
  List<Tag>? _tag;
  List<Tag>? get tag => _tag;

  // 注目の記事
  List<Article>? _article;
  List<Article>? get article => _article;

  // User情報
  QitaUserData? _qitaUserData;
  QitaUserData? get qitaUserData => _qitaUserData;

  // User情報
  List<QitaUserData>? _qitaListUserData;
  List<QitaUserData>? get qitaListUserData => _qitaListUserData;

  // フリーワード履歴
  List<FreeWordHistory>? _freeWordHistory;
  List<FreeWordHistory>? get freeWordHistory => _freeWordHistory;

  /// 注目の言語・タグを取得する
  getTagRanking() async {
    // 通信状態を変更
    _loadStatus = LoadStatus.LOADING;
    notifyListeners();

    Response response;

    try {
      response = await _qitaApiService.getTagRanking();
      if (response.isSuccessful) {
        List<dynamic> responseBody = response.body;

        _tag = responseBody.map((i) => Tag.fromJson(i)).toList();

        // 取得完了
        _loadStatus = LoadStatus.DONE;
      }
    } on Exception catch (error) {
      // ネットワークエラー
      _loadStatus = LoadStatus.NETWORK_ERROR;

      print("error: $error");
    } finally {
      notifyListeners();
    }
  }

  /// ユーザーの記事一覧を取得
  getUserArticlesData(String userId) async {
    // 通信状態を変更
    _loadStatus = LoadStatus.LOADING;
    notifyListeners();

    Response response;

    try {
      response = await _qitaApiService.getUserArticlesData(userId);
      if (response.isSuccessful) {
        List<dynamic> responseBody = response.body;

        // 取得完了
        _loadStatus = LoadStatus.DONE;

        _article = responseBody.map((i) => Article.fromJson(i)).toList();
      } else {
        final errorCode = response.statusCode;
        final error = response.error;
        // 取得エラー
        _loadStatus = LoadStatus.RESPONSE_ERROR;

        print("response is not successful: $errorCode / $error");
      }
    } on Exception catch (error) {
      // ネットワークエラー
      _loadStatus = LoadStatus.NETWORK_ERROR;

      print("error: $error");
    } finally {
      notifyListeners();
    }
  }

  /// ユーザー情報を取得
  getQitaUserData(String userId) async {
    // 通信状態を変更
    _loadStatus = LoadStatus.LOADING;
    notifyListeners();

    Response response;

    try {
      response = await _qitaApiService.getUserData(userId);
      if (response.isSuccessful) {
        final responseBody = response.body;

        // 取得完了
        _loadStatus = LoadStatus.DONE;

        _qitaUserData = QitaUserData.fromJson(responseBody);
      } else {
        final errorCode = response.statusCode;
        final error = response.error;
        // 取得エラー
        _loadStatus = LoadStatus.RESPONSE_ERROR;

        print("response is not successful: $errorCode / $error");
      }
    } on Exception catch (error) {
      // ネットワークエラー
      _loadStatus = LoadStatus.NETWORK_ERROR;

      print("error: $error");
    } finally {
      notifyListeners();
    }
  }

  /// 記事を取得
  getArticleData(String article) async {
    // 通信状態を変更
    _loadStatus = LoadStatus.LOADING;
    notifyListeners();

    Response response;

    try {
      response = await _qitaApiService.getArticle(query: article);
      if (response.isSuccessful) {
        List<dynamic> responseBody = response.body;

        _article = responseBody.map((i) => Article.fromJson(i)).toList();

        // 取得完了
        _loadStatus = LoadStatus.DONE;
      }
    } on Exception catch (error) {
      // ネットワークエラー
      _loadStatus = LoadStatus.NETWORK_ERROR;

      print("error: $error");
    } finally {
      notifyListeners();
    }
  }

  /// 検索内容をLocalDBに保存する
  saveSearchWord(SearchType searchType, String searchWord) async {
    switch (searchType) {
      case SearchType.FREEWORD:
        // 検索内容をそのまま保存し、保存している内容を更新する
        await insertAndReadFreeWordFromDB(searchWord);
        break;
      case SearchType.USERID:
        // ユーザー情報をQitaNetworkingから取得してそのまま保存し、保存している内容を更新する
        await getAndInsertAndReadQitaUserData(searchWord);
        break;
    }
    notifyListeners();
  }

  /// フリーワードデータをLocalDBから全て取得し更新する
  getFreeWordDataFromLocalDB() async {
    final freeWordDataFromDB = await _freeWordDao.getAllFreeWordData;
    _freeWordHistory =
        freeWordDataFromDB.toFreeWordHistory(freeWordDataFromDB!);
    notifyListeners();
  }

  /// QitaユーザーデータをLocalDBから全て取得し更新する
  getQitaUserDataFromLocalDB() async {
    final qitaUserDataFromDB = await _userDao.getAllQitaUserData;
    _qitaListUserData = qitaUserDataFromDB.toQitaUserData(qitaUserDataFromDB);
    notifyListeners();
  }

  /// フリーワードを削除する
  deleteFreeWord(String freeWord) async {
    _freeWordDao.deleteFreeWord(freeWord);
    // 削除後、値を再取得して更新する
    getFreeWordDataFromLocalDB();
  }

  /// ユーザーIDを削除する
  deleteUserId(userId) {
    _userDao.deleteUserId(userId);
    getQitaUserDataFromLocalDB();
  }

  /// QitaUserData取得⇨インサート⇨ローカルDBからデータを取得し更新する
  ///
  /// TODO:メソッド名と処理がダサダサなので変えたい
  getAndInsertAndReadQitaUserData(String searchWord) async {
    Response response;
    try {
      response = await _qitaApiService.getUserData(searchWord);
      if (response.isSuccessful) {
        final responseBody = response.body;
        // 取得完了
        _loadStatus = LoadStatus.DONE;
        insertAndReadQitaUserDataFromDB(responseBody);
      } else {
        // 取得エラー
        _loadStatus = LoadStatus.RESPONSE_ERROR;
      }
    } on Exception catch (error) {
      // ネットワークエラー
      _loadStatus = LoadStatus.NETWORK_ERROR;
      print("Error: " + error.toString());
    }
  }

  /// QitaUserDataをDBにインサートするか、すでに存在するならそのまま渡す処理
  ///
  /// [responseBody] QitaAPIから取ってきた値
  insertAndReadQitaUserDataFromDB(responseBody) async {
    final qitaUserDataFromNetwork = QitaUserData.fromJson(responseBody);
    //既に登録されているユーザーは保存しない
    final listUserData = await _userDao.insertAndReadFreeWordDataFromDB(
        qitaUserDataFromNetwork.toUserData(qitaUserDataFromNetwork));

    _qitaListUserData = listUserData.toQitaUserData(listUserData);
  }

  /// フリーワードをインサート後、インサートしたデータをセットする
  insertAndReadFreeWordFromDB(String searchWord) async {
    final freeWordData = FreeWordHistory(id: null, freeWord: searchWord);

    final freeWordDataFromDB =
        await _freeWordDao.insertAndReadFreeWordDataFromDB(
            freeWordData.toFreeWordData(freeWordData));

    _freeWordHistory =
        freeWordDataFromDB.toFreeWordHistory(freeWordDataFromDB!);
  }

  /// すでに検索したユーザがLocalDB内に存在するか
  ///
  /// [responseBody] QitaAPIから取ってきた値
  ///
  /// return[bool] true:すでにDB内にいる , false:存在しない
  Future<bool> hasQitaUserDataFromDB(responseBody) async {
    final qitaUserDataFromNetwork = QitaUserData.fromJson(responseBody);

    var userData = await _userDao.getSearchHistoryData(
        qitaUserDataFromNetwork.toUserData(qitaUserDataFromNetwork));
    if (userData != null && userData.name.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  /// Qitaユーザーがそもそも存在するかどうか
  ///
  /// [String]　QitaID
  ///
  /// return[bool] true:存在する, false:存在しない
  Future<bool> existsQitaUserData(String userId) async {
    Response response;
    try {
      response = await _qitaApiService.getUserData(userId);
      if (response.isSuccessful) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }
}
