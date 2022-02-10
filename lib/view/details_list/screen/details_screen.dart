import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miru_qita/data/common/load_status.dart';
import 'package:miru_qita/data/resource/details_resource.dart';
import 'package:miru_qita/view/pages/home/component/article_component.dart';
import 'package:miru_qita/view/pages/home/component/article_skelton_component.dart';
import 'package:miru_qita/viewmodels/details_viewmodels.dart';
import 'package:provider/provider.dart';
import 'package:route_observer_mixin/route_observer_mixin.dart';

/// 詳細一覧画面
class DetailsListScreen extends StatefulWidget {
  /// この画面に画面遷移するとき使うメソッド
  static Route<dynamic> route({required String? searchWord}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => DetailsListScreen(),
      settings: RouteSettings(name: "DetailsListScreen", arguments: searchWord),
    );
  }

  @override
  _DetailsListScreen createState() => _DetailsListScreen();
}

class _DetailsListScreen extends State<DetailsListScreen>
    with RouteAware, RouteObserverMixin {
  @override
  Widget build(BuildContext context) {
    final _searchWord = ModalRoute.of(context)!.settings.arguments as String;
    final detailsViewModel =
        Provider.of<DetailsViewModel>(context, listen: false);
    Future(() async {
      await detailsViewModel.getTagArticleData(_searchWord);
    });

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _searchWord,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<DetailsViewModel>(
            builder: (context, model, _) {
              if (model.article != null &&
                  model.loadStatus == LoadStatus.DONE) {
                if (model.article!.isNotEmpty) {
                  // 記事を反映
                  return articleComponent(model.article!);
                } else {
                  // 記事が存在しない処理
                  return Center(
                    child: Text(DetailsResource.noneArticleTitle),
                  );
                }
              } else {
                // 読み込み中の処理
                return articleSkeltonComponent(10);
              }
            },
          ),
        ),
      ),
    );
  }
}
