import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/controller/home_view_model.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/widget/error_message.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/widget/repositories_list.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/widget/user_profile.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/widget/search_field.dart';

class HomeScreen extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();
  static const String routeName = 'home';
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/icons/bjumperLogo.svg',
                fit: BoxFit.cover,
                alignment: AlignmentDirectional.center,
              ),
            ),
            SearchField(
              controller: _controller,
              onSearch: () {
                if (state.isSearchMode) {
                  ref
                      .read(homeViewModelProvider.notifier)
                      .searchUser(_controller.text);
                } else {
                  _controller.clear();
                  ref.read(homeViewModelProvider.notifier).clearSearch();
                }
              },
            ),
            const SizedBox(height: 20),
            if (state.isLoading)
              const Center(child: CircularProgressIndicator()),
            if (!state.isLoading && state.errorMessage != null)
              ErrorMessage(message: state.errorMessage!),
            if (state.user != null) ...[
              UserProfile(user: state.user!),
              const SizedBox(height: 20),
              if (state.repositories != null)
                RepositoriesList(repositories: state.repositories!),
            ],
          ],
        ),
      ),
    );
  }
}
