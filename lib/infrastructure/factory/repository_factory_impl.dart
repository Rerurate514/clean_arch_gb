import 'package:clean_arch_gb/domain/entity/repository.dart';
import 'package:clean_arch_gb/domain/factory/repository_factory.dart';
import 'package:clean_arch_gb/infrastructure/model/github_api_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_factory_impl.g.dart';

@riverpod
RepositoryFactory repositoryFactoryImpl(Ref ref) {
  return RepositoryFactoryImpl();
}

class RepositoryFactoryImpl implements RepositoryFactory {
  @override
  Repository create({
    required String repositoryName,
    required String ownerIconUrl,
    required String projectLanguage,
    required int starCount,
    required int watcherCount,
    required int forkCount,
    required int issueCount,
  }) {
    return Repository(
      repositoryName: repositoryName, 
      ownerIconUrl: ownerIconUrl, 
      projectLanguage: projectLanguage, 
      starCount: starCount, 
      watcherCount: watcherCount, 
      forkCount: forkCount, 
      issueCount: issueCount
    );
  }

  @override
  Repository createFromModel(GithubApiResponse repository) {
    return Repository(
      repositoryName: repository.name, 
      ownerIconUrl: repository.ownerAvatarUrl, 
      projectLanguage: repository.language ?? "", 
      starCount: repository.stargazersCount, 
      watcherCount: repository.watchersCount, 
      forkCount: repository.forksCount, 
      issueCount: repository.openIssuesCount
    );
  }
}
