import 'package:app_bjumper_bak/src/core/error/exceptions.dart';
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
        throw ApiException(
          'Error ${response.statusCode}: Could not get user.',
          responseData: {'status': response.statusCode, 'message': 'User not found'},
        );
      }
    } catch (e) {
      throw ApiException('Error searching user: $e');
    }
  }

  Future<List<RepositoryModel>> fetchUserRepositories(String username) async {
    try {
      final response = await get('https://api.github.com/users/$username/repos');
      if (response.statusCode == 200) {
        final List<dynamic> reposJson = jsonDecode(response.body);
        return reposJson.map((json) => RepositoryModel.fromJson(json)).toList();
      } else {
        throw ApiException(
          'Error ${response.statusCode}: Could not get repositories.',
          responseData: {'status': response.statusCode, 'message': 'Repositories not found'},
        );
      }
    } catch (e) {
      throw ApiException('Error searching repositories: $e');
    }
  }
}
