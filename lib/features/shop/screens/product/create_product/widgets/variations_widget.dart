import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/image_uploader.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/product/create_product_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/product/product_images_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/product/product_variations_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_variation_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProductVariations extends StatelessWidget {
  const ProductVariations({super.key});

  @override
  Widget build(BuildContext context) {
    final variationController = ProductVariationController.instance;

    return Obx(
      () => CreateProductController.instance.productType.value == ProductType.variable
      ? TRoundedContainer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Product Variations',
                  style: Theme.of(context).textTheme.headlineSmall),
              TextButton(onPressed: () => variationController.removeVariations(context), child: const Text('Remove Variation'))
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
      
          // varitaion
          if (variationController.productVariations.isNotEmpty)
          ListView.separated(
            itemCount: variationController.productVariations.length,
            shrinkWrap: true,
            separatorBuilder: (_, __) =>
                const SizedBox(height: TSizes.spaceBtwItems),
            itemBuilder: (_, index) {
              final variation = variationController.productVariations[index];
              return _buildeVariationTile(context, index, variation, variationController);
            },
          )
          else
      
          _buildNoVariationsMessage(),
        ],
      ))
      : const SizedBox.shrink(),
    );
  }

  Widget _buildeVariationTile(
      BuildContext context, int index, ProductVariationModel variation, ProductVariationController variationController
  ) {
    return ExpansionTile(
      backgroundColor: TColors.lightGrey,
      collapsedBackgroundColor: TColors.lightGrey,
      childrenPadding: const EdgeInsets.all(TSizes.md),
      expandedAlignment: Alignment.topLeft,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg)),
      title:  Text(variation.attributeValues.entries.map((entry) => '${entry.key}: ${entry.value}').join(', ')),
      children: [
        // upload
        Obx(() => TImageUploader(
              right: 0,
              left: null,
              imageType: variation.image.value.isNotEmpty ? ImageType.network :   ImageType.asset,
              image: variation.image.value.isNotEmpty ? variation.image.value : TImages.defaultImage,
              onIconButtonPressed: () => ProductImagesController.instance.selectVariationImage(variation),
            )),

        const SizedBox(height: TSizes.spaceBtwInputFields),

        Row(
          children: [
            Expanded(
                child: TextFormField(
                  onChanged: (value) => variation.stock = int.parse(value),
                  decoration: const InputDecoration(
                        labelText: 'Stock',
                        hintText: 'Add Stock, only numbers are allowed'),
                        controller: variationController.stockControllersList[index][variation],
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    )),
            const SizedBox(width: TSizes.spaceBtwInputFields),
            Expanded(
                child: TextFormField(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}$'))
                    ],
                    onChanged: (value) => variation.price = double.parse(value),
                    controller: variationController.salePriceControllersList[index][variation],
                    decoration: const InputDecoration(
                        labelText: 'Discounted Price',
                        hintText: 'Price with up-to 2 decimal'))),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwInputFields),

        TextFormField(
          onChanged: (value) => variation.description = value,
          controller: variationController.descriptionControllersList[index][variation], 
            decoration: const InputDecoration(
                labelText: 'Description', hintText: 'Add description for this variation')),

        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }

  Widget _buildNoVariationsMessage() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TRoundedImage(
                width: 200,
                height: 200,
                imageType: ImageType.asset,
                image: TImages.defaultAttributeColorsImageIcon)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Text('There are no variations added for this product'),
      ],
    );
  }
}
