import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/product/product_images_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/widgets/additional_images.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/widgets/attributes_widget.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/widgets/bottom_navigation_widget.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/widgets/brand_widget.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/widgets/categories_widget.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/widgets/product_type_widget.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/widgets/stock_pricing_widget.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/widgets/thumbnail_image_widget.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/widgets/title_description.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/widgets/variations_widget.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/widgets/visibility_widget.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/device/device_utility.dart';

class EditProductDesktopScreen extends StatelessWidget {
  const EditProductDesktopScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductImagesController());
    return Scaffold(
      bottomNavigationBar:  ProductBottomNavigationButtons(product: product,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBreadcrumbWithHeading(
                  returnToPreviousScreen: true,
                  heading: 'Edit Product',
                  breadcrumbItems: [TRoutes.products, 'Edit Product']),
              const SizedBox(height: TSizes.spaceBtwSections),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: TDeviceUtils.isTabletScreen(context) ? 2 : 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProductTitleAndDescription(),

                        const SizedBox(height: TSizes.spaceBtwSections),

                        // Stock and Price
                        TRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Stock and Price',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              const SizedBox(height: TSizes.spaceBtwItems),

                              const ProductTypeWidget(),

                              const SizedBox(
                                  height: TSizes.spaceBtwInputFields),

                              const ProductStockAndPricing(),

                              const SizedBox(height: TSizes.spaceBtwSections),

                              // atrributes
                              const ProductAttributes(),

                              const SizedBox(height: TSizes.spaceBtwSections),
                            ],
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // varitaions
                        const ProductVariations(),
                      ],
                    ),
                  ),

                  const SizedBox(width: TSizes.defaultSpace),

                  //sidebar

                  Expanded(
                      child: Column(
                    children: [
                      const ProductThumbnailImage(),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      // product image
                      TRoundedContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('All Product Images',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(height: TSizes.spaceBtwItems),
                            ProductAdditionalImages(
                              additionalProductImagesUrls: controller.additionalProductImagesUrls,
                                  
                              onTapToAddImages: () => controller.selectMultipleProductImages(),
                              onTapToRemoveImage: (index) => controller.removeImage(index),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: TSizes.spaceBtwSections),

                      //product brand
                      const ProductBrand(),

                      const SizedBox(height: TSizes.spaceBtwSections),

                      // product category
                      ProductCategories(product: product),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      // product visisbility
                      const ProductVisibilityWidget(),
                      const SizedBox(height: TSizes.spaceBtwSections),
                    ],
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
