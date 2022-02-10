
import 'package:flutter/cupertino.dart';
import 'package:miru_qita/data/common/load_status.dart';
import 'package:miru_qita/models/model/qita_article_model.dart';
import 'package:miru_qita/models/repository/qita_repository.dart';

/// 詳細一覧画面のViewModel
class DetailsViewModel extends ChangeNotifier {

  late final QitaRepository _qitaRepository;

  DetailsViewModel({qitaRepository}) {
    _qitaRepository = qitaRepository;
  }

  // 注目の記事
  List<Article>? _article;
  List<Article>? get article => _article;

  // 通信状況
  LoadStatus _loadStatus = LoadStatus.DONE;
  LoadStatus get loadStatus => _loadStatus;

  /// 求人一覧取得
  getTagArticleData(String searchWord) async{
    await _qitaRepository.getArticleData(searchWord);
  }

  /// リポジトリの値を取得し、Viewに自動更新する処理
  onRepositoryUpdated(QitaRepository repository) {
    _article = repository.article;
    _loadStatus = repository.loadStatus;
    notifyListeners();
  }

}