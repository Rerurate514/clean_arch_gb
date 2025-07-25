import 'package:clean_arch_gb/domain/entity/repository.dart';
import 'package:clean_arch_gb/presentation/components/pages/home/repository_card.dart';
import 'package:clean_arch_gb/presentation/components/util/search_field.dart';
import 'package:clean_arch_gb/presentation/notifier/repository_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeComponents extends ConsumerStatefulWidget {
  const HomeComponents({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeComponentsState();
}

class _HomeComponentsState extends ConsumerState<HomeComponents> {

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(repositoryNotifierProvider);
    return Column(
      children: [
        SearchField(onSearch: (query) {
          ref.read(repositoryNotifierProvider.notifier).getRepositories(query);
        }),
        Expanded(
          child: state.when(
          data: (List<Repository> data) { 
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final Repository repository = data[index];
                return RepositoryCard(repository: repository);
              }
            );
          }, 
          error: (Object error, StackTrace stackTrace) { 
            return Column(
              children: [
                Text(error.toString()),
                Text(stackTrace.toString())
              ],
            );
          }, 
          loading: () {  
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        )
      ],
    );
  }
}
