import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_bjumper_bak/src/core/error/exceptions.dart';
import 'package:app_bjumper_bak/src/app/di/di.dart';
import 'package:app_bjumper_bak/src/domain/entities/repositoryDTO.dart';
import 'package:app_bjumper_bak/src/domain/entities/userDTO.dart';
import 'package:app_bjumper_bak/src/domain/usescases/get_user_and_repos.dart';

class HomeState {
  final UserDTO? user;
  final List<RepositoryDTO>? repositories;
  final String? errorMessage;
  final bool isLoading;
  final bool isRetrying;

  HomeState({
    this.user,
    this.repositories,
    this.errorMessage,
    this.isLoading = false,
    this.isRetrying = false,
  });

  HomeState copyWith({
    UserDTO? user,
    List<RepositoryDTO>? repositories,
    String? errorMessage,
    bool? isLoading,
    bool? isRetrying,
  }) {
    return HomeState(
      user: user ?? this.user,
      repositories: repositories ?? this.repositories,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isRetrying: isRetrying ?? this.isRetrying,
    );
  }
}

class HomeViewModel extends StateNotifier<HomeState> {
  final GetUserAndRepos getUserAndRepos;

  HomeViewModel(this.getUserAndRepos) : super(HomeState());

  Future<void> searchUser(String username) async {
    // Limpiar el estado antes de empezar la búsqueda
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final result = await getUserAndRepos(username);

      // Actualizar el estado con los datos del usuario y repositorios
      state = state.copyWith(
        user: result.user,
        repositories: result.repositories,
        errorMessage: null, // Limpiar cualquier error anterior
        isLoading: false,
      );
    } on ApiException catch (e) {
      final errorData = e.responseData;
      final errorMessage =
          errorData['message'] ?? 'Failed to fetch user and repositories';

      // Si no se encuentra el usuario o los repositorios, actualizar el estado con el error específico
      state = state.copyWith(
        errorMessage: errorMessage,
        isLoading: false,
      );
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Unexpected error: $e');
      }
      state = state.copyWith(
        errorMessage: 'An unexpected error occurred',
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
