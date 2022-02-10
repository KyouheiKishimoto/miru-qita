// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qita_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$QitaApiService extends QitaApiService {
  _$QitaApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = QitaApiService;

  @override
  Future<Response<dynamic>> getTagRanking(
      {int startPage = 1, int endPage = 10, String sortType = "count"}) {
    final $url = 'tags';
    final $params = <String, dynamic>{
      'page': startPage,
      'per_page': endPage,
      'sort': sortType
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getArticle(
      {int startPage = 1, int endPage = 10, String? query}) {
    final $url = 'items';
    final $params = <String, dynamic>{
      'page': startPage,
      'per_page': endPage,
      'query': query
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getUserData(String? id) {
    final $url = '/users/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getUserArticlesData(String? id) {
    final $url = '/users/${id}/items';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
