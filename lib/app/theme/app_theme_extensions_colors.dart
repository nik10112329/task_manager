part of 'app_theme_extensions.dart';

/// First add the colors here, after add to [Colors]
class _AppColors {
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xffffffff);
  static const Color whiteGrey = Color(0xffebeaf1);
  static const Color whiteGreyLight = Color(0xFFFDFCFF);
  // static const Color blue = Color(0xFF0E4FEE);
  static const Color darkBlue = Color(0xFF002349);
  static const Color primaryBlue = Color(0xFF3D93F8);
  static const Color primaryBlue2 = Color(0xFF4474C0);
  static const Color lightWhite = Color(0xFFF2F5FF);
  static const Color grey = Color(0xFFD8DEF3);
  static const Color greyBlue = Color(0xFF2E3A59);
  static const Color blackBlue = Color(0xFF242736);
  static const Color lightGrey = Color(0xFFE5EAFC);
  static const Color vinous = Color(0xFFBE517E);
  static const Color darkGreen = Color(0xFF34C759);
  static const Color primary = Color(0xFF977BFF);
  static const Color primary2 = Color(0xFF464BD8);
  static const Gradient violetBlueGradient = LinearGradient(
    colors: [Color(0xFF9C2CF3), Color(0xFF3A49F9)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Gradient violetBlueGradient2 = LinearGradient(
    colors: [primary, primary2],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static final BoxShadow shadow = BoxShadow(
    color: blackBlue.withValues(alpha: 0.3),
    blurRadius: 8,
    offset: const Offset(0, -3),
  );
  static final BoxShadow whiteShadow = BoxShadow(
    color: lightGrey.withValues(alpha: 0.3),
    blurRadius: 8,
    offset: const Offset(0, -3),
  );
}
