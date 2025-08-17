import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/create_banner/responsive_screens/create_banners_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/create_banner/responsive_screens/create_banners_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/create_banner/responsive_screens/create_banners_tablet.dart';

class CreateBannerScreen extends StatelessWidget {
  const CreateBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: CreateBannersDesktopScreen(), tablet: CreateBannersTabletScreen(), mobile: CreateBannersMobileScreen());
  }
}