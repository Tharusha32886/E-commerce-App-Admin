import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/product/create_product_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/validators/validation.dart';

class ProductStockAndPricing extends StatelessWidget {
  const ProductStockAndPricing({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateProductController.instance;
    return Obx(
      () => controller.productType.value == ProductType.single
      ? Form(
        key: controller.stockPriceFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            //stock
            FractionallySizedBox(
              widthFactor: 0.45,
              child: TextFormField(
                controller: controller.stock,
                decoration: const InputDecoration(labelText: 'Stock',hintText: 'Add Stock, only numbers are allowed'),
                validator: (value) => TValidator.validateEmptyText('Stock',value),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                )),
                const SizedBox(height: TSizes.spaceBtwInputFields),
      
      
                //pricing
                Row(
                  children: [
                    // price
                    Expanded(
                      child: TextFormField(
                        controller: controller.price,
                        decoration: const InputDecoration(labelText: 'Price',hintText: 'Add Price, only numbers are allowed'),
                        validator: (value) => TValidator.validateEmptyText('Price',value),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$'))
                        ],
                      )
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
      
      
      
                    // sale price
                    Expanded(
                      child: TextFormField(
                        controller: controller.salePrice,
                        decoration: const InputDecoration(labelText: 'Sale Price',hintText: 'Add Sale Price, only numbers are allowed'),
                       
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$'))
                        ],
                      )
                    ),
                  ],
                )
          ],
        ),
      )
      : const SizedBox.shrink(),
    );
  }
}