import 'package:app_bjumper_bak/src/presentation/features/home/controller/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchField extends ConsumerWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const SearchField({
    required this.controller,
    required this.onSearch,
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final isSearchMode = ref.read(homeViewModelProvider).isSearchMode;
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: '@Username',
        suffixIcon: IconButton(
          icon: Icon(isSearchMode ? Icons.search : Icons.close),
          onPressed: onSearch,
        ),
      ),
    );
  }
}
