import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/bloc/filters/filters_bloc.dart';
import 'package:move_home_assignment/shared/models/filters_model.dart';
import 'package:move_home_assignment/modules/home/pages/home_page.dart';
import 'package:move_home_assignment/shared/widgets/custom_search_bar.dart';
import 'package:move_home_assignment/shared/widgets/range_date_picker.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  void handleSearch(BuildContext context, FiltersEntity currentFilters) {
    BlocProvider.of<ArticlesBloc>(context).add(
      LoadArticlesWithFilters(
        filters: FiltersEntity(
          keywords: currentFilters.keywords,
          from: currentFilters.from,
          to: currentFilters.to,
        ),
      ),
    );
    _navigateToHomePage(context);
  }

  void _navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  void handleSearchChange(BuildContext context, FiltersEntity currentFilters,
      String query, String fieldName) {
    FiltersEntity updatedFilters = currentFilters.copyWith(keywords: query);

    BlocProvider.of<FiltersBloc>(context).add(LoadFilters(
      keywords: updatedFilters.keywords,
      from: updatedFilters.from,
      to: updatedFilters.to,
    ));
  }

  void handleDateChange(BuildContext context, FiltersEntity currentFilters,
      String from, String to) {
    FiltersEntity updatedFilters = currentFilters.copyWith(from: from, to: to);

    BlocProvider.of<FiltersBloc>(context).add(LoadFilters(
      keywords: updatedFilters.keywords,
      from: updatedFilters.from,
      to: updatedFilters.to,
    ));
  }

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        if (state is FiltersLoaded) {
          final currentFilters = state.filters;
          return Row(
            children: [
              Expanded(
                child: CustomSearchBar(
                  textController: textController,
                  onChanged: (query) => handleSearchChange(
                      context, currentFilters, query, 'keywords'),
                ),
              ),
              RangeDatePicker(
                onChanged: (from, to) =>
                    handleDateChange(context, currentFilters, from, to),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                color: const Color.fromARGB(255, 65, 159, 199),
                onPressed: textController.text.isEmpty
                    ? null
                    : () => handleSearch(context, currentFilters),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
