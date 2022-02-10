import 'package:chopper/chopper.dart';

part 'qita_api_service.chopper.dart';

/// QitaAPI
@ChopperApi()
abstract class QitaApiService extends ChopperService {
  static const BASE_URL = "https://qiita.com/api/v2/";
  static const AUTHORIZATION = "67291c63224bfcda33451378707ac233bd7bd9a2";

  // ChopperClient設定
  static QitaApiService create() {
    final client = ChopperClient(
      baseUrl: BASE_URL,
      services: [_$QitaApiService()],
      converter: JsonConverter(),
      interceptors: [
            (Request request) async {
          return applyHeader(request, 'Authorization', 'Bearer ' + AUTHORIZATION);
        },
      ],
    );
    return _$QitaApiService(client);
  }

  // タグのランキングを降順で取得
  @Get(path: "tags")
  Future<Response> getTagRanking({
    @Query('page')
        int startPage = 1,
    @Query('per_page') int endPage = 10,
    @Query('sort') String sortType = "count",
  });

  // 記事を取得する
  @Get(path: "items")
  Future<Response> getArticle({
    @Query('page')
        int startPage = 1,
    @Query('per_page') int endPage = 10,
    @Query('query') String? query,
  });

  // 特定のユーザー情報を取得する
  @Get(path: "/users/{userId}")
  Future<Response> getUserData(
    @Path('userId') String? id,
  );

  // 特定のユーザーの記事を取得する
  @Get(path: "/users/{userId}/items")
  Future<Response> getUserArticlesData(
    @Path('userId') String? id,
  );
}
