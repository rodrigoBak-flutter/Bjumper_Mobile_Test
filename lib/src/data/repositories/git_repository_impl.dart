
import 'package:app_bjumper_bak/src/core/error/exceptions.dart';
import 'package:app_bjumper_bak/src/data/datasource/github_remote_data_source.dart';
import 'package:app_bjumper_bak/src/domain/entities/repositoryDTO.dart';
import 'package:app_bjumper_bak/src/domain/entities/userDTO.dart';
import 'package:app_bjumper_bak/src/domain/repositories/github_repository.dart';

class GitHubRepositoryImpl implements GitHubRepository {
  final GitHubRemoteDataSource remoteDataSource;

  GitHubRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserDTO> getUser(String username) async {
    try {
      // Obtienes el modelo de datos desde el datasource
      final userModel = await remoteDataSource.fetchUser(username);

      // Aquí simplemente retornas el DTO directamente, ya que UserModel ya extiende UserDTO
      return userModel;
    } catch (e) {
      // Lanzas una excepción específica si es necesario
      throw ApiException('Failed to fetch user');
    }
  }

  @override
  Future<List<RepositoryDTO>> getUserRepositories(String username) async {
    try {
      // Obtienes los modelos de datos desde el datasource
      final repositoryModels = await remoteDataSource.fetchUserRepositories(username);

      // Aquí también retornas los modelos directamente, ya que RepositoryModel ya extiende RepositoryDTO
      return repositoryModels;
    } catch (e) {
      // Lanzas una excepción específica si es necesario
      throw ApiException('Failed to fetch repositories');
    }
  }
}
