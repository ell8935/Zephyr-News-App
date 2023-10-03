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

void handleSearch(BuildContext context) {
  BlocProvider.of<ArticlesBloc>(context).add(const LoadArticles());
}

final TextEditingController textController = TextEditingController();

class _FilterBarState extends State<FilterBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilteredSearchBloc, FilteredSearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          children: [
            const RangeDatePicker(),
            Expanded(
              child: CustomSearchBar(
                onSearchPressed: () => handleSearch(context),
                textController: textController,
              ),
            ),
          ],
        );
      },
    );
  }
}
