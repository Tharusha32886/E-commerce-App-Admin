import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/customer/customer_detail/table/data_table.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class CustomerOrders extends StatelessWidget {
  const CustomerOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('orders', style: Theme.of(context).textTheme.headlineMedium),
              Text.rich(TextSpan(children: [
                const TextSpan(text: 'Total Spent'),
                TextSpan(
                    text: '\$500.90',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: TColors.primary)),
                TextSpan(
                    text: 'on ${5} orders',
                    style: Theme.of(context).textTheme.bodyLarge)
              ])),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          TextFormField(
            onChanged: (query) {},
            decoration: const InputDecoration(
                hintText: 'Search Orders',
                prefixIcon: Icon(Iconsax.search_normal)),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          const CustomerOrderTable(),
        ],
      ),
    );
  }
}
