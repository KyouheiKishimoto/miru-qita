import 'package:flutter/cupertino.dart';
import 'package:miru_qita/data/common/load_status.dart';
import 'package:miru_qita/models/model/qita_article_model.dart';
import 'package:miru_qita/models/model/qita_tag_ranking_model.dart';
import 'package:miru_qita/models/repository/qita_repository.dart';

/// ホーム画面のViewModel
class HomeViewModel extends ChangeNotifier {
  late final QitaRepository _qitaRepository;

  HomeViewModel({qitaRepository}) {
    _qitaRepository = qitaRepository;
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

  /// 注目の言語を取得する
  getTagRankingData() async {
    await _qitaRepository.getTagRanking();
  }

  /// 注目のQita記事を取得する
  getQitaArticleData() async {
    await _qitaRepository.getArticleData("");
  }

  /// リポジトリの値を取得し、Viewに自動更新する処理
  onRepositoryUpdated(QitaRepository repository) {
    if (_article != null) return;
    _tag = repository.tag;
    _article = repository.article;

    _loadStatus = repository.loadStatus;
    notifyListeners();
  }
}
