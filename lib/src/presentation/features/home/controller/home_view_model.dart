import 'package:app_bjumper_bak/src/core/services/di.dart';
import 'package:app_bjumper_bak/src/domain/entities/repositoryDTO.dart';
import 'package:app_bjumper_bak/src/domain/entities/userDTO.dart';
import 'package:app_bjumper_bak/src/domain/usescases/get_user_and_repos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  final UserDTO? user;
  final List<RepositoryDTO>? repositories;
  final String? errorMessage;
 
  final bool isLoading;

  HomeState({
    this.user,
    this.repositories,
    this.errorMessage,
   
    this.isLoading = false,
  });

  HomeState copyWith({
    UserDTO? user,
    List<RepositoryDTO>? repositories,
    String? errorMessage,
    bool? isSearchMode,
    bool? isLoading,
  }) {
    return HomeState(
      user: user ?? this.user,
      repositories: repositories ?? this.repositories,
      errorMessage: errorMessage ?? this.errorMessage,
      
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class HomeViewModel extends StateNotifier<HomeState> {
  final GetUserAndRepos getUserAndRepos;

  HomeViewModel(this.getUserAndRepos) : super(HomeState());

  Future<void> searchUser(String username) async {
    state = state.copyWith(isLoading: true);
   
    try {
      final result = await getUserAndRepos(username);
      state = state.copyWith(
        user: result.user,
        repositories: result.repositories,
        errorMessage: null,
       
        isLoading: false,
      );
    } catch (e) {
      if (kDebugMode) {
        debugPrint('$e');
      }
      state = state.copyWith(
        errorMessage: 'Failed to fetch user and repositories',
      
        isLoading: false,
      );
    }
  }

  void clearSearch() {
    state = HomeState();
  }
}

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  final getUserAndRepos = ref.read(getUserAndReposProvider);
  return HomeViewModel(getUserAndRepos);
});
