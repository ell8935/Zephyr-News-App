import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/filters/filters_bloc.dart';
import 'package:move_home_assignment/data/models/filters_model.dart';
import 'package:move_home_assignment/presentation/modules/home/pages/home_page.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/custom_search_bar.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/range_date_picker.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({Key? key}) : super(key: key);

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  final FocusScopeNode _textFocusScopeNode = FocusScopeNode();
  final FocusNode _textFieldFocusNode = FocusNode();

  @override
  void dispose() {
    _textFocusScopeNode.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  void toggleSearch() {
    setState(() {
      if (_textFieldFocusNode.hasFocus) {
        _textFieldFocusNode.unfocus();
      } else {
        _textFieldFocusNode.requestFocus();
      }
    });
  }

  void handleSearch(BuildContext context, FiltersEntity currentFilters) {
    BlocProvider.of<ArticlesBloc>(context).add(
      LoadArticlesWithFilters(
        filters: FiltersEntity(
          keywords: currentFilters.keywords,
          from: currentFilters.from,
          to: currentFilters.to,
          sortBy: currentFilters.sortBy,
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
                  onChanged: (query) => handleFieldChange(
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
                onPressed: textController
                        .text.isEmpty // Conditionally enable/disable IconButton
                    ? null // Disabled if the CustomSearchBar is empty
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
