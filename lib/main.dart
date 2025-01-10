import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/articles_screen.dart';
import 'package:news_app/ui/provider/articles_provider.dart';
import 'package:provider/provider.dart';

import 'data/Api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _api = Api(dio: Dio());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => ArticlesProvider(api: _api))
      ], child: ArticlesScreen()),
    );
  }
}
