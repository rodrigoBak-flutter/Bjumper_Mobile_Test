import 'package:app_bjumper_bak/src/domain/entities/userDTO.dart';

class UserModel extends UserDTO {
  // ignore: use_super_parameters
  UserModel({
    required String avatarUrl,
    required String username,
    String? fullName,
    required int followers,
    String? bio,
  }) : super(
          avatarUrl: avatarUrl,
          username: username,
          fullName: fullName,
          followers: followers,
          bio: bio,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      avatarUrl: json['avatar_url'],
      username: json['login'],
      fullName: json['name'],
      followers: json['followers'],
      bio: json['bio'],
    );
  }
}
