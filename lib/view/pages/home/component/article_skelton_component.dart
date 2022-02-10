import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

/// ホーム画面 - Skeltonコンポーネント
///
/// [dammyCount] ダミー数を宣言
Widget articleSkeltonComponent(int dammyCount) {
  return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: dammyCount,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 4),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          shape: BoxShape.circle, width: 25, height: 25),
                    ),
                    SizedBox(width: 8),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 16,
                          width: MediaQuery.of(context).size.width / 3,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(width: 8),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 16,
                          width: MediaQuery.of(context).size.width / 3,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                SkeletonLine(
                  style: SkeletonLineStyle(
                      height: 16,
                      width: MediaQuery.of(context).size.width,
                      borderRadius: BorderRadius.circular(8)),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 16,
                          width: MediaQuery.of(context).size.width / 5,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(width: 8),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 16,
                          width: MediaQuery.of(context).size.width / 5,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(width: 8),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 16,
                          width: MediaQuery.of(context).size.width / 5,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          shape: BoxShape.circle, width: 25, height: 25),
                    ),
                    SizedBox(width: 8),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 16,
                          width: MediaQuery.of(context).size.width / 3,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
