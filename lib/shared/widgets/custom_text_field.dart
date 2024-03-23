import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/shared/widgets/custom_container.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;
  final int? lines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: CupertinoTextField(
        minLines: null,
        maxLines: null,
        expands: true,
        style: const TextStyle(color: Colors.white),
        controller: controller,
        onChanged: onChanged,
        decoration: const BoxDecoration(color: Colors.transparent),
      ),
    );
  }
}
