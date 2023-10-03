import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/filtered_search/filtered_search_bloc.dart';
import 'package:move_home_assignment/data/models/filtered_search_model.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/custom_search_bar.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/range_date_picker.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FilterBarState createState() => _FilterBarState();
}

void handleSearch(BuildContext context, selectedFilters) {
  BlocProvider.of<ArticlesBloc>(context).add(LoadArticlesWithFilters(
      filters: FilteredSearchEntity(keywords: selectedFilters)));
}

final TextEditingController textController = TextEditingController();

class _FilterBarState extends State<FilterBar> {
  @override
  Widget build(BuildContext context) {
    // return Container();
    return BlocBuilder<FilteredSearchBloc, FilteredSearchState>(
      builder: (context, state) {
        if (state is FilteredSearchLoaded) {
          // Extract the selected filters from the state
          final selectedFilters = state.filters;
          return Column(
            children: [
              const RangeDatePicker(),
              Column(children: [
                CustomSearchBar(
                  onSearchPressed: () =>
                      handleSearch(context, selectedFilters.keywords),
                  textController: textController,
                ),
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
