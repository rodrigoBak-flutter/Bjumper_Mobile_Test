class RepositoryModel {
  final String name;
  final int stars;
  final int forks;

  RepositoryModel({
    required this.name,
    required this.stars,
    required this.forks,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      name: json['name'] as String,
      stars: json['stargazers_count'] as int,
      forks: json['forks_count'] as int,
    );
  }
}