import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c15/core/resources/AppStyle.dart';
import 'package:news_c15/core/resources/RoutesManager.dart';
import 'package:news_c15/ui/ViewFullArticle/Screen/ViewFullArticle.dart';
import 'package:news_c15/ui/home/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppStyle.lightTheme,
          routes: {
            RoutesManager.home:(_)=>HomeScreen(),
            RoutesManager.ViewFullArticle:(_)=>ViewFullArticle(),
          },
          initialRoute:RoutesManager.home ,
        );
      },
    );
  }
}

