import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const SearchField({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: '@Username',
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: onSearch,
        ),
      ),
    );
  }
}
