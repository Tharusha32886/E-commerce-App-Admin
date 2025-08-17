import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/image_uploader.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProductVariations extends StatelessWidget {
  const ProductVariations({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Variations', style: Theme.of(context).textTheme.headlineSmall),
              TextButton(onPressed: () {}, child: const Text('Add Variation'))
            ],
          ),
           const SizedBox(height: TSizes.spaceBtwItems),

           // varitaion
           ListView.separated(
              itemCount: 2,
              shrinkWrap: true,
              separatorBuilder: (_,__) => const SizedBox(height: TSizes.spaceBtwItems),
            itemBuilder: (_,index) {
              return _buildeVariationTile();
            },
             
           
             ),

             _buildNoVariationsMessage(),
        ],
             )
        
    );
  }


  Widget _buildeVariationTile() {
    return ExpansionTile(
      backgroundColor: TColors.lightGrey,
      collapsedBackgroundColor: TColors.lightGrey,
      childrenPadding: const EdgeInsets.all( TSizes.md),
      expandedAlignment: Alignment.topLeft,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.borderRadiusLg)),
      title: const Text('Color'),
      children: [
       // upload 
       Obx(
        () => TImageUploader(
          right: 0,
          left: null,
          

          imageType: ImageType.asset,
          image: TImages.defaultImage,
          onIconButtonPressed: () {
            
          },)
       ),

       const SizedBox(height: TSizes.spaceBtwInputFields),

       Row(
        children: [
          Expanded(
            child:TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(labelText: 'Quantity',hintText: 'Add Quantity, only numbers are allowed')
            ) 
          ),
          const SizedBox(width: TSizes.spaceBtwInputFields),
          Expanded(
            child: TextFormField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow( RegExp(r'^\d+\.?\d{0,2}$'))],
              decoration: const InputDecoration(labelText: 'Price',hintText: 'Add Price, only numbers are allowed')
            ) 
          ),
        ],
       ),

       const SizedBox(height: TSizes.spaceBtwInputFields),

       TextFormField(
        decoration: const InputDecoration(labelText: 'Description',hintText: 'Add Description')
       ),

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
            TRoundedImage(width: 200, height: 200, imageType: ImageType.asset, image: TImages.defaultAttributeColorsImageIcon)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Text('There are no variations'),
      ],
   
    );
  }
}