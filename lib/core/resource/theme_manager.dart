import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';
import 'values_manager.dart';

abstract class MainThemeApp {
  ThemeData getThemeData({required String fontFamily});
}

class LightModeTheme implements MainThemeApp {
  @override
  ThemeData getThemeData({required String fontFamily}) {
    return ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      ),
      useMaterial3: true,
      primaryColor: ColorManager.colorPrimary,
      // cardColor: Palette.colorCardLight,
      scaffoldBackgroundColor: ColorManager.colorBackground,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.colorPrimary,
        selectionHandleColor: ColorManager.colorPrimary,
        selectionColor: ColorManager.colorPrimary.withValues(alpha: 0.2),
      ),
      disabledColor: ColorManager.colorDisable,
      splashColor: ColorManager.colorPrimary.withValues(alpha: 0.2),
      dialogBackgroundColor: ColorManager.colorBackground,

      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorManager.colorPrimary,
        primary: ColorManager.colorPrimary,
        secondary: ColorManager.colorPrimary,
        error: ColorManager.colorRed,
        brightness: Brightness.light,
      ),
      // Text color
      // primaryColorLight: Palette.colorFontPrimaryLight,
      // primaryColorDark: Palette.colorFontSecondaryLight,

      // hintColor: Palette.colorPlaceHolderLight,
      //
      // shadowColor: Palette.colorBackgroundDark,
      fontFamily: fontFamily,

      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ColorManager.colorPrimary,
        circularTrackColor: ColorManager.colorPrimary,
      ),

      // colorScheme: ColorScheme.fromSwatch(
      //   accentColor: ColorManager.colorPrimary, // but now it should be declared like this
      //   backgroundColor: ColorManager.colorBackground,
      //   primarySwatch: Colors.blue,
      //   errorColor: ColorManager.colorRed,
      // ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorManager.colorPrimary,
        foregroundColor: ColorManager.colorWhite1,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorManager.colorWhite1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.colorPrimary,
        unselectedItemColor: ColorManager.colorBlack2,
        selectedLabelStyle: StyleManager.getRegularStyle(
          fontSize: FontSize.s12,
          color: ColorManager.colorPrimary,
        ),
        unselectedLabelStyle: StyleManager.getRegularStyle(
          fontSize: FontSize.s12,
          color: ColorManager.colorBlack2,
        ),
        elevation: 10,
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: ColorManager.colorBackground,
        modalBackgroundColor: ColorManager.colorBackground,
        dragHandleColor: ColorManager.colorGrey1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSize.s16),
          ),
        ),
      ),

      chipTheme: const ChipThemeData(
        backgroundColor: ColorManager.colorGrey3,
        selectedColor: ColorManager.colorGrey3,
        checkmarkColor: ColorManager.colorPrimary,
        // surfaceTintColor: ColorManager.colorBlack1,
        // side: const BorderSide(color: ColorManager.colorGrey1),
        // labelStyle: TextStyle(color: Colors.black),
        // secondaryLabelStyle: TextStyle(color: Colors.blue),
        // padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(16),
        //   side: BorderSide(color: ColorManager.colorGrey1),
        // ),
      ),

      appBarTheme: AppBarTheme(
        centerTitle: true,
        // elevation: 0,
        backgroundColor: ColorManager.colorWhite1,
        iconTheme: const IconThemeData(
          color: ColorManager.colorPrimary,
          size: AppSize.s24,
        ),
        actionsIconTheme: const IconThemeData(
          color: ColorManager.colorBlack1,
          size: AppSize.s24,
        ),
        titleTextStyle: StyleManager.getSemiBoldStyle(
          color: ColorManager.colorBlack1,
          fontSize: FontSize.s20,
        ).copyWith(
          fontFamily: fontFamily,
        ),
      ),

      sliderTheme: const SliderThemeData(
        thumbColor: ColorManager.colorPrimary,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        activeTrackColor: ColorManager.colorPrimary,
        inactiveTrackColor: ColorManager.colorPrimary,
        trackHeight: AppSize.s5,
        overlayColor: ColorManager.colorPrimary,
        inactiveTickMarkColor: ColorManager.colorGrey1,
        disabledInactiveTickMarkColor: ColorManager.colorGrey1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          elevation: 0,
          backgroundColor: ColorManager.colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 0,
          foregroundColor: ColorManager.colorGrey1,
        ),
      ),

      // tab bar theme
      tabBarTheme: TabBarThemeData(
        labelColor: ColorManager.colorPrimary,
        unselectedLabelColor: ColorManager.colorGrey1,
        labelStyle: StyleManager.getSemiBoldStyle(
          color: ColorManager.colorPrimary,
        ).copyWith(
          fontFamily: fontFamily,
        ),
        unselectedLabelStyle: StyleManager.getSemiBoldStyle(
          color: ColorManager.colorGrey1,
        ).copyWith(
          fontFamily: fontFamily,
        ),
        indicatorColor: ColorManager.colorPrimary,
        dividerColor: ColorManager.colorGrey1,
      ),

      // scrollbarTheme: ScrollbarThemeData(
      //   thumbColor: WidgetStateProperty.all(Colors.red), // Scrollbar color
      //   trackColor: WidgetStateProperty.all(Colors.grey.shade300), // Track color
      //   thickness: WidgetStateProperty.all(8), // Scrollbar thickness
      // ),

      buttonTheme: const ButtonThemeData(
        buttonColor: ColorManager.colorPrimary,
      ),

      // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorManager.colorWhite2,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
          vertical: AppPadding.p16,
        ),

        // hint style
        hintStyle: StyleManager.getRegularStyle(
          color: ColorManager.colorGrey4,
        ),

        // error style
        errorStyle: StyleManager.getRegularStyle(
          color: ColorManager.colorRed,
          fontSize: FontSize.s12,
        ),

        // helper style
        helperStyle: StyleManager.getRegularStyle(
          color: ColorManager.colorRed,
          fontSize: FontSize.s12,
        ),

        // enabled border style
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.colorWhite2, width: AppSize.s1),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),

        // disable border style
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.colorWhite2, width: AppSize.s1),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),

        // focused border style
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.colorWhite2, width: AppSize.s1),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),

        // error border style
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.colorWhite2, width: AppSize.s1),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
        // focused border style
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.colorWhite2, width: AppSize.s1),
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
        ),
      ),
    );
  }
}
