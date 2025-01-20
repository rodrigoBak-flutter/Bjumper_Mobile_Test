import 'package:app_bjumper_bak/src/domain/entities/repositoryDTO.dart';
import 'package:app_bjumper_bak/src/domain/entities/userDTO.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/widget/repository_list_view.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/widget/user_profile.dart';
import 'package:app_bjumper_bak/src/presentation/shared/svg/bjumper_svg.dart';
import 'package:app_bjumper_bak/src/presentation/style/bjumper_colors.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget(
      {super.key,
      required this.onPressed,
      required this.user,
      required this.repositories});
  final Function() onPressed;
  final UserDTO user;
  final List<RepositoryDTO> repositories;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: BjumperColors.neutral010,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BjumperColors.primary),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BjumperSvg(svgBjumperName: 'assets/icons/bjumperLogo.svg',),
                IconButton(
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.close,
                      color: BjumperColors.primary,
                      size: 40,
                    )),
              ],
            ),
            const Divider(
              color: BjumperColors.primary,
            ),
            UserProfile(user: user),
            const SizedBox(height: 10),
            RepositoryListView(repositories: repositories),
          ],
        ),
      ),
    );
  }
}
