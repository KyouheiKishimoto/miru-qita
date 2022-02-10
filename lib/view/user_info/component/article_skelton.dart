import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

/// ユーザー詳細画面 - 読み込み中の処理
class ArticleSkelton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SkeletonLine(
                  style: SkeletonLineStyle(
                      height: 16,
                      width: MediaQuery.of(context).size.width * 0.9,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 30,
                          spacing: 6,
                          lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            height: 10,
                            borderRadius: BorderRadius.circular(8),
                            minLength: MediaQuery.of(context).size.width / 6,
                            width: MediaQuery.of(context).size.width * 0.9,
                          )),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
