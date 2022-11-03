// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color white;
  late Color iconGray;
  late Color grayDark;
  late Color darkBG;
  late Color background;
  late Color grayLines;
  late Color prussianBlue;
  late Color selectiveYellow;
  late Color tangerine;
  late Color primaryBtnText;
  late Color lineColor;
  late Color btnText;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF023047);
  late Color secondaryColor = const Color(0xFFFFB703);
  late Color tertiaryColor = const Color(0xFF8ECAE6);
  late Color alternate = const Color(0xFFB8E6E0);
  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF0F1113);
  late Color secondaryText = const Color(0xFF57636C);

  late Color white = Color(0xFFFFFFFF);
  late Color iconGray = Color(0xFF8B97A2);
  late Color grayDark = Color(0xFF57636C);
  late Color darkBG = Color(0xFF111417);
  late Color background = Color(0xFFF1F4F8);
  late Color grayLines = Color(0xFFDBE2E7);
  late Color prussianBlue = Color(0xFF023047);
  late Color selectiveYellow = Color(0xFFFFB703);
  late Color tangerine = Color(0xFFFB8500);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFE0E3E7);
  late Color btnText = Color(0xFFFFFFFF);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Overpass';
  TextStyle get title1 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      );
  String get title2Family => 'Overpass';
  TextStyle get title2 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );
  String get title3Family => 'Overpass';
  TextStyle get title3 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  String get subtitle1Family => 'Overpass';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  String get subtitle2Family => 'Overpass';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Overpass';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get bodyText2Family => 'Overpass';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Overpass';
  TextStyle get title1 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      );
  String get title2Family => 'Overpass';
  TextStyle get title2 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );
  String get title3Family => 'Overpass';
  TextStyle get title3 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  String get subtitle1Family => 'Overpass';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  String get subtitle2Family => 'Overpass';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Overpass';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get bodyText2Family => 'Overpass';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Overpass';
  TextStyle get title1 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      );
  String get title2Family => 'Overpass';
  TextStyle get title2 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );
  String get title3Family => 'Overpass';
  TextStyle get title3 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  String get subtitle1Family => 'Overpass';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  String get subtitle2Family => 'Overpass';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Overpass';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get bodyText2Family => 'Overpass';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
