part of theme;

abstract class AppColors {
  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    print(brightness);
    print('${Theme.of(context).brightness}');
    return brightness == Brightness.light
        ? const LightColors()
        : const DarkColors();
  }

  Color get primary;

  Color get accent;

  Color get shadowAccent;

  Color get mainText;

  Color get subText;

  Color get transparent;
}

class LightColors implements AppColors {
  const LightColors();

  @override
  Color get primary => const Color(0xFFFFFFFF);

  @override
  Color get accent => const Color(0xFFC63031);

  @override
  Color get shadowAccent => const Color(0x12C63031);

  @override
  Color get mainText => const Color(0xFF353535);

  @override
  Color get subText => const Color(0xFF929292);

  @override
  Color get transparent => const Color(0x00000000);
}

class DarkColors extends LightColors {
  const DarkColors();

  @override
  Color get primary => const Color(0xFF131313);

  @override
  Color get accent => const Color(0xFFA12828);

  @override
  Color get shadowAccent => const Color(0x12A12828);

  @override
  Color get mainText => const Color(0xFFFFFFFF);

  @override
  Color get subText => const Color(0xFF626161);

  @override
  Color get transparent => const Color(0x00000000);
}
