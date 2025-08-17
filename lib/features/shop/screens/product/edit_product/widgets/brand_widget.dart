import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/brand_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProductBrand extends StatelessWidget {
  const ProductBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Brand', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwItems),

          TypeAheadField(
            builder: (context, ctr, focusNode) {
              return TextFormField(
                focusNode: focusNode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product Brand',
                  suffixIcon: Icon(Iconsax.box),
                ),
              );
            }, 
            suggestionsCallback: (pattern) { 
              return [
                BrandModel(id: 'id', image: TImages.adidasLogo, name: 'Adidas'),
                BrandModel(id: 'id', image: TImages.nikeLogo, name: 'Nike'),
              ];
             },

            
            
            itemBuilder: ( context, suggestion) { 
              return ListTile(
                title: Text(suggestion.name),
              );
             }, onSelected: (suggestion) {  }, 
          ),
        ],
      ),
    );
  }
}