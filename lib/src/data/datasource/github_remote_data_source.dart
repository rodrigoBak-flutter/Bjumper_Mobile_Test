import 'package:app_bjumper_bak/src/core/mixins/network_mixin.dart';
import 'package:app_bjumper_bak/src/data/models/repository_model.dart';
import 'package:app_bjumper_bak/src/data/models/usersDTO_model.dart';
import 'dart:convert';

class GitHubRemoteDataSource with NetworkMixin {
  Future<UserModel> fetchUser(String username) async {
    final response = await get('https://api.github.com/users/$username');
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch user');
    }
  }

  Future<List<RepositoryModel>> fetchUserRepositories(String username) async {
    final response = await get('https://api.github.com/users/$username/repos');
    if (response.statusCode == 200) {
      final List<dynamic> reposJson = jsonDecode(response.body);
      return reposJson.map((json) => RepositoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch repositories');
    }
  }
}
