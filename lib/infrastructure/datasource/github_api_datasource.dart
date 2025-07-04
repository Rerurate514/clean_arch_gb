import 'package:clean_arch_gb/infrastructure/model/github_api_response.dart';

abstract class GithubApiDatasource {
  Future<List<GithubApiResponse>> searchRepositories({
    required String query,
    int page = 1,
    int perPage = 30,
  });
  
  Future<GithubApiResponse> getRepositoryDetails({
    required String owner,
    required String repositoryName,
  });
  
  void dispose();
}
