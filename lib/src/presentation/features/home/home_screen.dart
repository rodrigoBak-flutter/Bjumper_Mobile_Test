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
  void dispose() {
    _controller
        .dispose(); //libera los recursos del controllador, mejora el rendimiento
    super.dispose();
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
              child: state.user == null
                  ? Column(
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
                                  'The user @${_controller.text} does not exist'),
                      ],
                    )
                  : DecoratedBox(
                      decoration: BoxDecoration(
                        color: BjumperColors.neutral010,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: BjumperColors.primary),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/bjumperLogo.svg',
                                  fit: BoxFit.cover,
                                  alignment: AlignmentDirectional.center,
                                ),
                                IconButton(
                                    onPressed: () {
                                      _controller.clear();
                                      ref
                                          .read(homeViewModelProvider.notifier)
                                          .clearSearch();
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: BjumperColors.primary,
                                      size: 40,
                                    )),
                              ],
                            ),
                            const Divider(
                              color: BjumperColors.primary,
                            ),
                            UserProfile(user: state.user!),
                            const SizedBox(height: 10),
                            if (state.repositories != null)
                              RepositoryListView(
                                  repositories: state.repositories!),
                          ],
                        ),
                      ),
                    ),
            ),
    );
  }
}
