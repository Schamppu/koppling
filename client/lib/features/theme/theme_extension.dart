import 'package:flutter/material.dart';

KopplingTheme get ktheme => KopplingTheme(
  fonts: KopplingFonts(),
  colors: KopplingColors(),
  shadows: KopplingShadows(),
);

extension KopplingThemeExtension on ThemeData {
  KopplingTheme get theme =>
      extension<KopplingTheme>() ??
      KopplingTheme(
        fonts: KopplingFonts(),
        colors: KopplingColors(),
        shadows: KopplingShadows(),
      );
}

class KopplingFonts {
  KopplingFonts();
  final titleFont = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: KopplingColors().title,
    letterSpacing: 6,
  );
  final primary = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: KopplingColors().primary,
  );
  final primaryOnPrimary = TextStyle(
    fontSize: 16,
    color: KopplingColors().onPrimary,
  );
  final onError = TextStyle(fontSize: 16, color: KopplingColors().onError);
  final highlightItalic = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.italic,
    color: KopplingColors().highlight,
    fontWeight: FontWeight.bold,
  );
}

class KopplingColors {
  KopplingColors();
  final title = const Color.fromARGB(255, 204, 0, 223);
  final primary = const Color.fromARGB(255, 160, 16, 226);
  final highlight = const Color.fromARGB(255, 235, 54, 190);
  final onPrimary = Colors.white;
  final secondary = const Color.fromARGB(255, 255, 242, 67);
  final background = const Color.fromARGB(255, 250, 214, 255);
  final cardBackground = const Color.fromARGB(255, 221, 178, 219);
  final fieldBackground = const Color.fromARGB(255, 246, 210, 255);
  final buttonBackground = const Color.fromARGB(255, 217, 94, 255);
  final onButton = Colors.white;
  final error = const Color.fromARGB(255, 177, 54, 54);
  final onError = Colors.white;
  final lightError = const Color.fromARGB(255, 255, 164, 164);
}

class KopplingShadows {
  KopplingShadows();
  final defaultShadow = BoxShadow(
    color: Colors.black.withValues(alpha: 0.1),
    blurRadius: 10,
    offset: const Offset(0, 0),
  );
}

class KopplingTheme extends ThemeExtension<KopplingTheme> {
  KopplingTheme({
    required this.fonts,
    required this.colors,
    required this.shadows,
  });

  final KopplingFonts fonts;
  final KopplingColors colors;
  final KopplingShadows shadows;

  @override
  ThemeExtension<KopplingTheme> copyWith({
    KopplingFonts? fonts,
    KopplingColors? colors,
    KopplingShadows? shadows,
  }) {
    return KopplingTheme(
      fonts: fonts ?? this.fonts,
      colors: colors ?? this.colors,
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  ThemeExtension<KopplingTheme> lerp(
    ThemeExtension<KopplingTheme>? other,
    double t,
  ) {
    if (other is! KopplingTheme) {
      return this;
    }
    return KopplingTheme(fonts: fonts, colors: colors, shadows: shadows);
  }
}

extension ThemeGetter on BuildContext {
  KopplingTheme get theme => Theme.of(this).theme;
}
