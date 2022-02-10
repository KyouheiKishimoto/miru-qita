import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miru_qita/data/resource/search_resource.dart';
import 'package:miru_qita/models/model/qita_user_model.dart';
import 'package:miru_qita/view/user_info/screen/user_info_screen.dart';
import 'package:miru_qita/viewmodels/search_viewmodels.dart';
import 'package:provider/provider.dart';

/**
 * 検索画面 - ユーザーID検索履歴コンポーネント
 */
class UserIdHistoryComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Selector<SearchViewModel, List<QitaUserData>?>(
            selector: (context, model) => model.qitaListUserData,
            builder: (BuildContext context, model, _) {
              if (model != null && model.isNotEmpty) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Text(SearchResource.userIdHistoryTitle),
                      Container(
                        child: Scrollbar(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: model.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Slidable(
                                endActionPane: ActionPane(
                                  motion: ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      backgroundColor: Color(0xFFFE4A49),
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                      onPressed: (BuildContext context) {
                                        _deleteUserID(
                                            context, model[index].userId!);
                                      },
                                    ),
                                  ],
                                ),
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    UserInfoScreen.route(
                                        userId: model[index].userId),
                                  ),
                                  child: Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: CircleAvatar(
                                              radius: 25,
                                              backgroundImage: NetworkImage(
                                                  model[index].image!),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 9,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      8, 0, 0, 4),
                                                  child: Text(
                                                    model[index].name!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      8, 0, 0, 4),
                                                  child: Text(
                                                    model[index].description!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Center(
                                              child: FaIcon(
                                                FontAwesomeIcons.angleRight,
                                                size: 14.0,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .color,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ]);
              } else {
                return Container();
              }
            }),
      ),
    ]);
  }

  /// QitaId履歴の1レコード削除
  _deleteUserID(BuildContext context, String userId) {
    final searchViewModel =
        Provider.of<SearchViewModel>(context, listen: false);
    searchViewModel.deleteUserId(userId);
  }
}
