import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/bloc/filters/filters_bloc.dart';
import 'package:move_home_assignment/bloc/focused_article/focused_article_bloc.dart';
import 'package:move_home_assignment/modules/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ArticlesBloc()..add(const LoadArticlesWithFilters()),
        ),
        BlocProvider(
          create: (context) => FiltersBloc()..add(const LoadFilters()),
        ),
        BlocProvider(
          create: (context) =>
              FocusedArticleBloc()..add(const LoadFocusedArticle()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, fontFamily: 'Oswald'),
        home: const HomePage(),
      ),
    );
  }
}
