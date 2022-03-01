import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MetCatTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      // color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 44.0,
      fontWeight: FontWeight.w200,
      //   color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.w300,
      //  color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 24.0,
      fontWeight: FontWeight.normal,
      //  color: Colors.black,
    ),
    headline4: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      //  color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      // color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 44.0,
      fontWeight: FontWeight.w200,
      //   color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.w300,
      //  color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 24.0,
      fontWeight: FontWeight.normal,
      //  color: Colors.black,
    ),
    headline4: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      //  color: Colors.black,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      //    primaryColor: linzPrimary,
      colorScheme: _linzColorScheme,
      // checkboxTheme: CheckboxThemeData(
      //   fillColor: MaterialStateColor.resolveWith(
      //     (states) {
      //       return Colors.black;
      //     },
      //   ),
      // ),
      // appBarTheme: const AppBarTheme(
      //   foregroundColor: Colors.white,
      //   //      backgroundColor: linz_primary,
      // ),
      // floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //   foregroundColor: Colors.white,
      //   backgroundColor: Colors.black,
      // ),
      // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //   selectedItemColor: Colors.green,
      // ),
      textTheme: lightTextTheme,
      // scaffoldBackgroundColor: Colors.red,
    );
  }

  static const ColorScheme _linzColorScheme = ColorScheme(
    /// A color that typically appears behind scrollable content.
    background: Color(0xFFFFFFFF),

    /// The overall brightness of this color scheme.
    brightness: Brightness.light,

    /// The color to use for input validation errors, e.g. for InputDecoration.errorText.
    error: Color(0xFFCC0000),

    /// A color used for error elements needing less emphasis than error.
    errorContainer: Color(0xFFF5CCCC),

    /// An accent color used for displaying a highlight color on inverseSurface backgrounds, like button text in a SnackBar.
    inversePrimary: Color(0xFF3A7CDF),

    /// A surface color used for displaying the reverse of what’s seen in the surrounding UI, for example in a SnackBar to bring attention to an alert.
    inverseSurface: Color(0xFF08814D),

    /// A color that's clearly legible when drawn on background. [...]
    onBackground: Color(0xFF2A292C),

    /// A color that's clearly legible when drawn on error. [...]
    onError: Color(0xFFFFFFFF),

    /// A color that's clearly legible when drawn on errorContainer. [...]
    onErrorContainer: Color(0xFFCC0000),

    /// A color that's clearly legible when drawn on inverseSurface. [...]
    onInverseSurface: Color(0xFFE9FAE7),

    /// A color that's clearly legible when drawn on primary. [...]
    onPrimary: Color(0xFFFFFFFF),

    /// A color that's clearly legible when drawn on primaryContainer. [...]
    onPrimaryContainer: Color(0xFFFFFFFF),

    /// A color that's clearly legible when drawn on secondary. [...]
    onSecondary: Color(0xFFFFFFFF),

    /// A color that's clearly legible when drawn on secondaryContainer. [...]
    onSecondaryContainer: Color(0xFF2A292C),

    /// A color that's clearly legible when drawn on surface. [...]
    onSurface: Color(0xFF00425D),

    /// A color that's clearly legible when drawn on surfaceVariant. [...]
    onSurfaceVariant: Color(0xFF004B50),

    /// A color that's clearly legible when drawn on tertiary. [...]
    onTertiary: Color(0xFFE9FAE7),

    /// A color that's clearly legible when drawn on tertiaryContainer. [...]
    onTertiaryContainer: Color(0xFF004E32),

    /// A utility color that creates boundaries and emphasis to improve usability.
    outline: Color(0xFF1F69C3),

    /// The color displayed most frequently across your app’s screens and components.
    primary: Color(0xFF00425D),

    /// A color used for elements needing less emphasis than primary.
    primaryContainer: Color(0xFF007198),

    /// An accent color used for less prominent components in the UI, such as filter chips, while expanding the opportunity for color expression.
    secondary: Color(0xFF004B50),

    /// A color used for elements needing less emphasis than secondary.
    secondaryContainer: Color(0xFF00A599),

    /// A color use to paint the drop shadows of elevated components.
    shadow: Color(0xFF6B6966),

    /// The background color for widgets like Card.
    surface: Color(0xFFF0F0F0), // Color(0xFFE2F3F7),

    /// A color variant of surface that can be used for differentiation against a component using surface.
    surfaceVariant: Color(0xFFE0E0E0), // Color(0xFF73CDC8),

    /// A color used as a contrasting accent that can balance primary and secondary colors or bring heightened attention to an element, such as an input field.
    tertiary: Color(0xFF08814D),

    /// A color used for elements needing less emphasis than tertiary.
    tertiaryContainer: Color(0xFF9BD79B),
  );

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme:
          const ColorScheme.dark().copyWith(primary: const Color(0xFF0096CC)),

      // appBarTheme: AppBarTheme(
      //   foregroundColor: Colors.white,
      //   backgroundColor: Colors.grey[900],
      // ),
      // floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //   foregroundColor: Colors.white,
      //   backgroundColor: Colors.green,
      // ),
      // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //   selectedItemColor: Colors.green,
      // ),
      textTheme: darkTextTheme,
    );
  }
}
/*
// ColorScheme Template
  static final ColorScheme _linzColorScheme = ColorScheme(

/// A color that typically appears behind scrollable content.
background: Color(0xFF);

/// The overall brightness of this color scheme.
brightness: Color(0xFF);

/// The color to use for input validation errors, e.g. for InputDecoration.errorText.
error: Color(0xFF);

/// A color used for error elements needing less emphasis than error.
errorContainer: Color(0xFF);

///The hash code for this object. [...]
hashCode: Color(0xFF);

/// An accent color used for displaying a highlight color on inverseSurface backgrounds, like button text in /// A SnackBar.
inversePrimary: Color(0xFF);

/// A surface color used for displaying the reverse of what’s seen in the surrounding UI, for example in a SnackBar to bring attention to an alert.
inverseSurface: Color(0xFF);

/// A color that's clearly legible when drawn on background. [...]
onBackground: Color(0xFF);

/// A color that's clearly legible when drawn on error. [...]
onError: Color(0xFF);

/// A color that's clearly legible when drawn on errorContainer. [...]
onErrorContainer: Color(0xFF);

/// A color that's clearly legible when drawn on inverseSurface. [...]
onInverseSurface: Color(0xFF);

/// A color that's clearly legible when drawn on primary. [...]
onPrimary: Color(0xFF);

/// A color that's clearly legible when drawn on primaryContainer. [...]
onPrimaryContainer: Color(0xFF);

/// A color that's clearly legible when drawn on secondary. [...]
onSecondary: Color(0xFF);

/// A color that's clearly legible when drawn on secondaryContainer. [...]
onSecondaryContainer: Color(0xFF);

/// A color that's clearly legible when drawn on surface. [...]
onSurface: Color(0xFF);

/// A color that's clearly legible when drawn on surfaceVariant. [...]
onSurfaceVariant: Color(0xFF);

/// A color that's clearly legible when drawn on tertiary. [...]
onTertiary: Color(0xFF);

/// A color that's clearly legible when drawn on tertiaryContainer. [...]
onTertiaryContainer: Color(0xFF);

/// A utility color that creates boundaries and emphasis to improve usability.
outline: Color(0xFF);

/// The color displayed most frequently across your app’s screens and components.
primary: Color(0xFF);

/// A color used for elements needing less emphasis than primary.
primaryContainer: Color(0xFF);

/// An accent color used for less prominent components in the UI, such as filter chips, while expanding the opportunity for color expression.
secondary: Color(0xFF);

/// A color used for elements needing less emphasis than secondary.
secondaryContainer: Color(0xFF);

/// A color use to paint the drop shadows of elevated components.
shadow: Color(0xFF);

/// The background color for widgets like Card.
surface: Color(0xFF);

/// A color variant of surface that can be used for differentiation against /// A component using surface.
surfaceVariant: Color(0xFF);

/// A color used as a contrasting accent that can balance primary and secondary colors or bring heightened attention to an element, such as an input field.
tertiary: Color(0xFF);

/// A color used for elements needing less emphasis than tertiary.
tertiaryContainer: Color(0xFF);
  
  );

  */
