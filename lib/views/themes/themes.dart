import 'package:flutter/material.dart';
import '../../consts/app_colors.dart';
import '../../consts/app_defaults.dart';
import '../../consts/app_sizes.dart';
import '../../utils/ui_helper.dart';
import 'text.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  /* <-----------------------> 
      Light Theme    
   <-----------------------> */
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.PRIMARY_COLOR,
    brightness: Brightness.light,
    textTheme: GoogleFonts.poppinsTextTheme(),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: AppColors.DARK_COLOR,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.DARK_COLOR,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: AppColors.DARK_COLOR),
      toolbarTextStyle: AppText.b1,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: AppDefaults.defaulBorderRadius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppDefaults.defaulBorderRadius,
        borderSide: BorderSide(
          color: AppColors.PLACEHOLDER_COLOR,
        ),
      ),
      fillColor: AppColors.PLACEHOLDER_COLOR.withOpacity(0.2),
      filled: true,
    ),
    iconTheme: IconThemeData(
      color: AppColors.PRIMARY_COLOR,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(AppSizes.DEFAULT_PADDING),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(AppSizes.DEFAULT_PADDING),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch:
                AppUiHelper.generateMaterialColor(AppColors.PRIMARY_COLOR))
        .copyWith(secondary: AppColors.ACCENT_COLOR),
  );

  /* <-----------------------> 
      Dark Themes For this app    
   <-----------------------> */

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.PRIMARY_COLOR,
    scaffoldBackgroundColor: AppColors.DARK_COLOR,
    brightness: Brightness.dark,
    cardColor: AppColors.DARK_COLOR.withOpacity(0.7),
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: AppColors.PRIMARY_COLOR,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      backgroundColor: AppColors.DARK_COLOR,
      iconTheme: IconThemeData(color: AppColors.PRIMARY_COLOR),
      toolbarTextStyle: AppText.b1,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: AppDefault.defaulBorderRadius,
        //   borderSide: BorderSide(
        //     color: AppColors.PLACEHOLDER_COLOR,
        //   ),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: AppDefault.defaulBorderRadius,
        //   borderSide: BorderSide(
        //     color: AppColors.ACCENT_COLOR,
        //   ),
        // ),
        ),
    iconTheme: IconThemeData(
      color: AppColors.PRIMARY_COLOR,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(AppSizes.DEFAULT_PADDING),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(AppSizes.DEFAULT_PADDING),
        side: BorderSide(
          color: AppColors.PRIMARY_COLOR,
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch:
                AppUiHelper.generateMaterialColor(AppColors.PRIMARY_COLOR))
        .copyWith(secondary: AppColors.ACCENT_COLOR),
  );
}
