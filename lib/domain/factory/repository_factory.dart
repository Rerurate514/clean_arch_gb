import 'package:clean_arch_gb/domain/entity/repository.dart';
import 'package:clean_arch_gb/infrastructure/model/github_api_response.dart';

abstract class RepositoryFactory {
  Repository create({
    required String repositoryName,
    required String ownerIconUrl,
    required String projectLanguage,
    required int starCount,
    required int watcherCount,
    required int forkCount,
    required int issueCount,
  });

  Repository createFromModel(GithubApiResponse repository);
}
