import 'package:app_bjumper_bak/src/core/extensions/context.dart';
import 'package:app_bjumper_bak/src/presentation/style/bjumper_colors.dart';
import 'package:flutter/material.dart';
import 'package:app_bjumper_bak/src/domain/entities/userDTO.dart';

class UserProfile extends StatelessWidget {
  final UserDTO user;

  const UserProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: user.avatarUrl == ''
              ? Image.asset('assets/img/user.jpeg')
              : CircleAvatar(
                  backgroundImage: NetworkImage(user.avatarUrl),
                  radius: 40,
                ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('@${user.username}',
                  style: context.displaySmall
                      .copyWith(color: BjumperColors.primary)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  user.fullName ?? 'No fullName availabl',
                  style: context.titleLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: BjumperColors.primary),
                ),
              ),
              Text(
                '${user.followers} followers',
                style: context.bodyLarge.copyWith(color: BjumperColors.primary),
              ),
            ],
          ),
          subtitle: user.bio == ''
              ? Text(
                  'BIO: ${user.bio}',
                  style:
                      context.bodyMedium.copyWith(color: BjumperColors.primary),
                )
              :  Text('BIO: No bio available', style:
                      context.bodyMedium.copyWith(color: BjumperColors.primary),),
        ),
      ],
    );
  }
}
