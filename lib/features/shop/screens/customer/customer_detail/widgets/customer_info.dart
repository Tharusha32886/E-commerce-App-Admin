import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/models/user_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class CustomerInfo extends StatelessWidget {
  const CustomerInfo({super.key, required this.customer});

  final UserModel customer;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Customer info', style: Theme.of(context).textTheme.headlineMedium ),
          const SizedBox(height: TSizes.spaceBtwSections),

          Row(
            children: [
              const TRoundedImage(
                padding: 0,
                backgroundColor: TColors.primaryBackground,
                image: TImages.user,
                imageType: ImageType.asset,
                ),
                 const SizedBox(width: TSizes.spaceBtwItems),

                 Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('tharusha', style: Theme.of(context).textTheme.titleLarge,overflow: TextOverflow.ellipsis,maxLines: 1),
                      const Text('tharusha@gmail.com',overflow: TextOverflow.ellipsis,maxLines: 1)
                    ],
                  )
                  )

            ],
          ),
        const SizedBox(height: TSizes.spaceBtwSections),


        // meta data 
        Row(
          children: [
            const SizedBox(width: 120, child: Text('UserName'),),
            const Text(':'),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Expanded(child: Text('ate', style: Theme.of(context).textTheme.titleMedium))
          ],
        ),

         const SizedBox(height: TSizes.spaceBtwItems),

          Row(
          children: [
            const SizedBox(width: 120, child: Text('Country'),),
            const Text(':'),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Expanded(child: Text('Sri lanka', style: Theme.of(context).textTheme.titleMedium))
          ],
        ),

         const SizedBox(height: TSizes.spaceBtwItems),

          Row(
          children: [
            const SizedBox(width: 120, child: Text('Phone number'),),
            const Text(':'),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Expanded(child: Text('+94 714662396', style: Theme.of(context).textTheme.titleMedium))
          ],
        ),

         const SizedBox(height: TSizes.spaceBtwItems),

         const Divider(),
         const SizedBox(height: TSizes.spaceBtwItems),

         Row(
          children: [
            Expanded(
              child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('last order', style: Theme.of(context).textTheme.titleLarge),

                const Text('7 days ago, #987')
              ],
            )
            ),

             Expanded(
              child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Average order value', style: Theme.of(context).textTheme.titleLarge),

                const Text('\$987'),
              ],
            )
            ),
          ],
         ),
          const SizedBox(height: TSizes.spaceBtwItems),

           Row(
          children: [
            Expanded(
              child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Registered', style: Theme.of(context).textTheme.titleLarge),

                 Text(customer.formattedDate),
              ],
            )
            ),

             Expanded(
              child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email marketing', style: Theme.of(context).textTheme.titleLarge),

                const Text('Subscribed'),
              ],
            )
            ),
          ],
         ),



        ],
      ),
    );
  }
}
