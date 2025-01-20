import 'package:app_bjumper_bak/src/data/datasource/github_remote_data_source.dart';
import 'package:app_bjumper_bak/src/data/repositories/git_repository_impl.dart';
import 'package:app_bjumper_bak/src/domain/repositories/github_repository.dart';
import 'package:app_bjumper_bak/src/domain/usescases/get_user_and_repos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final githubRemoteDataSourceProvider = Provider<GitHubRemoteDataSource>((ref) {
  return GitHubRemoteDataSource();
});

final githubRepositoryProvider = Provider<GitHubRepository>((ref) {
  final githubRemoteDataSource = ref.read(githubRemoteDataSourceProvider);
  return GitHubRepositoryImpl(githubRemoteDataSource);
});

final getUserAndReposProvider = Provider<GetUserAndRepos>((ref) {
  final githubRepository = ref.read(githubRepositoryProvider);
  return GetUserAndRepos(githubRepository);
});
