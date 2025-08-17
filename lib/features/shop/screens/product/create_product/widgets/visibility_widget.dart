import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProductVisibilityWidget extends StatelessWidget {
  const ProductVisibilityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Visibility',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwItems),
          Column(
            children: [
              _buildVisiblityRadioButton(ProductVisibility.published, 'Published'),
              _buildVisiblityRadioButton(ProductVisibility.hidden, 'Hidden'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildVisiblityRadioButton(ProductVisibility value, String label) {
    return RadioMenuButton<ProductVisibility>(
      value: value,
      groupValue: ProductVisibility.published,
      onChanged: (selection) {},
      child: Text(label),
    );
  }
}
