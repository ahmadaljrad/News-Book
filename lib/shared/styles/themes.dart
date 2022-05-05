import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/shared/styles/colors.dart';

var themeLight = ThemeData(
  scaffoldBackgroundColor: kBackgroundLightColor,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: kAppBarLightColor,
    ),
    backgroundColor: kAppBarLightColor,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: kBlackColor,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: kGreyLightColor),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kAppBarLightColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: kBlueColor,
    unselectedItemColor: kGreyLightColor,
    elevation: 20.0,
    backgroundColor: kAppBarLightColor,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: kBlackColor,
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: kBackgroundLightColor,
  ),
);

var themeDark = ThemeData(
  scaffoldBackgroundColor: kBackgroundDarkColor,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: kBackgroundDarkColor,
    ),
    backgroundColor: kAppBarDarkColor,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: kWhiteColor,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: kGreyDarkColor),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kAppBarDarkColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: kBlueColor,
    unselectedItemColor: kGreyDarkColor,
    elevation: 20.0,
    backgroundColor: kAppBarDarkColor,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: kWhiteColor,
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: kBackgroundDarkColor,
  ),
);
