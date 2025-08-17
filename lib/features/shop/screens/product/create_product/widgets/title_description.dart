import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/product/create_product_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/validators/validation.dart';

class ProductTitleAndDescription extends StatelessWidget {
  const ProductTitleAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateProductController());
    return TRoundedContainer(
      child: Form(
        key: controller.titleDescriptionFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Base information',style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: TSizes.spaceBtwItems),

            TextFormField(
              controller: controller.title,
              validator: (value) => TValidator.validateEmptyText('Product Title',value),
               decoration: const InputDecoration(labelText: 'Product Title'),),
            const SizedBox(height: TSizes.spaceBtwInputFields),


            SizedBox(
              height: 300,
              child: TextFormField(
                expands: true,
                maxLines: null,
                textAlign: TextAlign.start,
                controller: controller.description,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,
                validator: (value) => TValidator.validateEmptyText('Product Description',value),
                decoration: const InputDecoration(labelText: 'Description',hintText: 'Product Description',
                alignLabelWithHint: true),),
            )
            
          ],
        )
        ),
    );
  }
}