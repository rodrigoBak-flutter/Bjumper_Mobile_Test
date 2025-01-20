import 'package:app_bjumper_bak/src/core/error/exceptions.dart';
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
    } on ApiException catch (e) {
      // Manejo de errores específico de la capa de datos
      throw ApiException('Failed to fetch user and repositories: ${e.message}');
    } catch (e) {
      // Captura de errores inesperados
      throw ApiException('Unexpected error: $e');
    }
  }
}
