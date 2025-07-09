import 'package:clean_arch_gb/domain/entity/repository.dart';

abstract class GetRepositoryUsecase {
  Future<List<Repository>> getRepositories(String query);
  Future<Repository> getRepository(String owner, String repositoryName);
}
