import 'package:app_bjumper_bak/src/core/mixins/network_mixin.dart';
import 'package:app_bjumper_bak/src/data/models/repository_model.dart';
import 'package:app_bjumper_bak/src/data/models/users_model.dart';
import 'dart:convert';

class GitHubRemoteDataSource with NetworkMixin {
  Future<UserModel> fetchUser(String username) async {
    try {
      final response = await get('https://api.github.com/users/$username');
      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error ${response.statusCode}: Could not get user.');
      }
    } catch (e) {
      throw Exception('Error searching user: $e');
    }
  }

  Future<List<RepositoryModel>> fetchUserRepositories(String username) async {
    try {
      final response = await get('https://api.github.com/users/$username/repos');
      if (response.statusCode == 200) {
        final List<dynamic> reposJson = jsonDecode(response.body);
        return reposJson.map((json) => RepositoryModel.fromJson(json)).toList();
      } else {
        throw Exception('Error ${response.statusCode}: Could not get repositories.');
      }
    } catch (e) {
      throw Exception('Error searching repositories: $e');
    }
  }
}
