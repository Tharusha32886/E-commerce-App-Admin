import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/data_table/table_header.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/all_products/table/products_table.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProductsMobileScreen extends StatelessWidget {
  const ProductsMobileScreen({super.key});

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
                  heading: 'Products', breadcrumbItems: ['Products']),
              const SizedBox(height: TSizes.spaceBtwSections),

              TRoundedContainer(
                  child: Column(
                    children: [
                      TTableHeader(
                        buttonText: 'Add Product',
                        onPressed: () => Get.toNamed(TRoutes.createProduct),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),


                      const ProductsTable(),
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