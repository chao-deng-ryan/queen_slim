import 'package:queen_slim/enums/index.dart';
import 'package:flutter/material.dart';

MaterialColor createMaterialColor(Color color) {
  final List<double> strengths = [.05];
  final Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final double strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}

class QueenLayout {
  QueenLayout({
    this.padding = 16.0,
    this.borderRadius = 8.0,
    this.borderWidth = 1.0,
    this.titleBaseline = 14.0,
    this.subTitleBaseline = 16.0,
    this.iconSize = 18.0,
    this.margin = 16.0,
    this.spacing = 8.0,
    this.wrapSpacing = 4.0,
    this.wrapRunSpacing = 4.0,
    this.qrImageSize = 300.0,
    this.fontSize = 14.0,
    this.inputNumberHeight = 28.0,
    this.inputNumberIconSize = 18.0,
    this.inputNumberIconWidth = 28.0,
    this.inputNumberValueWidth = 56.0,
    this.inputNumberValueSize = 18.0,
    this.bottomHeight = 50.0,
    this.toastElevation = 10.0,
    this.toastHorizontalPosition = 36.0,
    this.toastVerticalPosition = 12.0,
    this.buttonTextSize = 18.0,
    this.baseColorOpacity = 0.1,
    this.titleFontSize = 18.0,
    this.subTitleFontSize = 14.0,
    this.bottomValueFontSize = 24.0,
    this.bottomValueUnitFontSize = 12.0,
  });
  double padding;
  double borderRadius;
  double borderWidth;
  double titleBaseline;
  double subTitleBaseline;
  double iconSize;
  double margin;
  double spacing;
  double wrapSpacing;
  double wrapRunSpacing;
  double qrImageSize;
  double fontSize;
  double inputNumberHeight;
  double inputNumberIconSize;
  double inputNumberIconWidth;
  double inputNumberValueWidth;
  double inputNumberValueSize;
  double bottomHeight;
  double toastElevation;
  double toastHorizontalPosition;
  double toastVerticalPosition;
  double buttonTextSize;
  double baseColorOpacity;
  double titleFontSize;
  double subTitleFontSize;
  double bottomValueFontSize;
  double bottomValueUnitFontSize;
}

class QueenStyle {
  QueenStyle({
    this.textStyle = const TextStyle(
      color: Color(0xFF424242),
    ),
  });
  TextStyle textStyle;
}

class QueenColor {
  QueenColor({
    this.environment = const {
      Environment.development: Color(0xFFe74c3c),
      Environment.test: Color(0xFF2ba245),
      Environment.prepub: Color(0xFF2782d7),
      Environment.release: Color(0xFFFFFFFF),
    },
    this.primary = const Color(0xFF3D70F6),
    this.disabledPrimary = const Color(0x553D70F6),
    this.border = const Color(0xFFBDBDBD),
    this.text = const Color(0xFF424242),
    this.buttonText = Colors.black,
    this.tableName = const Color(0xFF424242),
    this.orderCancelled = const Color(0xFFFF4d4F),
    this.orderClosed = const Color(0xFF2ba245),
    this.title = const Color(0xFF424242),
  });

  Map<Environment, Color> environment;

  Color primary;
  Color disabledPrimary;
  Color border;
  Color text;
  Color buttonText;
  Color orderCancelled;
  Color orderClosed;
  Color title;

  Color tableName;

  Color borderColor = Colors.grey;
  Color backgroundColor = const Color(0xFFFFFFFF);
  Color shadowColor = Colors.black38;
  Color baseColor = const Color(0xFFF0F0F0);
  Color descriptionColor = const Color(0xBF424242);
  Color subTitle = const Color(0xFF999999);
  Color priceColor = const Color(0xFFFF4949);
  Color quantityColor = const Color(0xFF000000);
  Color dividerColor = const Color(0xFFDFDFDF);
  Color placeholderColor = const Color(0xFFC9C9C9);
  Color loginBackgroundColor = const Color(0xFFBBDEFB);

  Color bottomText = const Color(0xFF424242);
  Color bottomUnit = const Color(0xFF999999);
}

class QueenTheme {
  QueenTheme({required this.color, required this.layout, required this.style});
  QueenColor color;
  QueenStyle style;
  QueenLayout layout;
}

extension QueenThemeData on ThemeData {
  static final Map<InputDecorationTheme, QueenTheme> _expended = {};
  void extend(QueenTheme queenTheme) {
    _expended[inputDecorationTheme] = queenTheme;
  }

  QueenTheme queen() {
    final QueenTheme queenTheme = _expended[inputDecorationTheme] ?? QueenTheme(color: QueenColor(), layout: QueenLayout(), style: QueenStyle());
    return queenTheme;
  }
}
