import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c15/core/resources/ColorManager.dart';

class AppStyle{
  static ThemeData lightTheme = ThemeData(
    tabBarTheme: TabBarThemeData(
      tabAlignment: TabAlignment.start,
      unselectedLabelColor: ColorManager.lightPrimaryColor,
      labelColor: ColorManager.lightPrimaryColor,
      indicatorColor: ColorManager.lightPrimaryColor,
      dividerHeight: 0,
      unselectedLabelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorManager.lightPrimaryColor
      ),
      labelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: ColorManager.lightPrimaryColor
      )
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 20.sp,
        color: ColorManager.lightPrimaryColor,
        fontWeight: FontWeight.w700
      ),
      headlineMedium: TextStyle(
        fontSize: 24.sp,
        color: ColorManager.lightPrimaryColor,
        fontWeight: FontWeight.w500
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.greyColor
      )
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorManager.lightPrimaryColor,
        primary: ColorManager.lightPrimaryColor,
      secondary: ColorManager.lightSecondaryColor
    ),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorManager.lightPrimaryColor,
        fontSize: 20.sp
      )
    )
  );
}