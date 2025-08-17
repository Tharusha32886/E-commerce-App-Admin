import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/order_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class OrderCustomer extends StatelessWidget {
  const OrderCustomer({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Customer', style: Theme.of(context).textTheme.headlineMedium),
                 const SizedBox(height: TSizes.spaceBtwSections),

                  Row(
                    children: [
                      const TRoundedImage(
                        padding: 0,
                        backgroundColor: TColors.primaryBackground,
                          imageType: ImageType.asset, image: TImages.user),

                       const SizedBox(width: TSizes.spaceBtwItems),

                        Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tharusha', style: Theme.of(context).textTheme.titleLarge,overflow: TextOverflow.ellipsis,maxLines: 1),
                 const Text('tharusha@gmail.com',overflow: TextOverflow.ellipsis,maxLines: 1),
                  
                ],
              )
              ),
                    ],
                  ),
              ],
            ),
          ),
      const SizedBox(height: TSizes.spaceBtwSections),

      SizedBox(
        width: double.infinity,
        child: TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Shipping Address', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text('Shipping Address', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: TSizes.spaceBtwItems /2),
              Text('Shipping Address', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: TSizes.spaceBtwItems /2),
              Text('Shipping Address', style: Theme.of(context).textTheme.titleSmall),
              
            ],
          ),
        ),
      ),

      const SizedBox(height: TSizes.spaceBtwSections),

      SizedBox(
        width: double.infinity,
        child: TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Billing Address', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text('Billing Address', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: TSizes.spaceBtwItems /2),
              Text('Billing Address', style: Theme.of(context).textTheme.titleSmall),
              
              
            ],
          ),
        ),
      ),

      const SizedBox(height: TSizes.spaceBtwSections),

        SizedBox(
        width: double.infinity,
        child: TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Billing Address', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text('Billing Address', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: TSizes.spaceBtwItems /2),
              Text('Billing Address', style: Theme.of(context).textTheme.titleSmall),
              
              
            ],
          ),
        ),
      ),

      const SizedBox(height: TSizes.spaceBtwSections),


        ]);
  }
}

        