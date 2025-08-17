import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/features/personalization/screens/profile/widgets/form.dart';
import 'package:yt_ecommerce_admin_panel/features/personalization/screens/profile/widgets/image_meta.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProfileDesktopScreen extends StatelessWidget {
  const ProfileDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBreadcrumbWithHeading(heading: 'Profile', breadcrumbItems: ['Profile']),
              SizedBox(height: TSizes.spaceBtwSections),


              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: ImageAndMeta()),
                   SizedBox(width: TSizes.spaceBtwSections),

                   Expanded(flex: 2,child: ProfileForm())
                  
                ],
              )
            ],
          ),
          ),
      ),
    );
  }
}