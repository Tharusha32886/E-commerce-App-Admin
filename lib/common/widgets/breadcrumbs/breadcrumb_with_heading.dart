import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/texts/page_heading.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class TBreadcrumbWithHeading extends StatelessWidget {
  const TBreadcrumbWithHeading({
    super.key,
    required this.heading,
    required this.breadcrumbItems,
     this.returnToPreviousScreen = false,
    });

  final String heading;

  final List<String> breadcrumbItems;

  final bool returnToPreviousScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // braedcrumb
        Row(
          children: [
            InkWell(
              onTap: () => Get.offAllNamed(TRoutes.dashboard),
              child: Padding(
                padding: const EdgeInsets.all(TSizes.xs),
                child: Text('Dashboard',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontWeightDelta: -1)),
              ),
            ),

            for (int i = 0; i < breadcrumbItems.length; i++)
            Row(
              children: [
                const Text('/'),
                  InkWell(
              onTap: i == breadcrumbItems.length -1 ? null : () => Get.toNamed(breadcrumbItems[i]),
              child: Padding(
                padding: const EdgeInsets.all(TSizes.xs),


                child: Text(i == breadcrumbItems.length -1 ? breadcrumbItems[i].capitalize.toString() : capitalize(breadcrumbItems[i].substring(1)),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontWeightDelta: -1)),
              ),
            ),
              ],
            )
             
          ],
        ),
        const SizedBox(height: TSizes.sm),


        // heading
        Row(
          children: [
            if(returnToPreviousScreen) IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)),
            if(returnToPreviousScreen) const SizedBox(width: TSizes.spaceBtwItems),
            TPageHeading(heading: heading)
          ],
        )
      ],
    );
  }

  String capitalize(String s){
    return s.isEmpty ? '' : s[0].toUpperCase() + s.substring(1);
  }
}
