import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/edit_category/responsive_screens/edit_category_desktop.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/edit_category/responsive_screens/edit_category_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/edit_category/responsive_screens/edit_category_tablet.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = Get.arguments;
    return TSiteTemplate(
        desktop: EditCategoryDesktopScreen(category: category),
        tablet: EditCategoryTabletScreen(category: category),
        mobile: EditCategoryMobileScreen(category: category));
  }
}
