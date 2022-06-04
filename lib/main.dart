import 'package:article_finder/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final w700BitterFont = GoogleFonts.bitter(
      fontWeight: FontWeight.w700,
    );
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
          primaryTextTheme: TextTheme(
            headline6: w700BitterFont,
          ),
          textTheme: TextTheme(
            subtitle1: w700BitterFont.apply(color: AppColors.black),
            headline6: w700BitterFont.apply(color: AppColors.black),
            bodyText2: TextStyle(color: AppColors.black),
          )),
      home: Container(),
    );
  }
}
