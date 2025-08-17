import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/data/repositories/brands/brand_repository.dart';
import 'package:yt_ecommerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/media/models/image_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/brand/brand_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/brand_category_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/brand_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/category_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/network_manager.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/loaders.dart';

class CreateBrandController extends GetxController {
  static CreateBrandController get instance => Get.find();

  final loading = false.obs;
  RxString imageURL = ''.obs;
  final isFeatured = false.obs;
  final name = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final List<CategoryModel> selectedCategories = <CategoryModel>[].obs;

  void toggleSelection(CategoryModel category) {

      if (selectedCategories.contains(category)) {
       selectedCategories.remove(category);
        
      } else {
        selectedCategories.add(category);
      }
      }

      void resetFields()  {
        name.clear();
        loading(false);
        isFeatured(false);
        imageURL.value = '';
        selectedCategories.clear();
      }


  void pickImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      ImageModel selectedImage = selectedImages.first;
      imageURL.value = selectedImage.url;
    }
  }

  Future<void> createBrand () async {
    try {
      TFullScreenLoader.popUpCircular();

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!formKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final newRecord = BrandModel(
        id: '',
        productsCount: 0,
        name: name.text.trim(),
        image: imageURL.value,
        createdAt: DateTime.now(),
        isFeatured: isFeatured.value,
      
      );

      newRecord.id =
          await BrandRepository.instance.createBrand(newRecord);

     if (selectedCategories.isNotEmpty) {
      if(newRecord.id.isEmpty) throw 'Error storing relational data. Try agaian';

      for (var category in selectedCategories) {
        final brandCategory = BrandCategoryModel(brandId: newRecord.id, categoryId: category.id);
        await BrandRepository.instance.createBrandCategory(brandCategory);
      }

      newRecord.brandCategories ??= [];
      newRecord.brandCategories!.addAll(selectedCategories);
     }

     BrandController.instance.addItemToLists(newRecord);

     resetFields();
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'New Record has been added');
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

    }

