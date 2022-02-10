import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miru_qita/models/model/qita_tag_ranking_model.dart';
import 'package:miru_qita/view/details_list/screen/details_screen.dart';

/// ホーム画面 - 注目の言語コンポーネント
///
/// [tag] 表示するタグ
Widget tagRankingComponent(List<Tag> tag) {
  return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: tag.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              DetailsListScreen.route(searchWord: tag[index].name),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(tag[index].iconUrl!),
                ),
                SizedBox(height: 16),
                Text(
                  tag[index].name!,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      });
}
