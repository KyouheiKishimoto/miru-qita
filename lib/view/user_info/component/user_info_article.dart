import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:miru_qita/models/model/qita_article_model.dart';

/// ユーザー詳細画面 - 記事コンポーネント
class UserInfoArticle extends StatelessWidget {
  late final List<Article> _article;

  UserInfoArticle({required List<Article> article}) {
    _article = article;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 8,
        top: 8,
        right: 8,
        bottom: 8,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _article.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    _launchURL(context, _article[index].url!);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _article[index].title!,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ),
                      Container(
                        child: Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Html(
                                data: _article[index].renderedBody,
                                // TableがWidthの横幅より大きく表示してしまうため下記
                                style: {
                                  'table': Style(
                                    display: Display.BLOCK,
                                    textOverflow: TextOverflow.fade,
                                  ),
                                },
                              ),
                            ),
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
    );
  }
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
