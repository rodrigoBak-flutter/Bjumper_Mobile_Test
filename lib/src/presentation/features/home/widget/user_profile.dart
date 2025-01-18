import 'package:flutter/material.dart';
import 'package:app_bjumper_bak/src/domain/entities/userDTO.dart';

class UserProfile extends StatelessWidget {
  final UserDTO user;

  const UserProfile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(user.avatarUrl),
          radius: 40,
        ),
        Text(user.username, style: const TextStyle(fontSize: 24)),
        Text(user.fullName ?? ''),
        Text('Followers: ${user.followers}'),
        Text(user.bio ?? 'No bio available'),
      ],
    );
  }
}