import 'package:app_bjumper_bak/src/core/extensions/context.dart';
import 'package:app_bjumper_bak/src/domain/entities/repositoryDTO.dart';
import 'package:app_bjumper_bak/src/presentation/style/bjumper_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RepositoryListView extends StatelessWidget {
  final List<RepositoryDTO> repositories;

  const RepositoryListView({super.key, required this.repositories});

  @override
  Widget build(BuildContext context) {
    if (repositories.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('¡Ups! Nada por aquí.',
              style: context.titleLarge.copyWith(color: BjumperColors.primary)),
        ),
      );
    }
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
                  style: context.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: BjumperColors.primary),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        'assets/icons/fork.svg',
                        // ignore: deprecated_member_use
                        color: BjumperColors.primary,
                      ),
                    ),
                    Text(
                      repo.forks.toString(),
                      style: context.bodyMedium
                          .copyWith(color: BjumperColors.primary),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        'assets/icons/star.svg',
                        // ignore: deprecated_member_use
                        color: BjumperColors.primary,
                      ),
                    ),
                    Text(
                      repo.stars.toString(),
                      style: context.bodyMedium
                          .copyWith(color: BjumperColors.primary),
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
