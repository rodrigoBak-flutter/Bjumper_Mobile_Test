import 'package:app_bjumper_bak/src/core/extensions/context.dart';
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
              //TODO:FALTA AGREGAR COLORES
              Text('@${user.username}', style: context.displaySmall.copyWith()),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  user.fullName ?? 'No fullName availabl',
                  style:
                      context.titleLarge.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '${user.followers} followers',
                style: context.bodyLarge.copyWith(),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: user.bio == ''
                ? Text('BIO: ${user.bio}')
                : const Text('BIO: No bio available'),
          ),
        ),
      ],
    );
  }
}
