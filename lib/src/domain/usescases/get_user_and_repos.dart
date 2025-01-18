import 'package:app_bjumper_bak/src/domain/entities/repositoryDTO.dart';
import 'package:app_bjumper_bak/src/domain/entities/userDTO.dart';
import 'package:app_bjumper_bak/src/domain/repositories/github_repository.dart';

class UserAndRepositories {
  final UserDTO user;
  final List<RepositoryDTO> repositories;

  UserAndRepositories({
    required this.user,
    required this.repositories,
  });
}

class GetUserAndRepos {
  final GitHubRepository repository;

  GetUserAndRepos(this.repository);

  Future<UserAndRepositories> call(String username) async {
    try {
      final user = await repository.getUser(username);
      final repos = await repository.getUserRepositories(username);
      return UserAndRepositories(user: user, repositories: repos);
    } catch (e) {
      throw Exception('Failed to fetch user and repositories: $e');
    }
  }
}
