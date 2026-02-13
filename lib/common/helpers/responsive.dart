import 'package:flutter/material.dart';

class Responsive {
  // Breakpoint classique : 600px est la norme pour séparer mobile et tablette
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 1024.0;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  static EdgeInsets pagePadding(BuildContext context) {
    if (isMobile(context)) return const EdgeInsets.all(16.0);
    if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0);
    }
    return const EdgeInsets.symmetric(horizontal: 120.0, vertical: 50.0);
  }
}
