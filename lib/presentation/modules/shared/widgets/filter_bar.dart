import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/filtered_search/filtered_search_bloc.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/custom_search_bar.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/range_date_picker.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({Key? key}) : super(key: key);

  @override
  _FilterBarState createState() => _FilterBarState();
}

void handleSearch(BuildContext context, selectedFilters) {
  BlocProvider.of<ArticlesBloc>(context)
      .add(LoadArticlesWithFilters(filters: selectedFilters));
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
          final selectedFilters = state.filters.keywords;
          // return const Text('asd');
          return Column(
            children: [
              const RangeDatePicker(),
              Column(children: [
                CustomSearchBar(
                  onSearchPressed: () => handleSearch(context, selectedFilters),
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
