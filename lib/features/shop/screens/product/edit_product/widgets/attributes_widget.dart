import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/device/device_utility.dart';
import 'package:yt_ecommerce_admin_panel/utils/validators/validation.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: TColors.primaryBackground),
        const SizedBox(height: TSizes.spaceBtwSections),

        Text('Add Product Attributes',
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: TSizes.spaceBtwItems),

        // form
        Form(
          child: TDeviceUtils.isDesktopScreen(context)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildAttributeName(),
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(
                      flex: 2,
                      child: _buildAttributeTextField(),
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    _buildAttributeButton(),
                  ],
                )
              : Column(
                  children: [
                    _buildAttributeName(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    _buildAttributeTextField(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    _buildAttributeButton(),
                  ],
                ),
        ),

        const SizedBox(height: TSizes.spaceBtwSections),

        // List of added attributes
        Text('All Attributes',
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: TSizes.spaceBtwItems),

        TRoundedContainer(
          backgroundColor: TColors.primaryBackground,
          child: Column(
            children: [
              buildAttributesList(context),
              buildEmptyAttributes(),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        // genarate varitaion buttons
        Center(
          child: SizedBox(
            width: 200,
            child: ElevatedButton.icon(
              icon: const Icon(Iconsax.activity),
              label: const Text('Generate Variations'),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }

  Column buildEmptyAttributes() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TRoundedImage(
                width: 150,
                height: 80,
                imageType: ImageType.asset,
                image: TImages.defaultAttributeColorsImageIcon)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Text('There are no attributes'),
      ],
    );
  }

  ListView buildAttributesList(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwItems,
      ),
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
              color: TColors.white,
              borderRadius: BorderRadius.circular(TSizes.borderRadiusLg)),
          child: ListTile(
              title: const Text('Color'),
              subtitle: const Text('Red'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.trash, color: TColors.error),
              )),
        );
      },
    );
  }

  SizedBox _buildAttributeButton() {
    return SizedBox(
      width: 100,
      child: ElevatedButton.icon(
        icon: const Icon(Iconsax.add),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: TColors.black,
          backgroundColor: TColors.secondary,
          side: const BorderSide(color: TColors.secondary),
        ),
        label: const Text('Add Attribute'),
      ),
    );
  }

  TextFormField _buildAttributeName() {
    return TextFormField(
        validator: (value) =>
            TValidator.validateEmptyText('Attribute Name', value),
        decoration: const InputDecoration(
            labelText: 'Attribute Name', hintText: 'Add Attribute Name'));
  }

  SizedBox _buildAttributeTextField() {
    return SizedBox(
      height: 80,
      child: TextFormField(
        expands: true,
        minLines: null,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.multiline,
        textAlignVertical: TextAlignVertical.top,
        validator: (value) =>
            TValidator.validateEmptyText('Attribute Value', value),
        decoration: const InputDecoration(
            labelText: 'Attribute Value',
            hintText: 'Add Attribute Value',
            alignLabelWithHint: true),
      ),
    );
  }
}
