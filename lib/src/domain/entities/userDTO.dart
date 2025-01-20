// ignore_for_file: file_names

class UserDTO {
  final String avatarUrl;
  final String username;
  final String? fullName;
  final int followers;
  final String? bio;

  UserDTO({
    required this.avatarUrl,
    required this.username,
    this.fullName,
    required this.followers,
    this.bio,
  });
}
