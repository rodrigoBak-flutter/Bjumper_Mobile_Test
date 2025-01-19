import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchField extends ConsumerWidget {
  final TextEditingController controller;

  const SearchField({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: '@Username',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                12.0), // Ajusta el valor para mayor o menor curvatura
            borderSide: const BorderSide(
              color: Colors.grey, // Cambia el color del borde si es necesario
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.blue, // Color del borde al hacer foco
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Colors.grey, // Color del borde por defecto
              width: 1.0,
            ),
          ),
        ));
  }
}
