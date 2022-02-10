import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:miru_qita/data/resource/details_resource.dart';
import 'package:miru_qita/data/resource/home_resource.dart';
import 'package:miru_qita/models/model/qita_article_model.dart';
import 'package:miru_qita/view/details_list/screen/details_screen.dart';
import 'package:miru_qita/view/user_info/screen/user_info_screen.dart';

/// ホーム画面 - 記事コンポーネント
Widget articleComponent(List<Article> article) {
  return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: article.length,
      itemBuilder: (BuildContext context, int index) {
        final formatter = DateFormat(HomeResource.articleFormatText);

        return Card(
          margin: EdgeInsets.symmetric(vertical: 4),
          child: InkWell(
            onTap: () {
              _launchURL(context, article[index].url!);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            UserInfoScreen.route(
                                userId: article[index].user.userId),
                          );
                        },
                        child: CircleAvatar(
                          radius: 10,
                          backgroundImage:
                              NetworkImage(article[index].user.image!),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "@" + article[index].user.userId!,
                        style: Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 5,
                        child: Text(
                          formatter.format(
                            article[index].updatedAt,
                          ),
                          style: TextStyle(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    article[index].title!,
                    style: Theme.of(context).textTheme.subtitle1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.tags,
                        size: 15,
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: article[index].tags!.length,
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder: (BuildContext context, int i) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        child: InputChip(
                                          label: Text(
                                              article[index].tags![i].name!),
                                          onSelected: (bool value) {
                                            Navigator.of(context).push(
                                              DetailsListScreen.route(
                                                  searchWord: article[index]
                                                      .tags![i]
                                                      .name),
                                            );
                                          },
                                        ),
                                      );
                                    }),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(DetailsResource.lgmtTitle),
                      SizedBox(
                        width: 8,
                      ),
                      Text(article[index].likesCount.toString())
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}

/// WebViewに飛ばす処理
/// ※公式のやつを丸パクリ
void _launchURL(BuildContext context, String url) async {
  try {
    await launch(
      url,
      customTabsOption: CustomTabsOption(
        toolbarColor: Theme.of(context).primaryColor,
        enableDefaultShare: true,
        enableUrlBarHiding: true,
        showPageTitle: true,
        extraCustomTabs: const <String>[
          // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
          'org.mozilla.firefox',
          // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
          'com.microsoft.emmx',
        ],
      ),
      safariVCOption: SafariViewControllerOption(
        preferredBarTintColor: Theme.of(context).primaryColor,
        preferredControlTintColor: Colors.white,
        barCollapsingEnabled: true,
        entersReaderIfAvailable: false,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
      ),
    );
  } catch (e) {
    // An exception is thrown if browser app is not installed on Android device.
    debugPrint(e.toString());
  }
}
