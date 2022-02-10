import 'package:flutter/cupertino.dart';
import 'package:skeletons/skeletons.dart';

/// 注目の言語ダミーコンポーネント
///
/// [dammyCount] ダミー数を宣言
Widget tagRankingSkeltonComponent(int dammyCount) {
  return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: dammyCount,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            children: [
              SkeletonAvatar(
                style: SkeletonAvatarStyle(
                    shape: BoxShape.circle, width: 50, height: 50),
              ),
              SizedBox(height: 16),
              SkeletonLine(
                style: SkeletonLineStyle(
                    height: 16,
                    width: 60,
                    borderRadius: BorderRadius.circular(8)),
              )
            ],
          ),
        );
      });
}
