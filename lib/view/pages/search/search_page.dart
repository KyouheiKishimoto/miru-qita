import 'package:flutter/material.dart';
import 'package:miru_qita/view/pages/search/component/freeword_history_component.dart';
import 'package:miru_qita/viewmodels/search_viewmodels.dart';
import 'package:provider/provider.dart';
import 'component/search_appbar_component.dart';
import 'component/userid_history_component.dart';

/// 検索画面
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchViewModel =
        Provider.of<SearchViewModel>(context, listen: false);

    Future(() async {
      await searchViewModel.getFreeWordDataFromLocalDB();
      await searchViewModel.getUserIdDataFromLocalDB();
    });

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: SearchAppBarComponent(),
          preferredSize: Size.fromHeight(120),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FreewordHistoryComponent(), // フリーワード履歴
              UserIdHistoryComponent(), // ユーザーID履歴
            ],
          ),
        ),
      ),
    );
  }
}
