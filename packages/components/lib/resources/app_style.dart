part of components;

class AppStyle {
  static ThemeData lightTheme(BuildContext context) {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: AppColors.PRIMARY_COLOR,
      primaryColorLight: AppColors.PRIMARY_COLOR,
      primaryColorDark: AppColors.PRIMARY_COLOR,
      splashColor: AppColors.TRANSPARANT,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.BLACK_2,
            fontFamily: AppFont.FONT_STYLE,
          ),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.PRIMARY_COLOR,
          selectionHandleColor: AppColors.TRANSPARANT),
      appBarTheme: AppBarTheme(
        color: AppColors.WHITE, toolbarTextStyle: base.textTheme.copyWith(
          headline6: const TextStyle(
              fontSize: AppDimen.TEXT_H3,
              fontFamily: AppFont.FONT_STYLE,
              fontWeight: FontWeight.w500,
              color: AppColors.WHITE,
              height: 1.5),
        ).bodyText2, titleTextStyle: base.textTheme.copyWith(
          headline6: const TextStyle(
              fontSize: AppDimen.TEXT_H3,
              fontFamily: AppFont.FONT_STYLE,
              fontWeight: FontWeight.w500,
              color: AppColors.WHITE,
              height: 1.5),
        ).headline6,
      ),
      snackBarTheme: const SnackBarThemeData(
          contentTextStyle: TextStyle(
              color: AppColors.WHITE,
              fontWeight: FontWeight.w300,
              fontSize: AppDimen.TEXT_H5,
              fontFamily: AppFont.FONT_STYLE,
              letterSpacing: 0.8,
              height: 1.5)),
      dialogTheme: const DialogTheme(
        contentTextStyle: TextStyle(
            fontFamily: AppFont.FONT_STYLE, color: Colors.black, height: 1.5),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        border: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppColors.PRIMARY_COLOR, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintStyle: const TextStyle(
            color: AppColors.BLACK_2,
            fontSize: AppDimen.TEXT_H3,
            fontWeight: FontWeight.w300,
            fontFamily: AppFont.FONT_STYLE,
            letterSpacing: 0.8,
            height: 1.5),
        labelStyle: const TextStyle(
            color: AppColors.BLACK,
            fontWeight: FontWeight.bold,
            fontFamily: AppFont.FONT_STYLE,
            letterSpacing: 0.8,
            height: 1.5),
        errorStyle: const TextStyle(
            color: AppColors.WARNING_COLOR,
            fontWeight: FontWeight.w300,
            fontSize: AppDimen.TEXT_H6,
            fontFamily: AppFont.FONT_STYLE,
            height: 1.5),
      ),
      buttonTheme: const ButtonThemeData(), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.ACCENT_COLOR),
    );
  }
}
