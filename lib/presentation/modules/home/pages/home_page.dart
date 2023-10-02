import 'package:flutter/material.dart';
import 'package:move_home_assignment/presentation/modules/shared/api/get_news.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/custom_search_bar.dart';
import 'package:move_home_assignment/presentation/modules/shared/widgets/range_date_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Center(
            child: SingleChildScrollView(
              // Wrap with SingleChildScrollView
              child: Column(
                children: [
                  // Add other content above the SearchBar if needed
                  CustomSearchBar(),
                  // Add other content below the SearchBar if needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
