import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const _primary = Color(0xFF1A1A2E);
  static const _accent = Color(0xFFE94560);
  static const _surface = Color(0xFFF8F7F4);
  static const _surfaceDark = Color(0xFF16213E);

  static const _textThemeLight = TextTheme(
    displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w800, letterSpacing: -2, color: _primary),
    displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w700, letterSpacing: -1.5, color: _primary),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, letterSpacing: -1, color: _primary),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, letterSpacing: -0.5, color: _primary),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: -0.3, color: _primary),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0, color: _primary),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFF444455)),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF666677)),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: _accent),
  );

  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: _primary,
      secondary: _accent,
      surface: _surface,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: _primary,
    ),
    scaffoldBackgroundColor: _surface,
    textTheme: _textThemeLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, letterSpacing: -1, color: _primary),
      iconTheme: IconThemeData(color: _primary),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
    ),
    dividerTheme: const DividerThemeData(color: Color(0xFFE8E8EC), thickness: 1),
    extensions: [AppColors.light],
  );

  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      secondary: _accent,
      surface: _surfaceDark,
      onPrimary: _primary,
      onSecondary: Colors.white,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: _primary,
    textTheme: _textThemeLight.apply(
      bodyColor: const Color(0xFFCCCCDD),
      displayColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, letterSpacing: -1, color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: _surfaceDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
    ),
    dividerTheme: const DividerThemeData(color: Color(0xFF2A2A3E), thickness: 1),
    extensions: [AppColors.dark],
  );
}

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.accent,
    required this.cardBackground,
    required this.tagBackground,
    required this.tagText,
    required this.shimmer,
    required this.divider,
  });

  final Color accent;
  final Color cardBackground;
  final Color tagBackground;
  final Color tagText;
  final Color shimmer;
  final Color divider;

  static const light = AppColors(
    accent: Color(0xFFE94560),
    cardBackground: Colors.white,
    tagBackground: Color(0xFFF0EFFE),
    tagText: Color(0xFF5B4FCF),
    shimmer: Color(0xFFEEEEF2),
    divider: Color(0xFFE8E8EC),
  );

  static const dark = AppColors(
    accent: Color(0xFFE94560),
    cardBackground: Color(0xFF16213E),
    tagBackground: Color(0xFF1E1E3A),
    tagText: Color(0xFF9D93F0),
    shimmer: Color(0xFF1E1E3A),
    divider: Color(0xFF2A2A3E),
  );

  @override
  AppColors copyWith({Color? accent, Color? cardBackground, Color? tagBackground, Color? tagText, Color? shimmer, Color? divider}) {
    return AppColors(
      accent: accent ?? this.accent,
      cardBackground: cardBackground ?? this.cardBackground,
      tagBackground: tagBackground ?? this.tagBackground,
      tagText: tagText ?? this.tagText,
      shimmer: shimmer ?? this.shimmer,
      divider: divider ?? this.divider,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      accent: Color.lerp(accent, other.accent, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      tagBackground: Color.lerp(tagBackground, other.tagBackground, t)!,
      tagText: Color.lerp(tagText, other.tagText, t)!,
      shimmer: Color.lerp(shimmer, other.shimmer, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
    );
  }
}
