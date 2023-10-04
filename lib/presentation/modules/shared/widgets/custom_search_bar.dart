import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final dynamic onChanged;
  final TextEditingController textController;

  const CustomSearchBar({
    Key? key,
    required this.textController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textController,
        decoration: const InputDecoration(
          hintText: 'Search',
        ),
        onChanged: onChanged);
  }
}
