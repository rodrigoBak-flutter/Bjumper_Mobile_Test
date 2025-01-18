import 'package:app_bjumper_bak/src/data/datasource/github_remote_data_source.dart';
import 'package:app_bjumper_bak/src/data/repositories/git_repository_impl.dart';
import 'package:app_bjumper_bak/src/domain/usescases/get_user_and_repos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getUserAndReposProvider = Provider<GetUserAndRepos>((ref) {
  final githubRemoteDataSource = GitHubRemoteDataSource();
  final githubRepository = GitHubRepositoryImpl(githubRemoteDataSource);
  return GetUserAndRepos(githubRepository);
});
