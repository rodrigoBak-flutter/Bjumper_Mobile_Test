import 'package:app_bjumper_bak/src/presentation/features/home/widget/repository_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_bjumper_bak/src/presentation/style/bjumper_colors.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/controller/home_view_model.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/widget/error_message.dart';
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
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _searchUser() {
    final text = _controller.text;
    ref.read(homeViewModelProvider.notifier).clearSearch();
    if (text.isNotEmpty)
      ref.read(homeViewModelProvider.notifier).searchUser(text);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      backgroundColor: BjumperColors.neutral010,
      appBar: AppBar(
        backgroundColor: BjumperColors.neutral010,
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/bjumperLogo.svg',
                    fit: BoxFit.cover,
                    alignment: AlignmentDirectional.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 5),
                    child: SearchField(
                      controller: _controller,
                      onSearch: _searchUser,
                    ),
                  ),
                  if (state.errorMessage != null)
                    ErrorMessage(
                        message:
                            'The user @${_controller.text} does not exist ${state.errorMessage}' ),
                  if (state.user != null) ...[
                    UserProfile(user: state.user!),
                    const SizedBox(height: 10),
                    if (state.repositories != null)
                      RepositoryListView(repositories: state.repositories!),
                  ],
                ],
              ),
            ),
    );
  }
}

/*

visible: state.user == null && state.repositories == null,

IconButton(
                onPressed: () => ref
                    .read(homeViewModelProvider.notifier)
                    .clearSearch(),
                icon: const Icon(
                  Icons.close,
                  color: BjumperColors.primary,
                  size: 40,
                )),

                Visibility(
              visible: state.user != null && state.repositories != null,
              child: const Divider(
                thickness: 2,
                color: BjumperColors.primary,
              ),
            ),
 */