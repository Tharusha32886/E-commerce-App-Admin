import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/shimmers/shimmer.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/category/category_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/product/create_product_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {

    final categoriesController = Get.put(CategoryController());

    if (categoriesController.allItems.isEmpty) {
      categoriesController.fetchItems();
    }

    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Categories', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwItems),


          Obx(
            () => categoriesController.isLoading.value ? const TShimmerEffect(width: double.infinity, height: 50) :
            MultiSelectDialogField(
              buttonText: const Text('Select Categories'),
              title: const Text('categories'),
              items: categoriesController.allItems.map((category) => MultiSelectItem(category, category.name)).toList(),
              listType: MultiSelectListType.CHIP,
               onConfirm: (value) {
                CreateProductController.instance.selectedCategories.assignAll(value);
               }),
          )
        ],
      ),
    );
  }
}