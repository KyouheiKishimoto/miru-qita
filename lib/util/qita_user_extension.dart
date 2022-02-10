
import 'package:miru_qita/models/db/qita_local_database.dart';
import 'package:miru_qita/models/model/qita_user_model.dart';

/// テーブルのモデルクラスからモデルクラスにコンバート処理
extension ConvertToListQitaUserData on List<UserData>? {
  List<QitaUserData>? toQitaUserData(List<UserData>? userData) {
    List<QitaUserData> qitaUserDatas = [];
    userData?.forEach((value) {
      qitaUserDatas.add(
        QitaUserData(
          userId: value.userId,
          name: value.name,
          image: value.image,
          description: value.description,
          facebookId: value.facebookId,
          followCount: value.followCount,
          followerCount: value.followerCount,
          githubName: value.githubName,
          itemsCount: value.itemsCount,
          linkedinId: value.linkedinId,
          location: value.location,
          organization: value.organization,
          permanentId: value.permanentId,
          twitterScreenName: value.twitterScreenName,
          websiteUrl: value.websiteUrl,
        )
      );
    });
    return qitaUserDatas;
  }
}

/// モデルクラスからテーブルのモデルクラスにコンバート処理
extension ConvertToUserData on QitaUserData {
  UserData toUserData(QitaUserData qitaUserData) {
    return UserData(
      userId: qitaUserData.userId ?? "",
      name: qitaUserData.name ?? "",
      image: qitaUserData.image ?? "",
      description: qitaUserData.description ?? "",
      facebookId: qitaUserData.facebookId ?? "",
      followCount: qitaUserData.followCount,
      followerCount: qitaUserData.followerCount,
      githubName: qitaUserData.githubName ?? "",
      itemsCount: qitaUserData.itemsCount,
      linkedinId: qitaUserData.linkedinId ?? "",
      location: qitaUserData.location ?? "",
      organization: qitaUserData.organization ?? "",
      permanentId: qitaUserData.permanentId,
      twitterScreenName: qitaUserData.twitterScreenName ?? "",
      websiteUrl: qitaUserData.websiteUrl ?? "",
    );
  }
}