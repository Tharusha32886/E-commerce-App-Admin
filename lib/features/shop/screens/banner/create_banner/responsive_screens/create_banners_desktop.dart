import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/data_table/table_header.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/create_banner/widgets/create_banner_form.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class CreateBannersDesktopScreen extends StatelessWidget {
  const CreateBannersDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                  heading: 'Create Banners', breadcrumbItems: [TRoutes.banners, 'Create Banners']),
              const SizedBox(height: TSizes.spaceBtwSections),

               TRoundedContainer(
                  child: Column(
                    children: [
                      TTableHeader(
                        buttonText: 'Create New Banner',
                        onPressed: () => Get.toNamed(TRoutes.createBanner),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),


                      const CreateBannersForm(),
                    ],
                  ),
                )
              
            ],
          ),
        ),
      ),
    );
  }
}