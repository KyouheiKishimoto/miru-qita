

import 'package:flutter/cupertino.dart';
import 'package:miru_qita/data/common/load_status.dart';
import 'package:miru_qita/models/model/qita_article_model.dart';
import 'package:miru_qita/models/model/qita_user_model.dart';
import 'package:miru_qita/models/repository/qita_repository.dart';

/// ユーザー詳細画面
class UserInfoViewModel extends ChangeNotifier {
  late final QitaRepository _qitaRepository;

  UserInfoViewModel({qitaRepository}) {
    _qitaRepository = qitaRepository;
  }

  // 通信状況
  LoadStatus _loadStatus = LoadStatus.DONE;
  LoadStatus get loadStatus => _loadStatus;

  // 注目の記事
  List<Article>? _article;
  List<Article>? get article => _article;

  // User情報
  QitaUserData? _qitaUserData;
  QitaUserData? get qitaUserData => _qitaUserData;

  /// ユーザの記事一覧を取得
  getUserArticlesData(String userId) async{
    await _qitaRepository.getUserArticlesData(userId);
  }

  /// ユーザーの情報を取得
  getQitaUserData(String userId) async{
    await _qitaRepository.getQitaUserData(userId);
  }

  /// リポジトリの値を取得し、Viewに自動更新する処理
  onRepositoryUpdated(QitaRepository repository) {
    _article = repository.article;
    _qitaUserData = repository.qitaUserData;
    _loadStatus = repository.loadStatus;
    notifyListeners();
  }

}