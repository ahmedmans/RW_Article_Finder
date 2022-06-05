import 'package:article_finder/data/article.dart';
import 'package:article_finder/ui/app_colors.dart';
import 'package:article_finder/ui/article_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RW Finder',
      theme: ThemeData(
          primarySwatch: AppColors.black,
          primaryColor: AppColors.black,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                secondary: AppColors.green,
                primary: AppColors.black,
              ),
          scaffoldBackgroundColor: AppColors.grey,
          backgroundColor: AppColors.grey,
          primaryTextTheme: const TextTheme(
            headline6: TextStyle(fontFamily: 'Bitter'),
          ),
          textTheme: TextTheme(
            subtitle1: TextStyle(fontFamily: 'Bitter', color: AppColors.black),
            headline6: TextStyle(fontFamily: 'Bitter', color: AppColors.black),
            bodyText2: TextStyle(color: AppColors.black),
          )),
      home: Scaffold(
        appBar: AppBar(),
        body: Container(),
      ),
    );
  }
}
