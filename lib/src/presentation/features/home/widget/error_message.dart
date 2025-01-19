import 'package:app_bjumper_bak/src/presentation/style/bjumper_colors.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: BjumperColors.system025Intense,
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(message,
                textAlign: TextAlign.center,
                style: const TextStyle(color: BjumperColors.system030ErrorTxt)),
          )),
    );
  }
}
