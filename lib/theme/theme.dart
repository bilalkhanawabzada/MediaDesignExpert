import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/res/utils/app_colors.dart';

ThemeData themeData(BuildContext context) {
  MaterialColor myColor = const MaterialColor(
    0xFF256DB9,
    <int, Color>{
      50: Color(0xFF256DB9),
      100: Color(0xFF256DB9),
      200: Color(0xFF256DB9),
      300: Color(0xFF256DB9),
      400: Color(0xFF256DB9),
      500: Color(0xFF256DB9),
      600: Color(0xFF256DB9),
      700: Color(0xFF256DB9),
      800: Color(0xFF256DB9),
      900: Color(0xFF256DB9),
    },
  );
  return ThemeData(
    fontFamily: 'Intl',
    primaryColor: myColor,
    appBarTheme: AppBarTheme(
        // color: const Color.fromARGB(255, 245, 241, 241),
        elevation: 0,
        shadowColor: AppColors.white.withOpacity(0.50),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: false,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle.dark),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: myColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: Colors.white,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Color(0xFF256DB9),
      unselectedLabelColor: Color.fromARGB(255, 153, 48, 48),
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: AppColors.textHeadingColor.withOpacity(0.5),
          width: 1,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 19, 31, 101).withOpacity(0.5),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      fillColor: Colors.transparent,
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.textHeadingColor,
      ),
      hintStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.lightGrayColor,
      ),
      filled: true,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        color: AppColors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        color: AppColors.black,
      ),
      displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
      displayMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor,
      ),
    ),
    listTileTheme: ListTileThemeData(
      style: ListTileStyle.drawer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFFE5E5E5),
      thickness: 1,
      space: 0,
      indent: 0,
      endIndent: 0,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.lightPrimaryColor,
      contentTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    primarySwatch: myColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          
        ),
      ),
    ),
  );
}
