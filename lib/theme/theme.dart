import 'package:flutter/material.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Primary Colors
  static const Color primaryColor = Color.fromARGB(255, 132, 100, 184);
  static const Color secondaryColor = Color(0xFF6c757d);
  static const Color dangerColor = Color(0xFFdc3545);
  static const Color successColor = Color(0xFF28a745);
  static const Color warningColor = Color(0xFFffc107);
  static const Color infoColor = Color(0xFF17a2b8);
  static const Color lightColor = Color(0xFFf8f9fa);
  static const Color darkColor = Color(0xFF343a40);

  // Service Icon Colors
  static const Color antarKotaColor = Color(0xFF2196F3); // Blue
  static const Color lokalColor = Color(0xFFFF9800); // Orange
  static const Color commuterColor = Color(0xFFF44336); // Red
  static const Color lrtColor = Color(0xFF9C27B0); // Purple
  static const Color bandaraColor = Color(0xFF009688); // Teal
  static const Color whooshColor = Color(0xFF4CAF50); // Green
  static const Color hotelColor = Color(0xFF00BCD4); // Cyan
  static const Color kaiLogistikColor = Color(0xFF795548); // Brown
  static const Color pulsaColor = Color(0xFF8BC34A); // Light Green
  static const Color gamesColor = Color(0xFF3F51B5); // Indigo
  static const Color plnColor = Color(0xFFFFC107); // Amber

  // Service Page Colors
  static const Color railfoodColor = Color(0xFFE91E63); // Pink
  static const Color taksiColor = Color(0xFF2196F3); // Blue
  static const Color taksiPremiumColor = Color(0xFF9C27B0); // Purple
  static const Color grabCarColor = Color(0xFF4CAF50); // Green
  static const Color busEksekutifColor = Color(0xFF009688); // Teal
  static const Color busBisnisColor = Color(0xFF2196F3); // Blue
  static const Color busEkonomiColor = Color(0xFF4CAF50); // Green
  static const Color hotelBintang5Color = Color(0xFFFFC107); // Amber
  static const Color hotelBintang4Color = Color(0xFFFF9800); // Orange
  static const Color hotelBintang3Color = Color(0xFF2196F3); // Blue

  // Profile page colors
  static const Color profileAvatarColor = Color(0xFFFF9800); // Orange
  static const Color premiumBadgeColor = Color(0xFFFFC107); // Amber
  static const Color logoutColor = Color(0xFFE53935); // Red
  static const Color profileGradientEnd = Color(0xFF9C27B0); // Purple

  // Promo Colors
  static const Color promoGradientStart = Color(0xFF9C27B0); // Purple
  static const Color promoGradientEnd = Color(0xFF673AB7); // Deep Purple
  static const Color promoOverlay = Color(0x80000000); // Semi-transparent Black

  // Card Colors
  static const Color cardBackground = Color(0xFFF5F5F5); // Grey 100
  static const Color cardBorder = Color(0xFFE0E0E0); // Grey 200

  // Text Colors
  static const Color textPrimary = Color(0xFF212121); // Grey 900
  static const Color textSecondary = Color(0xFF757575); // Grey 600
  static const Color textTertiary = Color(0xFF9E9E9E); // Grey 500
  static const Color textBlack = Color(0xFF000000); // Black

  // Common Colors
  static const Color colorWhite = Color(0xFFFFFFFF); // White

  // Grey shades
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // Fonts
  static const String googleFont = 'GoogleSans';
  static const String appleFont = 'AppleSDGothicNeo';
  static const String poppinsFont = 'Poppins';
  static const String robotoFont = 'Roboto';
  static const String montserratFont = 'Montserrat';
}

// Backward compatibility constants - allows existing code to work without changes
const Color primaryColor = AppTheme.primaryColor;
const Color secondaryColor = AppTheme.secondaryColor;
const Color dangerColor = AppTheme.dangerColor;
const Color successColor = AppTheme.successColor;
const Color warningColor = AppTheme.warningColor;
const Color infoColor = AppTheme.infoColor;
const Color lightColor = AppTheme.lightColor;
const Color darkColor = AppTheme.darkColor;

const Color antarKotaColor = AppTheme.antarKotaColor;
const Color lokalColor = AppTheme.lokalColor;
const Color commuterColor = AppTheme.commuterColor;
const Color lrtColor = AppTheme.lrtColor;
const Color bandaraColor = AppTheme.bandaraColor;
const Color whooshColor = AppTheme.whooshColor;
const Color hotelColor = AppTheme.hotelColor;
const Color kaiLogistikColor = AppTheme.kaiLogistikColor;
const Color pulsaColor = AppTheme.pulsaColor;
const Color gamesColor = AppTheme.gamesColor;
const Color plnColor = AppTheme.plnColor;

const Color railfoodColor = AppTheme.railfoodColor;
const Color taksiColor = AppTheme.taksiColor;
const Color taksiPremiumColor = AppTheme.taksiPremiumColor;
const Color grabCarColor = AppTheme.grabCarColor;
const Color busEksekutifColor = AppTheme.busEksekutifColor;
const Color busBisnisColor = AppTheme.busBisnisColor;
const Color busEkonomiColor = AppTheme.busEkonomiColor;
const Color hotelBintang5Color = AppTheme.hotelBintang5Color;
const Color hotelBintang4Color = AppTheme.hotelBintang4Color;
const Color hotelBintang3Color = AppTheme.hotelBintang3Color;

