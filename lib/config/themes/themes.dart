import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant/current_local.dart';
import '../colors/app_colors.dart';

class Style {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: false,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: const Color(AppColors.kPrimaryColor),
          onPrimary: const Color(AppColors.kPrimaryColor),
          onSurface: Colors.black,
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: GoogleFonts.rubik(
        color: Colors.black,
        fontSize: 16.sp,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Color(AppColors.kBlackColor),
        statusBarBrightness: Brightness.light,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: isArabic()
          ? GoogleFonts.rubik(
              color: Colors.black,
            )
          : GoogleFonts.rubik(
              color: Colors.black,
            ),
      bodyMedium: isArabic()
          ? GoogleFonts.rubik(
              color: Colors.black,
            )
          : GoogleFonts.rubik(
              color: Colors.black,
            ),
      bodySmall: isArabic()
          ? GoogleFonts.rubik(
              color: Colors.black,
            )
          : GoogleFonts.rubik(
              color: Colors.black,
            ),
      titleLarge: isArabic()
          ? GoogleFonts.rubik(
              color: Colors.black,
            )
          : GoogleFonts.rubik(
              color: Colors.black,
            ),
      titleMedium: isArabic()
          ? GoogleFonts.rubik(
              color: Colors.black,
            )
          : GoogleFonts.rubik(
              color: Colors.black,
            ),
      titleSmall: isArabic()
          ? GoogleFonts.rubik(
              color: Colors.black,
            )
          : GoogleFonts.rubik(
              color: Colors.black,
            ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(AppColors.kPrimaryColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(AppColors.kPrimaryColor),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          isArabic()
              ? GoogleFonts.rubik(
                  color: const Color(
                    AppColors.kPrimaryColor,
                  ),
                )
              : GoogleFonts.rubik(
                  color: const Color(
                    AppColors.kPrimaryColor,
                  ),
                ),
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      headerBackgroundColor: const Color(AppColors.kPrimaryColor),
      todayBackgroundColor: MaterialStateProperty.all(
        const Color(AppColors.kPrimaryColor),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    // scaffoldBackgroundColor: const Color(AppColors.kDarkThemColor),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: const Color(AppColors.kPrimaryColor),
          onPrimary: const Color(AppColors.kPrimaryColor),
          onSurface: Colors.white, // body text color
          brightness: Brightness.dark,
        ),
    appBarTheme: AppBarTheme(
      // backgroundColor: const Color(AppColors.kDarkThemColor),
      elevation: 0,
      backgroundColor: const Color(AppColors.appBarColor),
      titleTextStyle: GoogleFonts.rubik(
        color: Colors.white,
        fontSize: 18.sp,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      actionsIconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: isArabic()
          ? GoogleFonts.rubik(
              color: Colors.black,
            )
          : GoogleFonts.rubik(
              color: Colors.black,
            ),
      bodyMedium: isArabic()
          ? GoogleFonts.rubik(
              color: Colors.black,
            )
          : GoogleFonts.rubik(
              color: Colors.black,
            ),
      bodySmall: isArabic()
          ? GoogleFonts.rubik(
              color: Colors.black,
            )
          : GoogleFonts.rubik(
              color: Colors.black,
            ),
      titleLarge: isArabic()
          ? GoogleFonts.rubik(
              color: Colors.black,
            )
          : GoogleFonts.rubik(
              color: Colors.black,
            ),
      titleMedium: isArabic()
          ? GoogleFonts.rubik(
              color: Colors.black,
            )
          : GoogleFonts.rubik(
              color: Colors.black,
            ),
      titleSmall: isArabic()
          ? GoogleFonts.rubik(
              color: Colors.black,
            )
          : GoogleFonts.rubik(
              color: Colors.black,
            ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(AppColors.kPrimaryColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(AppColors.kPrimaryColor),
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(AppColors.kDarkThemColor),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          GoogleFonts.rubik(
            color: Colors.white,
          ),
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: const Color(AppColors.kDarkThemColor),
      headerHeadlineStyle: GoogleFonts.rubik(color: Colors.white),
      headerHelpStyle: GoogleFonts.rubik(color: Colors.white),
      dayStyle: GoogleFonts.rubik(color: Colors.white),
      rangePickerHeaderHeadlineStyle: GoogleFonts.rubik(color: Colors.white),
      rangePickerHeaderHelpStyle: GoogleFonts.rubik(color: Colors.white),
      yearStyle: GoogleFonts.rubik(color: Colors.white),
      weekdayStyle: GoogleFonts.rubik(color: Colors.white),
      surfaceTintColor: Colors.white,
    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: Color(AppColors.kDarkThemColor),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
