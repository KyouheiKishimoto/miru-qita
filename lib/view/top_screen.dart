import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miru_qita/data/resource/top_resource.dart';
import 'package:miru_qita/view/pages/favorite/favorite_page.dart';
import 'package:miru_qita/view/pages/home/home_page.dart';
import 'package:miru_qita/view/pages/search/search_page.dart';
import 'package:miru_qita/view/pages/setting/setting_page.dart';
import 'package:miru_qita/viewmodels/home_viewmodels.dart';
import 'package:provider/provider.dart';

/// ボトムナビゲーションバーと画面全体
class TopScreen extends StatefulWidget {
  @override
  _TopScreenState createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  int _currentIndex = 0;

  final _pages = [HomePage(), SearchPage(), FavoritePage(), SettingPage()];

  @override
  void initState() {
    super.initState();

    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

    Future(() async {
      await homeViewModel.getTagRankingData(); // 注目の言語取得
      await homeViewModel.getQitaArticleData(); // 最新の記事を取得
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: TopResource.bottomBarHomeText,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.search),
                label: TopResource.bottomBarSearchText,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: TopResource.bottomBarFavoriteText,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.account_circle),
                label: TopResource.bottomBarSettingText,
              )
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            }),
      ),
    );
  }
}
