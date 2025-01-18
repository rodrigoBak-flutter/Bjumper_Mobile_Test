import 'package:app_bjumper_bak/src/domain/entities/repositoryDTO.dart';
import 'package:flutter/material.dart';

class RepositoriesList extends StatelessWidget {
  final List<RepositoryDTO> repositories;

  const RepositoriesList({Key? key, required this.repositories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: repositories.length,
        itemBuilder: (context, index) {
          final repo = repositories[index];
          return ListTile(
            title: Text(repo.name),
            subtitle: Text('Forks: ${repo.forks}, Stars: ${repo.stars}'),
          );
        },
      ),
    );
  }
}
