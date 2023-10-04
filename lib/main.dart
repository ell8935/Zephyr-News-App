import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/filters/filters_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/focused_article/focused_article_bloc.dart';
import 'package:move_home_assignment/presentation/modules/home/pages/home_page.dart';
import 'package:move_home_assignment/business_logic/bloc/articles/articles_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the status bar to transparent
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    // ));

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ArticlesBloc()..add(const LoadArticles()),
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
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
