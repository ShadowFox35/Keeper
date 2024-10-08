part of theme;

const LightColors _lightColors = LightColors();
const DarkColors _darkColors = DarkColors();

final ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: _getAppBarTheme(_lightColors),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: _lightColors.primary,
    selectedItemColor: _lightColors.accent,
    unselectedItemColor: _lightColors.mainText,
    selectedLabelStyle: TextStyle(color: _lightColors.accent),
    unselectedLabelStyle: TextStyle(color: _lightColors.mainText),
  ),
  scaffoldBackgroundColor: _lightColors.primary,
  textTheme: _getTextTheme(_lightColors),
  primaryColor: _lightColors.accent,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: _lightColors.accent,
    primary: _lightColors.primary,
  ),
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  appBarTheme: _getAppBarTheme(_darkColors),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: _darkColors.primary,
    selectedItemColor: _darkColors.accent,
    unselectedItemColor: _darkColors.mainText,
    selectedLabelStyle: TextStyle(color: _darkColors.accent),
    unselectedLabelStyle: TextStyle(color: _darkColors.mainText),
  ),
  scaffoldBackgroundColor: _darkColors.primary,
  textTheme: _getTextTheme(_darkColors),
  primaryColor: _darkColors.accent,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: _darkColors.accent,
    primary: _darkColors.primary,
  ),
);

AppBarTheme _getAppBarTheme(AppColors colorScheme) {
  return AppBarTheme(
    backgroundColor: colorScheme.primary,
    titleTextStyle: AppFonts.montserratBold14.copyWith(
      color: colorScheme.mainText,
    ),
  );
}

TextTheme _getTextTheme(AppColors colorScheme) {
  return const TextTheme(
    titleMedium: AppFonts.montserratBold14,
    bodyMedium: AppFonts.montserratNormal14,
  ).apply(
    bodyColor: colorScheme.mainText,
    displayColor: colorScheme.mainText,
  );
}
