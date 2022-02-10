import 'package:flutter/material.dart';
import 'package:miru_qita/data/common/common_resource.dart';
import 'package:miru_qita/data/common/load_status.dart';
import 'package:miru_qita/data/resource/home_resource.dart';
import 'package:miru_qita/models/model/qita_tag_ranking_model.dart';
import 'package:miru_qita/view/pages/home/component/article_component.dart';
import 'package:miru_qita/viewmodels/home_viewmodels.dart';
import 'package:provider/provider.dart';
import 'component/article_skelton_component.dart';
import 'component/tag_ranking_component.dart';
import 'component/tag_ranking_skelton_component.dart';

/// ホーム画面
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(CommonResource.appBarTitle),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Text(
                HomeResource.attentionTagTitle,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 100,
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Selector<HomeViewModel, List<Tag>?>(
                selector: (context, model) => model.tag,
                builder: (BuildContext context, model, _) {
                  if (model != null) {
                    return tagRankingComponent(model);
                  } else {
                    return tagRankingSkeltonComponent(10);
                  }
                },
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Text(
                HomeResource.attentionArticleTitle,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Consumer<HomeViewModel>(builder: (context, model, _) {
                    if (model.article != null && model.loadStatus == LoadStatus.DONE) {
                      return articleComponent(model.article!);
                    } else {
                      return articleSkeltonComponent(10);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
