import 'package:app_bjumper_bak/src/domain/repositories/github_repository.dart';

class GetUserAndRepos {
  final GitHubRepository repository;

  GetUserAndRepos(this.repository);

  Future<Map<String, dynamic>> call(String username) async {
    final user = await repository.getUser(username);
    final repos = await repository.getUserRepositories(username);
    return {
      'user': user,
      'repositories': repos,
    };
  }
}