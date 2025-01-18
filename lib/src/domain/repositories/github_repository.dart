import 'package:app_bjumper_bak/src/domain/entities/repositoryDTO.dart';
import 'package:app_bjumper_bak/src/domain/entities/userDTO.dart';

abstract class GitHubRepository {
  Future<UserDTO> getUser(String username);
  Future<List<RepositoryDTO>> getUserRepositories(String username);
}