import 'package:app_bjumper_bak/src/domain/entities/userDTO.dart';
import 'package:app_bjumper_bak/src/domain/repositories/github_repository.dart';
import 'package:app_bjumper_bak/src/domain/usescases/get_user_and_repos.dart';
import 'package:flutter/material.dart';

import 'package:app_bjumper_bak/src/domain/entities/repositoryDTO.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.repository});
  final GitHubRepository repository;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  late final GetUserAndRepos _getUserAndRepos;
  UserDTO? _user;
  List<RepositoryDTO>? _repositories;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _getUserAndRepos = GetUserAndRepos(widget.repository);
  }

  Future<void> _searchUser() async {
    final username = _controller.text.trim();
    if (username.isEmpty) return;

    try {
      final result = await _getUserAndRepos.call(username);
      setState(() {
        _user = result['user'] as UserDTO;
        _repositories = result['repositories'] as List<RepositoryDTO>;
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        _user = null;
        _repositories = null;
        _errorMessage = 'User not found or an error occurred.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub User Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'GitHub Username',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchUser,
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            if (_user != null) ...[
              CircleAvatar(
                backgroundImage: NetworkImage(_user!.avatarUrl),
                radius: 40,
              ),
              Text(_user!.username, style: const TextStyle(fontSize: 24)),
              Text(_user!.fullName ?? ''),
              Text('Followers: ${_user!.followers}'),
              Text(_user!.bio ?? 'No bio available'),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _repositories?.length ?? 0,
                  itemBuilder: (context, index) {
                    final repo = _repositories![index];
                    return ListTile(
                      title: Text(repo.name),
                      subtitle: Text('Forks: ${repo.forks}, Stars: ${repo.stars}'),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}