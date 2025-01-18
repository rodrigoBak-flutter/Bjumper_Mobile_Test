
import 'package:app_bjumper_bak/src/data/datasource/github_remote_data_source.dart';
import 'package:app_bjumper_bak/src/domain/entities/repositoryDTO.dart';
import 'package:app_bjumper_bak/src/domain/entities/userDTO.dart';
import 'package:app_bjumper_bak/src/domain/repositories/github_repository.dart';

class GitHubRepositoryImpl implements GitHubRepository {
  final GitHubRemoteDataSource remoteDataSource;

  GitHubRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserDTO> getUser(String username) async {
    return await remoteDataSource.fetchUser(username);
  }

  @override
  Future<List<RepositoryDTO>> getUserRepositories(String username) async {
    return await remoteDataSource.fetchUserRepositories(username);
  }
}
