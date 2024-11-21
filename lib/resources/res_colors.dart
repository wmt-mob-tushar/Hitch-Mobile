import 'package:flutter/material.dart';

class ResColors {
  // Primary Colors
  static const Color primary = Color(0xFFE4344D);  // Red primary color from logo
  static const Color secondary = Color(0xFF1A1A1A); // Dark color for text/backgrounds

  // Base Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // Background Colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color cardBackground = Color(0xFFF5F5F5);
  static const Color modalBackground = Color(0xFFFFFFFF);
  static const Color searchBackground = Color(0xFFF5F5F5);
  static const Color lightGray = Color(0xFFF8F8F8);
  static const Color bankItemBackground = Color(0xFFF5F5F5);
  static const Color profileItemBackground = Color(0xFFF5F5F5);
  static const Color profileIconBackground = Color(0xFFEEEEEE);
  static const Color tabBackground = Color(0xFFF0F0F0);
  static const Color selectedTabBackground = Color(0xFFFFFFFF);
  static const Color walletBackground = Color(0xFFFAFAFA);
  static const Color mediaControlBackground = Color(0xFFFFFFFF);
  static const Color modalSheetBackground = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color verifiedText = Color(0xFF4CAF50);
  static const Color onlineText = Color(0xFF4CAF50);
  static const Color offlineText = Color(0xFFE53935);

  // Icon Colors
  static const Color iconGray = Color(0xFF8E8E8E);
  static const Color iconLight = Color(0xFFD3D3D3);
  static const Color mediaControlIcon = Color(0xFF1A1A1A);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFA000);
  static const Color info = Color(0xFF2196F3);

  // Online/Offline Status
  static const Color online = Color(0xFF4CAF50);
  static const Color offline = Color(0xFFE53935);

  // Input Fields
  static const Color inputBackground = Color(0xFFF5F5F5);
  static const Color inputBorder = Color(0xFFE0E0E0);
  static const Color inputFocused = Color(0xFFE4344D);

  // Form Fields
  static const Color formFieldBorder = Color(0xFFE0E0E0);
  static const Color formFieldFocused = Color(0xFFE4344D);
  static const Color formFieldError = Color(0xFFE53935);

  // Button Colors
  static const Color buttonPrimary = Color(0xFFE4344D);
  static const Color buttonSecondary = Color(0xFF757575);
  static const Color buttonDisabled = Color(0xFFBDBDBD);
  static const Color buttonPressed = Color(0xFFD32F2F);
  static const Color buttonHover = Color(0xFFE74C60);

  // Divider & Border Colors
  static const Color divider = Color(0xFFE0E0E0);
  static const Color border = Color(0xFFEEEEEE);
  static const Color deviceItemBorder = Color(0xFFEEEEEE);
  static const Color modalDragIndicator = Color(0xFFE0E0E0);

  // Shadow & Overlay Colors
  static const Color shadow = Color(0x1A000000);
  static const Color deviceItemShadow = Color(0x1A000000);
  static const Color overlay = Color(0x80000000);
  static const Color modalOverlay = Color(0x99000000);

  // QR Scanner Colors
  static const Color qrScannerOverlay = Color(0x99000000);
  static const Color qrScannerBorder = Color(0xFFE4344D);
  static const Color qrFrameBorder = Color(0xFFE4344D);
  static const Color qrScannerGuide = Color(0xFFFFFFFF);

  // Wallet Colors
  static const Color walletPositive = Color(0xFF4CAF50);
  static const Color walletNegative = Color(0xFFE53935);

  // Social Media Colors
  static const Color google = Color(0xFFDB4437);
  static const Color facebook = Color(0xFF4267B2);

  // Toast Colors
  static const Color toastBackground = Color(0xFF323232);
  static const Color toastText = Color(0xFFFFFFFF);

  // Shimmer Effect Colors
  static const Color shimmerBase = Color(0xFFEEEEEE);
  static const Color shimmerHighlight = Color(0xFFFAFAFA);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFFE4344D),
    Color(0xFFE65D6E),
  ];

  // Material Color Swatch
  static const MaterialColor primarySwatch = MaterialColor(
    0xFFE4344D,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFE4344D),  // Primary color
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  // Utility method for color opacity
  static Color getOpacityColor(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
}


class ColorOpacity {
  static const double full = 1.0;
  static const double ninety = 0.9;
  static const double eighty = 0.8;
  static const double seventy = 0.7;
  static const double sixty = 0.6;
  static const double fifty = 0.5;
  static const double forty = 0.4;
  static const double thirty = 0.3;
  static const double twenty = 0.2;
  static const double ten = 0.1;
  static const double zero = 0.0;
}