const Color profileAvatarColor = AppTheme.profileAvatarColor;
const Color premiumBadgeColor = AppTheme.premiumBadgeColor;
const Color logoutColor = AppTheme.logoutColor;
const Color profileGradientEnd = AppTheme.profileGradientEnd;

const Color promoGradientStart = AppTheme.promoGradientStart;
const Color promoGradientEnd = AppTheme.promoGradientEnd;
const Color promoOverlay = AppTheme.promoOverlay;

const Color cardBackground = AppTheme.cardBackground;
const Color cardBorder = AppTheme.cardBorder;

const Color textPrimary = AppTheme.textPrimary;
const Color textSecondary = AppTheme.textSecondary;
const Color textTertiary = AppTheme.textTertiary;
const Color textBlack = AppTheme.textBlack;

const Color colorWhite = AppTheme.colorWhite;

const Color grey50 = AppTheme.grey50;
const Color grey100 = AppTheme.grey100;
const Color grey200 = AppTheme.grey200;
const Color grey300 = AppTheme.grey300;
const Color grey400 = AppTheme.grey400;
const Color grey500 = AppTheme.grey500;
const Color grey600 = AppTheme.grey600;
const Color grey700 = AppTheme.grey700;
const Color grey800 = AppTheme.grey800;
const Color grey900 = AppTheme.grey900;

const String googleFont = AppTheme.googleFont;
const String appleFont = AppTheme.appleFont;
const String poppinsFont = AppTheme.poppinsFont;
const String robotoFont = AppTheme.robotoFont;
const String montserratFont = AppTheme.montserratFont;

class AppTextStyles {
  // Private constructor to prevent instantiation
  AppTextStyles._();

  // Heading Styles
  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppTheme.textPrimary,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppTheme.textPrimary,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppTheme.textPrimary,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppTheme.textPrimary,
  );

  static const TextStyle h5 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppTheme.textPrimary,
  );

  static const TextStyle h6 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppTheme.textPrimary,
  );

  // Body Styles
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppTheme.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppTheme.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppTheme.textPrimary,
  );

  // Label Styles
  static const TextStyle labelLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppTheme.textPrimary,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppTheme.textPrimary,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppTheme.textPrimary,
  );

  // Caption Styles
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppTheme.textSecondary,
  );

  static const TextStyle captionSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppTheme.textSecondary,
  );

  // Overline Styles
  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppTheme.textTertiary,
    letterSpacing: 0.5,
  );

  // Button Styles
  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppTheme.colorWhite,
    letterSpacing: 0.5,
  );

  static const TextStyle buttonLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppTheme.colorWhite,
    letterSpacing: 0.5,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppTheme.colorWhite,
    letterSpacing: 0.5,
  );

  // Link Styles
  static const TextStyle link = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppTheme.primaryColor,
    decoration: TextDecoration.underline,
  );

  static const TextStyle linkMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppTheme.primaryColor,
    decoration: TextDecoration.underline,
  );

  // Price Styles
  static const TextStyle price = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppTheme.primaryColor,
  );

  static const TextStyle priceSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppTheme.primaryColor,
  );

  static const TextStyle priceLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppTheme.primaryColor,
  );

  // Card Styles
  static const TextStyle cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppTheme.textPrimary,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppTheme.textSecondary,
  );

  // AppBar Styles
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppTheme.textBlack,
  );

  // Profile Styles
  static const TextStyle profileName = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppTheme.colorWhite,
  );

  static const TextStyle profileSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppTheme.colorWhite,
  );

  // Service Label Styles
  static const TextStyle serviceLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppTheme.textSecondary,
  );

  // Badge Styles
  static const TextStyle badge = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: AppTheme.colorWhite,
  );

  static const TextStyle badgeMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppTheme.colorWhite,
  );

  // Premium Member Style
  static const TextStyle premiumMember = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppTheme.premiumBadgeColor,
  );

  // White Text Styles
  static const TextStyle h1White = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppTheme.colorWhite,
  );

  static const TextStyle h2White = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppTheme.colorWhite,
  );

  static const TextStyle h3White = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppTheme.colorWhite,
  );

  static const TextStyle h4White = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppTheme.colorWhite,
  );

  static const TextStyle h5White = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppTheme.colorWhite,
  );

  static const TextStyle h6White = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppTheme.colorWhite,
  );

  static const TextStyle bodyLargeWhite = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppTheme.colorWhite,
  );

  static const TextStyle bodyMediumWhite = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppTheme.colorWhite,
  );

  static const TextStyle bodySmallWhite = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppTheme.colorWhite,
  );

  static const TextStyle buttonLargeWhite = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppTheme.colorWhite,
    letterSpacing: 0.5,
  );

  // White Text Styles with Opacity
  static TextStyle bodyMediumWhite90 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppTheme.colorWhite.withOpacity(0.9),
  );

  static TextStyle bodyMediumWhite70 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppTheme.colorWhite.withOpacity(0.7),
  );

  static TextStyle bodySmallWhite90 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppTheme.colorWhite.withOpacity(0.9),
  );

  static TextStyle bodySmallWhite70 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppTheme.colorWhite.withOpacity(0.7),
  );

  // Red Text Styles
  static const TextStyle bodyMediumRed = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppTheme.logoutColor,
  );
}
