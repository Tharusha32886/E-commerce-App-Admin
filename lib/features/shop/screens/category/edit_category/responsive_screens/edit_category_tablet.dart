import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/category_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/edit_category/widgets/edit_category_form.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class EditCategoryTabletScreen extends StatelessWidget {
  const EditCategoryTabletScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBreadcrumbWithHeading(
                  returnToPreviousScreen: true,
                  heading: 'Update Category',
                  breadcrumbItems: [TRoutes.categories, 'Update Category']),
              const SizedBox(height: TSizes.spaceBtwSections),
              EditCategoryForm(category: category),
            ],
          ),
        ),
      ),
    );
  }
}
