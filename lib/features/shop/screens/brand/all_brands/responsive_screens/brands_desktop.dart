import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/data_table/table_header.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/loaders/loader_animation.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/brand/brand_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/all_brands/table/data_table.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class BrandsDesktopScreen extends StatelessWidget {
  const BrandsDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BrandController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBreadcrumbWithHeading(
                  heading: 'Brands', breadcrumbItems: ['Brands']),
              const SizedBox(height: TSizes.spaceBtwSections),

              TRoundedContainer(
                  child: Column(
                    children: [
                      TTableHeader(
                        buttonText: 'Create New Brand',
                        onPressed: () => Get.toNamed(TRoutes.createBrand),
                        searchOnChanged: (query) => controller.searchQuery(query),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),


                      Obx(() {

                        if (controller.isLoading.value) return const TLoaderAnimation();
                        
                        return const BrandTable();

                      }),
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
