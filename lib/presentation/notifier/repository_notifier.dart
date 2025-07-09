import 'package:clean_arch_gb/application/usecase/get_repository_usecase_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_notifier.g.dart';

@riverpod
class RepositoryNotifier extends _$RepositoryNotifier {
  @override
  build() {
    return [];
  }

  Future<void> getRepositories(String query) async {
    state = AsyncLoading();

    try {
      final usecase = ref.watch(getRepositoryUsecaseImplProvider);
      final repos = await usecase.getRepositories(query);
      state = AsyncValue.data(repos);
    } catch(error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  Future<void> getRepository(String owner, String repositoryName) async  {
    state = AsyncLoading();

    try {
      final usecase = ref.watch(getRepositoryUsecaseImplProvider);
      final repos = await usecase.getRepository(owner, repositoryName);
      state = AsyncValue.data(repos);
    } catch(error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
