import 'package:clean_arch_gb/domain/entity/repository.dart';
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
        state.when(
          data: (List<Repository> data) { 
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Text("${data[index]}"),
                );
              }
            );
          }, 
          error: (Object error, StackTrace stackTrace) { 
            return Text(stackTrace.toString());
          }, 
          loading: () {  
            return CircularProgressIndicator();
          })
      ],
    );
  }
}
