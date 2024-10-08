part of theme;

abstract class AppColors {
  const AppColors();

  Color get primary;

  Color get accent;

  Color get mainText;

  Color get subText;
}

class LightColors implements AppColors {
  const LightColors();

  @override
  Color get primary => const Color(0xFFFFFFFF);

  @override
  Color get accent => const Color(0xFFC63031);

  @override
  Color get mainText => const Color(0xFF353535);

  @override
  Color get subText => const Color(0xFF929292);
}

class DarkColors extends LightColors {
  const DarkColors();

  @override
  Color get primary => const Color(0xFF131313);

  @override
  Color get accent => const Color(0xFFA12828);

  @override
  Color get mainText => const Color(0xFFFFFFFF);

  @override
  Color get subText => const Color(0xFF626161);
}
