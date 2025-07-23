import 'package:clean_arch_gb/domain/entity/repository.dart';
import 'package:flutter/material.dart';

class RepositoryCard extends StatelessWidget {
  final Repository repository;
  const RepositoryCard({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsetsGeometry.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(repository.repositoryName),
            CircleAvatar(
              foregroundImage: NetworkImage(repository.ownerIconUrl),
            ),
            buildLangChip(repository.projectLanguage)
          ],
        )
      )
    );
  }

  Widget buildLangChip(String lang){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(32)
        ),
        border: Border.all(
          color: Colors.purpleAccent,
        )
      ),
      child: Text(lang),
    );
  }
}
