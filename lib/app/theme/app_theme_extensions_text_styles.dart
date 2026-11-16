part of 'app_theme_extensions.dart';

/// First add the styles here, after add to [Styles]
class _TextStyles {
  _TextStyles._();

  static _TextStyles? _instance;

  static final _TextStyles instance = _instance ??= _TextStyles._();

  /// Download font archive from fonts.google.com
  /// and put ttf files to google_fonts folder before
  final h1Style = GoogleFonts.poppins().copyWith(
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );
  final textStyle = GoogleFonts.roboto().copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
