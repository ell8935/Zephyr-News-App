import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/filtered_search/filters_bloc.dart';

class CustomSearchBar extends StatelessWidget {
  final onChanged;
  final TextEditingController textController;

  const CustomSearchBar({
    Key? key,
    required this.textController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
              onChanged: onChanged),
        ],
      ),
    );
  }
}
