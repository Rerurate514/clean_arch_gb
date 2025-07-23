import 'dart:developer';

import 'package:clean_arch_gb/application/extension/github_api_exception.dart';
import 'package:clean_arch_gb/application/utils/dio.dart';
import 'package:clean_arch_gb/core/env/env.dart';
import 'package:clean_arch_gb/infrastructure/datasource/github_api_datasource.dart';
import 'package:clean_arch_gb/infrastructure/model/github_api_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_api_datasource_impl.g.dart';

@riverpod
GithubApiDatasource githubApiDatasourceImpl (Ref ref) {
  return GithubApiDatasourceImpl(
    dio: ref.watch(dioProvider)
  );
}

class GithubApiDatasourceImpl implements GithubApiDatasource {
  final String _baseUrl = "https://api.github.com";
  final Dio _dio;

  GithubApiDatasourceImpl({required Dio dio}): _dio = dio;

  @override
  Future<List<GithubApiResponse>> searchRepositories({
    required String query, 
    int page = 1, 
    int perPage = 30
  }) async {
    if(query.isEmpty) return [];

    final encodedQuery = Uri.encodeComponent(query);
    final url = Uri.parse('$_baseUrl/search/repositories?q=$encodedQuery&per_page=$perPage&page=$page');
  
    try {
      final response = await _executeRequest(url);
      final data = response.data;
      final List items = data["items"];

      return items.map((item) => GithubApiResponse.fromJson(item)).toList();
    } catch(e) {
      log("リポジトリの検索中にエラーが発生しました。");
      rethrow;
    }
  }

  Future<Response<dynamic>> _executeRequest(Uri uri) async {
    final response = await _dio.get(
      uri.toString(),
      options: Options(
        headers: {
          "Accept": "application/vnd.github.v3+json",
          "Authorization": "Bearer ${Env.apiKey}"
        }
      )
    );

    if(response.statusCode! >= 200 && response.statusCode! < 300){
      return response;
    } else {
      throw GithubApiException(
        statusCode: response.statusCode!, 
        message: "Github API リクエストに失敗しました: ${response.data}"
      );
    }
  }

  @override
  Future<GithubApiResponse> getRepositoryDetails({required String owner, required String repositoryName}) async {
    final repoUrl = Uri.parse("$_baseUrl/repos/$owner/$repositoryName");
    try {
      final response = await _executeRequest(repoUrl);

      return GithubApiResponse.fromJson(response.data);
    } catch(e) {
      log("リポジトリ詳細の取得中にエラーが発生しました。: $e");
      rethrow;
    }
  }

  @override
  void dispose() { }
}
