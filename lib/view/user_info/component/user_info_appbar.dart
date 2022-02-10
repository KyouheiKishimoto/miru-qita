import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miru_qita/data/resource/user_info_resource.dart';
import 'package:miru_qita/models/model/qita_user_model.dart';

/**
 * ユーザー詳細画面 - AppBarコンポーネント
 */
class UserInfoAppBar extends StatelessWidget {
  late QitaUserData _qitaUserData;

  UserInfoAppBar(QitaUserData qitaUserData) {
    _qitaUserData = qitaUserData;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(_qitaUserData.image!),
              ),
            ),
            SizedBox(height: 10),
            if (_qitaUserData.name != "")
              Text(
                _qitaUserData.name!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 10),
            Text(
              "@" + _qitaUserData.userId!,
              style: TextStyle(fontSize: 13),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userContaintWidget(
                    context,
                    _qitaUserData.itemsCount.toString(),
                    UserInfoResource.articlesCountTitle),
                userContaintWidget(
                    context,
                    _qitaUserData.followCount.toString(),
                    UserInfoResource.followCountTitle),
                userContaintWidget(
                    context,
                    _qitaUserData.followerCount.toString(),
                    UserInfoResource.followerCountTitle),
              ],
            )
          ],
        ),
      ),
    );
  }

  // 投稿・フォロー・フォロワーのコンテンツWidget
  Widget userContaintWidget(
      BuildContext context, String containtCount, String containtTitle) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.background,
      ),
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            containtCount,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            containtTitle,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
