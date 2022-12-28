import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
  primaryColor: OleSchoolNewTheme.themeColor.primaryColor,
  // primaryColorBrightness: Brightness.light,
  primaryColorLight: OleSchoolNewTheme.themeColor.primaryColorLight,
  primaryColorDark: OleSchoolNewTheme.themeColor.primaryColorDark,
  canvasColor: Colors.white,
  // scaffoldBackgroundColor: Color.fromRGBO(240, 250, 245, 0.6),
  scaffoldBackgroundColor: Colors.white,

  bottomAppBarColor: Color(0xffDFF0F4),
  cardColor: Color.fromRGBO(127, 196, 253, 1),
  dividerColor: Color(0x1f6D42CE),
  focusColor: Color(0x1aF5E0C3),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: OleSchoolNewTheme.themeColor.accentColor),
  textTheme: TextTheme().copyWith(
    headline1: TextStyle(color: Colors.black),
    headline2: TextStyle(color: Colors.black),
    headline3: TextStyle(color: Colors.black),
    headline4: TextStyle(color: Colors.black),
    headline5: TextStyle(color: Colors.black),
    headline6: TextStyle(color: Colors.black),
    subtitle1: TextStyle(color: Colors.black),
    subtitle2: TextStyle(color: Colors.black),
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
    overline: TextStyle(color: Colors.black),
    button: TextStyle(color: Colors.black),
    caption: TextStyle(color: Colors.black),
  ),
  fontFamily: GoogleFonts.varelaRound().fontFamily,
  buttonTheme: ButtonThemeData().copyWith(
    buttonColor: OleSchoolNewTheme.themeColor.primaryColorDark,
    textTheme: ButtonTextTheme.primary,
  ),
);

// ThemeData darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
//     primarySwatch: MaterialColor(
//       0xFFF5E0C3,
//       <int, Color>{
//         50: Color(0x1a5D4524),
//         100: Color(0xa15D4524),
//         200: Color(0xaa5D4524),
//         300: Color(0xaf5D4524),
//         400: Color(0x1a483112),
//         500: Color(0xa1483112),
//         600: Color(0xaa483112),
//         700: Color(0xff483112),
//         800: Color(0xaf2F1E06),
//         900: Color(0xff2F1E06)
//       },
//     ),
//     primaryColor: Color(0xff5D4524),
//     primaryColorBrightness: Brightness.dark,
//     primaryColorLight: Color(0x1a311F06),
//     primaryColorDark: Color(0xff936F3E),
//     canvasColor: Color(0xffE09E45),
//     accentColor: Color(0xff457BE0),
//     accentColorBrightness: Brightness.dark,
//     scaffoldBackgroundColor: Color(0xffB5BFD3),
//     bottomAppBarColor: Color(0xff6D42CE),
//     cardColor: Color(0xaa311F06),
//     dividerColor: Color(0x1f6D42CE),
//     focusColor: Color(0x1a311F06));

const Color gradientPurple = Color.fromRGBO(83, 57, 214, 1);
const Color gradientPink = Color.fromRGBO(153, 38, 171, 1);
const Color gradientBrightMagenta = Color.fromRGBO(255, 2, 97, 1);
const Color gradientBrightPeach = Color.fromRGBO(254, 175, 143, 1);
const Color gradientViolet = Color.fromRGBO(113, 34, 237, 1);
const Color gradientPurpleLight = Color.fromRGBO(154, 80, 211, 1);

const Color purpleColor = Color.fromRGBO(191, 90, 242, 1);
const Color greenColor = Color.fromRGBO(52, 199, 89, 1);
const Color redColorDark = Color.fromRGBO(176, 0, 32, 1);
const Color redColor = Color.fromRGBO(255, 85, 10, 1);
const Color yellowColor = Color.fromRGBO(255, 245, 0, 1);
const Color iceBlue = Color.fromRGBO(241, 249, 255, 1);
const Color cyanColor = Color.fromRGBO(3, 218, 198, 1);



///NEW THEME
class OleSchoolNewTheme {
  static _NewThemeColor themeColor = _NewThemeColor(
    lightYellow: Color(0xffFCEDC3),
    highLightColor: Color(0xffEDB5A7),
    fieldColor: Color(0xffE0F1F4),
    accentColor: Color(0xffFA6F4C),
    backgroundColorDark: Colors.white,
    backgroundColorLight: Colors.white,
    primaryColor: Color(0xff36AFBF),
    primaryColorDark: Color(0xff1B4A68),
    primaryColorLight: Color(0xffC2DADD),
    textColorLight: Color(0xffC2DADD),
    buttonColor: Color(0xffFBBA1E),
    cardColor: Color(0xffFEF6F3),
    greyShade: Color(0xff7F97A6),
    pinkShade: Color(0xffEDB5A7),
    yellowShade: Color(0xffF3CC6E),
    lightGreenShade: Color(0xffDFECED),
  );
}



class _NewThemeColor {
  final Color primaryColor;
  final Color primaryColorDark;
  final Color primaryColorLight;
  final Color backgroundColorDark;
  final Color backgroundColorLight;
  final Color textColorLight;
  final Color accentColor;
  final Color lightYellow;
  final Color buttonColor;
  final Color cardColor;
  final Color greyShade;
  final Color highLightColor;
  final Color fieldColor;
  final Color pinkShade;
  final Color yellowShade;
  final Color lightGreenShade;

  const _NewThemeColor({
    required this.primaryColor,
    required this.accentColor,
    required this.lightYellow,
    required this.backgroundColorDark,
    required this.backgroundColorLight,
    required this.primaryColorDark,
    required this.primaryColorLight,
    required this.textColorLight,
    required this.buttonColor,
    required this.greyShade,
    required this.cardColor,
    required this.highLightColor,
    required this.fieldColor,
    required this.pinkShade,
    required this.yellowShade,
    required this.lightGreenShade,
  });
}
