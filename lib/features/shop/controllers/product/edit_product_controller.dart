import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/data/repositories/product/product_repository.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/category/category_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/product/product_attributes_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/product/product_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/product/product_images_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/product/product_variations_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/brand_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/category_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_category_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/network_manager.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/loaders.dart';

class EditProductController extends GetxController {
  static EditProductController get instance => Get.find();

  // Observables for loading state and product details
  final isLoading = false.obs;
  final selectedCategoriesLoader = false.obs;
  final productType = ProductType.single.obs;
  final productVisibility = ProductVisibility.hidden.obs;

  // Controllers and keys
  final variationsController = Get.put(ProductVariationController());
  final attributesController = Get.put(ProductAttributesController());
  final imagesController = Get.put(ProductImagesController());
  final stockPriceFormKey = GlobalKey<FormState>();
  final productRepository = Get.put(ProductRepository());
  final titleDescriptionFormKey = GlobalKey<FormState>();

  // Text editing controllers for input fields
  TextEditingController title = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController salePrice = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController brandTextField = TextEditingController();

  // Rx observables for selected brand and categories
  final Rx<BrandModel?> selectedBrand = Rx<BrandModel?>(null);
  final RxList<CategoryModel> selectedCategories = <CategoryModel>[].obs;
  final List<CategoryModel> alreadySelectedCategories = <CategoryModel>[];

  // Flags for tracking different tasks
  RxBool thumbnailUploader = true.obs;
  RxBool additionalImagesUploader = true.obs;
  RxBool productDataUploader = false.obs;
  RxBool categoriesRelationshipUploader = false.obs;

  // Initialize Product Data
  void initProductData(ProductModel product) {
    try {
      isLoading.value = true; // Set loading state while initializing data

      // Basic Information
      title.text = product.title;
      description.text = product.description ?? '';
      productType.value = product.productType == ProductType.single.toString()
          ? ProductType.single
          : ProductType.variable;

      // Stock & Pricing (assuming productType and productVisibility are handled elsewhere)
      if (product.productType == ProductType.single.toString()) {
        stock.text = product.stock.toString();
        price.text = product.price.toString();
        salePrice.text = product.salePrice.toString();
      }

      // Product Brand
      selectedBrand.value = product.brand;
      brandTextField.text = product.brand?.name ?? '';

      // Product Thumbnail and Images
      if (product.images != null) {
        // Set the first image as the thumbnail
        imagesController.selectedThumbnailImageUrl.value = product.thumbnail;

        // Add the images to additionalProductImagesUrl
        imagesController.additionalProductImagesUrls
            .assignAll(product.images ?? []);
      }

      // Product Attributes & Variations
      attributesController.productAttributes
          .assignAll(product.productAttributes ?? []);
      variationsController.productVariations
          .assignAll(product.productVariations ?? []);
      variationsController
          .initializeVariationControllers(product.productVariations ?? []);

      isLoading.value =
          false; // Set loading state back to false after initialization

      update();
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }

  Future<List<CategoryModel>> loadSelectedCategories(String productId) async {
    selectedCategoriesLoader.value = true;
    // Product Categories
    final productCategories =
        await productRepository.getProductCategories(productId);
    final categoriesController = Get.put(CategoryController());
    if (categoriesController.allItems.isEmpty)await categoriesController.fetchItems();

    final categoriesIds = productCategories.map((e) => e.categoryId).toList();
    final categories = categoriesController.allItems
        .where((element) => categoriesIds.contains(element.id))
        .toList();
    selectedCategories.assignAll(categories);
    alreadySelectedCategories.assignAll(categories);
    selectedCategoriesLoader.value = false;
    return categories;
  }

// Function to create a new product
  Future<void> editProduct(ProductModel product) async {
    try {
      // Show progress dialog
      showProgressDialog();

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Validate title and description form
      if (!titleDescriptionFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Validate stock and pricing form if ProductType = Single
      if (productType.value == ProductType.single &&
          !stockPriceFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (selectedBrand.value == null) throw 'Select Brand for this product.';

      if (productType.value == ProductType.variable &&
          ProductVariationController.instance.productVariations.isEmpty) {
        throw 'There are no variations for the product type variable. Create some variations or change the product type.';
      }

      if (productType.value == ProductType.variable) {
        final variationCheckFailed =
            ProductVariationController.instance.productVariations.any(
          (element) =>
              element.price.isNaN ||
              element.price < 0 ||
              element.salePrice.isNaN ||
              element.salePrice < 0 ||
              element.stock.isNaN ||
              element.stock < 0,
        );

        if (variationCheckFailed)throw 'Variation data is not accurate. Please check and try again.';
      }

      final imagesController = ProductImagesController.instance;
      if (imagesController.selectedThumbnailImageUrl.value == null ||
          imagesController.selectedThumbnailImageUrl.value!.isEmpty) {
        throw 'Select product thumbnail image';
      }

      additionalImagesUploader.value = true;

      final variations = ProductVariationController.instance.productVariations;
      if (productType.value == ProductType.single && variations.isNotEmpty) {
        ProductVariationController.instance.resetAllValues();
        variations.value = [];
      }

      product.sku = '';
      product.isFeatured = true;
      product.title = title.text.trim();
      product.brand = selectedBrand.value;
      product.description = description.text.trim();
      product.productType = productType.value.toString();
      product.stock = int.tryParse(stock.text.trim()) ?? 0;
      product.price = double.tryParse(price.text.trim()) ?? 0.0;
      product.images = imagesController.additionalProductImagesUrls;
      product.salePrice = double.tryParse(salePrice.text.trim()) ?? 0.0;
      product.thumbnail =
          imagesController.selectedThumbnailImageUrl.value ?? '';
      product.productAttributes =
          ProductAttributesController.instance.productAttributes;
      product.productVariations = variations;

      productDataUploader.value = true;
      await ProductRepository.instance.updateProduct(product);

      if (selectedCategories.isNotEmpty) {
        categoriesRelationshipUploader.value = true;

        List<String> exisingCategoryIds =
            alreadySelectedCategories.map((category) => category.id).toList();

        for (var category in selectedCategories) {
          if (!exisingCategoryIds.contains(category.id)) {
            final productCategory = ProductCategoryModel(
              productId: product.id,
              categoryId: category.id,
            );
            await ProductRepository.instance
                .createProductCategory(productCategory);
          }
        }

        for (var exisingCategoryId in exisingCategoryIds) {
          if (!selectedCategories
              .any((category) => category.id == exisingCategoryId)) {
            await ProductRepository.instance
                .removeProductCategory(product.id, exisingCategoryId);
          }
        }
      }
      ProductController.instance.updateItemFromLists(product);

      // Stop loading and show success message
      TFullScreenLoader.stopLoading();

      showCompletionDialog();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

    // Build a checkbox widget
  Widget buildCheckbox(String label, RxBool value) {
    return Row(
      children: [
        AnimatedSwitcher(
          duration: const Duration(seconds: 2),
          child: value.value
              ? const Icon(CupertinoIcons.checkmark_alt_circle_fill,
                  color: Colors.blue)
              : const Icon(CupertinoIcons.checkmark_alt_circle),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text(label),
      ],
    );
  }

// Show completion dialog
  void showCompletionDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Congratulations'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            child: const Text('Go To Products'),
          ),
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(TImages.productsIllustration, height: 200, width: 200),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text('Congratulations',
                style: Theme.of(Get.context!).textTheme.headlineSmall),
            const SizedBox(height: TSizes.spaceBtwItems),
            const Text('Your Product has been Updated'),
          ],
        ),
      ),
    );
  }
}
