import 'package:clean_arch_gb/domain/entity/repository.dart';

abstract class GithubRepository {
  Future<List<Repository>> searchRepositories();
  Future<Repository> getRepositoryDetails(String owner, String repositoryName);
  void dispose();
}
