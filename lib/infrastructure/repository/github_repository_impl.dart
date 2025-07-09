import 'package:clean_arch_gb/domain/entity/repository.dart';
import 'package:clean_arch_gb/domain/factory/repository_factory.dart';
import 'package:clean_arch_gb/domain/repository/github_repository.dart';
import 'package:clean_arch_gb/infrastructure/datasource/github_api_datasource.dart';
import 'package:clean_arch_gb/infrastructure/datasource/github_api_datasource_impl.dart';
import 'package:clean_arch_gb/infrastructure/factory/repository_factory_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
GithubRepositoryImpl githubApiDatasourceImpl (Ref ref) {
  return GithubRepositoryImpl(
    githubApiDatasourceImpl: ref.watch(githubApiDatasourceImplProvider), 
    repositoryFactoryImpl: ref.watch(repositoryFactoryImplProvider)
  );
}

class GithubRepositoryImpl implements GithubRepository {
  final GithubApiDatasource _githubApiDatasource;
  final RepositoryFactory _repositoryFactory;

  GithubRepositoryImpl({
    required GithubApiDatasource githubApiDatasourceImpl,
    required RepositoryFactory repositoryFactoryImpl
  }) : _githubApiDatasource = githubApiDatasourceImpl,
      _repositoryFactory = repositoryFactoryImpl;

  @override
  Future<List<Repository>> searchRepositories(String query) async {
    try {
      final response = await _githubApiDatasource.searchRepositories(query: query);
      return response.map((repository) => 
        _repositoryFactory.createFromModel(repository)
      ).toList();
    } catch(e) {
      rethrow;
    }
  }
  
  @override
  Future<Repository> getRepositoryDetails(String owner, String repositoryName) async {
    try {
      final repository = await _githubApiDatasource.getRepositoryDetails(owner: owner, repositoryName: repositoryName);
      return _repositoryFactory.createFromModel(repository);
    } catch(e) {
      rethrow;
    }
  }

  @override
  void dispose() { }
}
