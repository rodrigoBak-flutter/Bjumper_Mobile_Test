import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/controller/home_view_model.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/widget/error_message.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/widget/repositories_list.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/widget/user_profile.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/widget/search_field.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final text = _controller.text;
      if (text.isEmpty) {
        ref.read(homeViewModelProvider.notifier).clearSearch();
      } else {
        ref.read(homeViewModelProvider.notifier).searchUser(text);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.only(top: 30,bottom: 5),
              child: SearchField(
                controller: _controller,
              ),
            ),
            if (state.isLoading)
              const Center(child: CircularProgressIndicator()),
            if (!state.isLoading && state.errorMessage != null)
              ErrorMessage(
                  message: 'The user @${_controller.text} does not exist'),
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
