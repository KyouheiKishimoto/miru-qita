import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miru_qita/data/common/load_status.dart';
import 'package:miru_qita/data/resource/user_info_resource.dart';
import 'package:miru_qita/view/user_info/component/article_skelton.dart';
import 'package:miru_qita/view/user_info/component/user_info_appbar.dart';
import 'package:miru_qita/view/user_info/component/user_info_article.dart';
import 'package:miru_qita/viewmodels/user_info_viewmodels.dart';
import 'package:provider/provider.dart';
import 'package:route_observer_mixin/route_observer_mixin.dart';

/**
 * ユーザー詳細画面
 */
class UserInfoScreen extends StatefulWidget {
  /// この画面に画面遷移するとき使うメソッド
  static Route<dynamic> route({required String? userId}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => UserInfoScreen(),
      settings: RouteSettings(name: "UserInfoScreen", arguments: userId),
    );
  }

  @override
  _UserInfoScreen createState() => _UserInfoScreen();
}

class _UserInfoScreen extends State<UserInfoScreen>
    with RouteAware, RouteObserverMixin {
  @override
  Widget build(BuildContext context) {
    /// 前画面・後画面からパラメータを受け取っている場合は、ModalRouteを使用して取得する
    var _userId = ModalRoute.of(context)!.settings.arguments as String;

    final userInfoViewModel =
        Provider.of<UserInfoViewModel>(context, listen: false);

    Future(() async {
      await userInfoViewModel.getQitaUserData(_userId);
      await userInfoViewModel.getUserArticlesData(_userId);
    });

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: Consumer<UserInfoViewModel>(
            builder: (context, model, _) {
              if (model.qitaUserData != null &&
                  userInfoViewModel.loadStatus == LoadStatus.DONE) {
                return UserInfoAppBar(model.qitaUserData!);
              } else {
                return Container();
              }
            },
          ),
        ),
        body: Consumer<UserInfoViewModel>(builder: (context, model, _) {
          if (model.loadStatus == LoadStatus.LOADING) {
            return ArticleSkelton();
          } else {
            if (model.article != null && model.article!.isNotEmpty) {
              return UserInfoArticle(article: model.article!);
            } else {
              return Center(
                child: Text(UserInfoResource.noneArticleTitle),
              );
            }
          }
        }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
