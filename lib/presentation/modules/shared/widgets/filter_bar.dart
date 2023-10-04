import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/filtered_search/filters_bloc.dart';
import 'package:move_home_assignment/data/models/filters_model.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/custom_search_bar.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/range_date_picker.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FilterBarState createState() => _FilterBarState();
}

void handleSearch(BuildContext context, FiltersEntity currentFilters) {
  BlocProvider.of<ArticlesBloc>(context).add(LoadArticlesWithFilters(
      filters: FiltersEntity(
    keywords: currentFilters.keywords,
    from: currentFilters.from,
    to: currentFilters.to,
    sortBy: currentFilters.sortBy,
  )));
}

void handleFieldChange(BuildContext context, FiltersEntity currentFilters,
    String query, String fieldName) {
  FiltersEntity updatedFilters;
  switch (fieldName) {
    case 'keywords':
      updatedFilters = currentFilters.copyWith(keywords: query);
      break;
    case 'sortBy':
      updatedFilters = currentFilters.copyWith(sortBy: query);
      break;
    default:
      updatedFilters = currentFilters;
  }
  BlocProvider.of<FiltersBloc>(context).add(LoadFilters(
    keywords: updatedFilters.keywords,
    from: updatedFilters.from,
    to: updatedFilters.to,
    sortBy: updatedFilters.sortBy,
  ));
}

void handleDateChange(BuildContext context, FiltersEntity currentFilters,
    String from, String to) {
  FiltersEntity updatedFilters = currentFilters.copyWith(from: from, to: to);

  BlocProvider.of<FiltersBloc>(context).add(LoadFilters(
    keywords: updatedFilters.keywords,
    from: updatedFilters.from,
    to: updatedFilters.to,
    sortBy: updatedFilters.sortBy,
  ));
}

final TextEditingController textController = TextEditingController();

class _FilterBarState extends State<FilterBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        if (state is FiltersLoaded) {
          // Extract the selected filters from the state
          final currentFilters = state.filters;
          return Column(
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => handleSearch(context, currentFilters),
              ),
              Text(
                state.filters.sortBy!,
                style: const TextStyle(color: Colors.black),
              ),
              RangeDatePicker(
                  onChanged: (from, to) =>
                      handleDateChange(context, currentFilters, from, to)),
              Column(children: [
                CustomSearchBar(
                    textController: textController,
                    onChanged: (query) => handleFieldChange(
                        context, currentFilters, query, 'keywords')),
              ]),
            ],
          );
        } else {
          // Handle other states or return a default UI
          return const CircularProgressIndicator(); // Replace with appropriate UI
        }
      },
    );
  }
}
