import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class TResponsiveWidget extends StatelessWidget{
  const TResponsiveWidget({super.key, required this.mobile, required this.tablet, required this.desktop});

  // widget for desktop
  final Widget desktop;

  // widget for tablet
  final Widget tablet;

  // widget for mobile
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= TSizes.desktopScreenSize) {
          return desktop;
        } else if (constraints.maxWidth < TSizes.desktopScreenSize && constraints.maxWidth >= TSizes.tabletScreenSize) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}