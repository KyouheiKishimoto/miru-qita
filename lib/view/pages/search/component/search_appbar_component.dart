import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miru_qita/data/common/search_type.dart';
import 'package:miru_qita/view/details_list/screen/details_screen.dart';
import 'package:miru_qita/view/user_info/screen/user_info_screen.dart';
import 'package:miru_qita/viewmodels/search_viewmodels.dart';
import 'package:provider/provider.dart';

/**
 * 検索画面 - AppBarコンポーネント
 */
class SearchAppBarComponent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final searchViewModel =
        Provider.of<SearchViewModel>(context, listen: false);

    return AppBar(
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).cardColor,
              ),
              child: TextField(
                cursorColor: Theme.of(context).primaryColor,
                textInputAction: TextInputAction.go,
                controller: searchViewModel.qitaEditTextController,
                onSubmitted: (searchWord) {
                  _searchQitaArticleData(context,searchViewModel.searchType, searchWord);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    FontAwesomeIcons.search,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).textTheme.bodyText2?.color),
                  hintText: '検索',
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Container(
                height: 30,
                child: Selector<SearchViewModel, SearchType>(
                    selector: (context, model) => model.searchType,
                    builder: (BuildContext context, model, _) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.getSearchTypeList?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: ChoiceChip(
                              label: Text(model.getSearchTypeList![index].getSearchName!),
                              selected: model.getSearchId == index,
                              onSelected: (bool selected) {
                                // 既に選択されている場合は弾く
                                if (selected) {
                                  _changeSearchType(
                                      context, model.getSearchTypeList![index]);
                                }
                              },
                            ),
                          );
                        },
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 検索タイプを変換する
  ///
  /// [BuildContext] Providerで使用する
  ///
  /// [SearchType] 検索タイプの列挙体
  _changeSearchType(BuildContext context, SearchType searchType) {
    final searchViewModel =
        Provider.of<SearchViewModel>(context, listen: false);
    searchViewModel.changeSearchType(searchType);
  }

  /// Qita記事を検索する
  ///
  /// [BuildContext] Providerで使用する
  ///
  /// [SearchType] 検索タイプの列挙体
  ///
  /// [String]　検索内容
  _searchQitaArticleData(
      BuildContext context, SearchType searchType, String searchWord) async {
    final searchViewModel =
        Provider.of<SearchViewModel>(context, listen: false);
    // ユーザーID検索のみ条件あり

    // TODO: 下記処理はほんとはViewModelで行いたいがContextをViewModelに渡さずに行うには何かライブラリとか使わないと出来なさそう、とりあえず下記でやる
    if (await searchViewModel.canSearchQitaArticleData(searchWord)) {
      switch (searchType) {
        case SearchType.FREEWORD:
          searchViewModel.saveSearchWord(searchType,searchWord);
          Navigator.of(context).push(
            DetailsListScreen.route(searchWord: searchWord),
          );
          break;
        case SearchType.USERID:
          if(await searchViewModel.existsQitaUserData(searchWord)) {
            searchViewModel.saveSearchWord(searchType,searchWord);
            Navigator.of(context).push(
              UserInfoScreen.route(userId: searchWord),
            );
          }else{
            searchViewModel.showNoneQitaUserErrorMessage();
          }
          break;
      }
    }
  }
}
