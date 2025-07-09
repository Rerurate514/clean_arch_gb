import 'package:clean_arch_gb/domain/entity/repository.dart';
import 'package:clean_arch_gb/domain/repository/github_repository.dart';
import 'package:clean_arch_gb/domain/usecase/get_repository_usecase.dart';
import 'package:clean_arch_gb/infrastructure/repository/github_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_repository_usecase_impl.g.dart';

@riverpod
GetRepositoryUsecaseImpl getRepositoryUsecaseImpl(Ref ref){
  return GetRepositoryUsecaseImpl(
    githubRepository: ref.watch(githubRepositoryProvider)
  );
}

class GetRepositoryUsecaseImpl implements GetRepositoryUsecase {
  final GithubRepository _githubRepository;

  GetRepositoryUsecaseImpl({
    required GithubRepository githubRepository
  }): _githubRepository = githubRepository;

  @override
  Future<List<Repository>> getRepositories(String query) async {
    return await _githubRepository.searchRepositories(query);
  }
  
  @override
  Future<Repository> getRepository(String owner, String repositoryName) async  {
    return await _githubRepository.getRepositoryDetails(owner, repositoryName);
  }
  
}
