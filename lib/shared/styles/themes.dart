import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_book/shared/styles/colors.dart';

var themeLight = ThemeData(
  scaffoldBackgroundColor: kBackgroundLightColor,
  primaryColor: kBasicColor,
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

var loginTheme = LoginTheme(
  //headerMargin: 0,
  //logoWidth: 500,

  accentColor: Colors.white,
  pageColorDark: Colors.transparent,
  pageColorLight: Colors.transparent,
  primaryColor: kBasicColor,

  errorColor: Colors.red,
  titleStyle: const TextStyle(
    color: Colors.greenAccent,
    // fontFamily: 'Quicksand',
    letterSpacing: 4,
  ),
  bodyStyle: const TextStyle(
    fontStyle: FontStyle.italic,
    decoration: TextDecoration.underline,
  ),
  textFieldStyle: GoogleFonts.roboto(
    fontSize: 16.0,
    color: Colors.black,

    //shadows: [Shadow(color: Colors.yellow)],
  ),
  buttonStyle: const TextStyle(
    fontWeight: FontWeight.w800,
    color: Colors.white,
  ),

  cardTheme: const CardTheme(),
  switchAuthTextColor: Colors.black,
  inputTheme: InputDecorationTheme(
    filled: false,
    contentPadding: const EdgeInsets.all(20.0),
    errorStyle: const TextStyle(
      color: Colors.red,
    ),
    labelStyle:
        GoogleFonts.roboto(fontWeight: FontWeight.w300, color: Colors.black),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kBasicColor),
      borderRadius: BorderRadius.circular(15.0),
      //borderRadius: inputBorder,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kBasicColor),
      borderRadius: BorderRadius.circular(15.0),
      //borderRadius: inputBorder,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red.shade700),
      borderRadius: BorderRadius.circular(15.0),

      //borderRadius: inputBorder,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red.shade400),
      borderRadius: BorderRadius.circular(15.0),

      //borderRadius: inputBorder,
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(15.0),

      //borderRadius: inputBorder,
    ),
  ),

  buttonTheme: LoginButtonTheme(
    splashColor: kBasicColor.withAlpha(100),
    backgroundColor: kBasicColor,
    highlightColor: kBasicColor.withOpacity(0.8),
    // highlightColor: AppColors.bottomGradiant,
    elevation: 9.0,
    highlightElevation: 6.0,
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //shape: CircleBorder(side: BorderSide(color: Colors.green)),
    // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
  ),
);
