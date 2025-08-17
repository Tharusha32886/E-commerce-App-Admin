import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
       padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Shipping Address', style: Theme.of(context).textTheme.headlineMedium ),
          const SizedBox(height: TSizes.spaceBtwSections),

          // meta data 
        Row(
          children: [
            const SizedBox(width: 120, child: Text('Name'),),
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
            Expanded(child: Text('020928378', style: Theme.of(context).textTheme.titleMedium))
          ],
        ),

         const SizedBox(height: TSizes.spaceBtwItems),

        
        Row(
          children: [
            const SizedBox(width: 120, child: Text('Address'),),
            const Text(':'),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Expanded(child: Text('7373 kandy rd kandy', style: Theme.of(context).textTheme.titleMedium))
          ],
        ),


        
        ]
      )
    );
    
  }
}