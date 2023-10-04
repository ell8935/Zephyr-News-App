import 'package:flutter/material.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/article_feed.dart';
import 'package:move_home_assignment/presentation/modules/home/widgets/filter_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ArticleFeed(
              isHomePage: true,
            )
          ],
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(isSearching ? Icons.close : Icons.search),
        onPressed: () {
          setState(() {
            isSearching = !isSearching;
          });
        },
      ),
      title: isSearching ? const FilterBar() : const Text('Headlines'),
      actions: isSearching
          ? []
          : <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30,
                  child: Image.asset(
                    'assets/logos/Logo.png',
                  ),
                ),
              )
            ],
    );
  }
}
