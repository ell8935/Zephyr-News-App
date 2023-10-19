import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zephy_news_app/bloc/filters/filters_bloc.dart';
import 'package:zephy_news_app/bloc/articles/articles_bloc.dart';
import 'package:zephy_news_app/shared/models/filters_model.dart';
import 'package:zephy_news_app/modules/home/pages/home_page.dart';
import 'package:zephy_news_app/shared/constants/categories_constants.dart';

class QuickSearchBar extends StatelessWidget {
  const QuickSearchBar({Key? key}) : super(key: key);

  void _handleSearch(BuildContext context, String category) {
    BlocProvider.of<FiltersBloc>(context).add(LoadFilters(category: category));

    BlocProvider.of<ArticlesBloc>(context).add(ArticlesLoadingEvent());

    BlocProvider.of<ArticlesBloc>(context).add(
      LoadArticlesWithFilters(
        byCategory: true,
        filters: FiltersEntity(category: category),
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

  @override
  Widget build(BuildContext context) {
    final buttons = categoriesConstants.entries.map((entry) {
      final categoryText = entry.key;
      final categoryValue = entry.value;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Row(
          children: [
            TextButton(
              onPressed: () => _handleSearch(context, categoryValue),
              child: Text(
                categoryText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );
    }).toList();

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: buttons,
          ),
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}
