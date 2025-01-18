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

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      avatarUrl: json['avatar_url'],
      username: json['login'],
      fullName: json['name'],
      followers: json['followers'],
      bio: json['bio'],
    );
  }
}