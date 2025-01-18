import 'package:app_bjumper_bak/src/data/models/usersDTO_model.dart';
import 'package:app_bjumper_bak/src/domain/entities/repositoryDTO.dart';
import 'package:app_bjumper_bak/src/domain/repositories/github_repository.dart';
import 'package:app_bjumper_bak/src/data/datasource/github_remote_data_source.dart';

class GitHubRepositoryImpl implements GitHubRepository {
  final GitHubRemoteDataSource remoteDataSource;

  GitHubRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserModel> getUser(String username) {
    return remoteDataSource.fetchUser(username);
  }

  @override
  Future<List<RepositoryDTO>> getUserRepositories(String username) async {
    final repos = await remoteDataSource.fetchUserRepositories(username);
    return repos
        .map((repo) => RepositoryDTO(
              name: repo.name,
              stars: repo.stars,
              forks: repo.forks,
            ))
        .toList();
  }
}
