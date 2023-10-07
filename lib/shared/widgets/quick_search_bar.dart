import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/modules/home/pages/home_page.dart';
import 'package:move_home_assignment/shared/models/filters_model.dart';

class QuickSearchBar extends StatelessWidget {
  QuickSearchBar({Key? key}) : super(key: key);

  void _handleSearch(BuildContext context, String category) {
    BlocProvider.of<ArticlesBloc>(context).add(ArticlesLoadingEvent());

    BlocProvider.of<ArticlesBloc>(context).add(
      LoadArticlesWithFilters(
        filters: FiltersEntity(
          category: category,
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

  final Map<String, String> categories = {
    'Business': 'business',
    'Entertainment': 'entertainment',
    'Technology': 'technology',
    'Health': 'health',
    'Sports': 'sports',
  };

  @override
  Widget build(BuildContext context) {
    final buttons = categories.entries.map((entry) {
      final categoryText = entry.key;
      final categoryValue = entry.value;
      return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0), // Add horizontal padding
        child: Row(
          children: [
            TextButton(
              onPressed: () => _handleSearch(context, categoryValue),
              child: Text(categoryText),
            ),
            // Add a divider after each button except the last one
            if (entry != categories.entries.last)
              const VerticalDivider(
                color: Color.fromARGB(
                    255, 13, 13, 13), // You can customize the color here
                thickness: 1.0, // You can adjust the thickness as needed
                width: 10.0, // You can adjust the width as needed
              ),
          ],
        ),
      );
    }).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Make it scroll horizontally
      child: Row(
        children: buttons,
      ),
    );
  }
}
