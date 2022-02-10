import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miru_qita/data/resource/search_resource.dart';
import 'package:miru_qita/models/model/freeword_history_model.dart';
import 'package:miru_qita/view/details_list/screen/details_screen.dart';
import 'package:miru_qita/viewmodels/search_viewmodels.dart';
import 'package:provider/provider.dart';

/**
 * 検索画面 - フリーワード検索履歴コンポーネント
 */
class FreewordHistoryComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Selector<SearchViewModel, List<FreeWordHistory>?>(
              selector: (context, model) => model.freewordHistory,
              builder: (BuildContext context, model, _) {
                if (model != null && model.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          SearchResource.freewordHistoryTitle,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        spacing: 3,
                        children: List.generate(
                          model.length,
                          (index) {
                            return InkWell(
                              onTap: (){
                                Navigator.of(context).push(
                                  DetailsListScreen.route(searchWord: model[index].freeWord!),
                                );
                              },
                              child: Chip(
                                label: Text(model[index].freeWord!),
                                onDeleted: () {
                                  print("deleteが押された");
                                  _deleteFreeWord(
                                      context, model[index].freeWord!);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center();
                }
              }),
        ),
      ],
    );
  }

  _deleteFreeWord(BuildContext context, String freeWord) async {
    final searchViewModel =
        Provider.of<SearchViewModel>(context, listen: false);
    searchViewModel.deleteFreeWord(freeWord);
  }
}
