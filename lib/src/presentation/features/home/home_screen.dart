import 'package:app_bjumper_bak/src/presentation/shared/svg/bjumper_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/widget/home_widget.dart';
import 'package:app_bjumper_bak/src/presentation/shared/animations/bjumper_animation.dart';
import 'package:app_bjumper_bak/src/presentation/style/bjumper_colors.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/controller/home_view_model.dart';
import 'package:app_bjumper_bak/src/presentation/features/home/widget/error_message.dart';
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
    _controller.dispose();
    super.dispose();
  }

  void _searchUser() {
    final text = _controller.text;
    final notifier = ref.read(homeViewModelProvider.notifier);
    notifier.clearSearch();
    if (text.isNotEmpty) {
      notifier.searchUser(text);
    }
  }

  Widget _buildSearchBody(HomeState state) {
    if (state.isLoading) {
      return const Center(child: BjumperAnimation());
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: state.user == null
          ? _buildSearchInput(state)
          : HomeWidget(
              onPressed: () {
                _controller.clear();
                ref.read(homeViewModelProvider.notifier).clearSearch();
              },
              user: state.user!,
              repositories: state.repositories!,
            ),
    );
  }

  Widget _buildSearchInput(HomeState state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: BjumperSvg(svgBjumperName: 'assets/icons/bjumperLogo.svg')),
          const SizedBox(height: 20),
          SearchField(
            controller: _controller,
            onSearch: _searchUser,
          ),
          if (state.errorMessage != null)
            ErrorMessage(
                message: 'The user @${_controller.text} does not exist'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);
    return Scaffold(
      backgroundColor: BjumperColors.neutral010,
      appBar: AppBar(
        backgroundColor: BjumperColors.neutral010,
      ),
      body: _buildSearchBody(state),
    );
  }
}
