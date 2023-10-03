import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/business_logic/bloc/filtered_search/filtered_search_bloc.dart';
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ArticlesBloc()..add(const LoadArticles()),
        ),
        BlocProvider(
            create: (context) => FilteredSearchBloc()
              ..add(const LoadFilteredSearchKeywords(keywords: 'elon')))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const SafeArea(child: Scaffold(body: HomePage())),
      ),
    );
  }
}
