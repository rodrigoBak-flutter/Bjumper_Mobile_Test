import 'package:app_bjumper_bak/src/core/extensions/context.dart';
import 'package:app_bjumper_bak/src/domain/entities/repositoryDTO.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RepositoriesList extends StatelessWidget {
  final List<RepositoryDTO> repositories;

  const RepositoriesList({super.key, required this.repositories});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        primary: false,
        separatorBuilder: (context, index) => const Divider(
          thickness: 2,
        ),
        itemCount: repositories.length,
        itemBuilder: (context, index) {
          final repo = repositories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Repo $index',
                  style:
                      context.titleMedium.copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset('assets/icons/fork.svg'),
                    ),
                    Text(
                      repo.forks.toString(),
                      style: context.bodyMedium.copyWith(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset('assets/icons/star.svg'),
                    ),
                    Text(
                      repo.stars.toString(),
                      style: context.bodyMedium.copyWith(),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
