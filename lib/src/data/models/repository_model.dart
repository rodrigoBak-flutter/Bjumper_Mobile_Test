import 'package:app_bjumper_bak/src/domain/entities/repositoryDTO.dart';

class RepositoryModel extends RepositoryDTO {
  @override
  // ignore: overridden_fields
  final String name;
  @override
  // ignore: overridden_fields
  final int stars;
  @override
  // ignore: overridden_fields
  final int forks;

  RepositoryModel({
    required this.name,
    required this.stars,
    required this.forks,
  }) : super(
          name: name,
          stars: stars,
          forks: forks,
        );

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      name: json['name'] as String,
      stars: json['stargazers_count'] as int,
      forks: json['forks_count'] as int,
    );
  }
}
