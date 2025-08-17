import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/edit_banner/responsive_screens/edit_banners_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/edit_banner/responsive_screens/edit_banners_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/edit_banner/responsive_screens/edit_banners_tablet.dart';

class EditBannerScreen extends StatelessWidget {
  const EditBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final banner = Get.arguments;
    
    return TSiteTemplate(
      desktop: EditBannersDesktopScreen(banner: banner),
      tablet: EditBannersTabletScreen(banner: banner),
      mobile: EditBannersMobileScreen(banner: banner),
    );
  }
}