import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/filtered_search/filtered_search_bloc.dart';

class CustomSearchBar extends StatelessWidget {
  final VoidCallback onSearchPressed;
  final TextEditingController textController;

  const CustomSearchBar({
    Key? key,
    required this.onSearchPressed,
    required this.textController,
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
            onChanged: (query) {
              BlocProvider.of<FilteredSearchBloc>(context).add(
                LoadFilteredSearchQuery(searchQuery: query),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSearchPressed,
          ),
        ],
      ),
    );
  }
}
