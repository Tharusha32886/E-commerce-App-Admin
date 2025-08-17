import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/data/repositories/banners/banners_repository.dart';
import 'package:yt_ecommerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/media/models/image_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/banner/banner_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/banner_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/network_manager.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/loaders.dart';

class EditBannerController extends GetxController {
  static EditBannerController get instance => Get.find();

  final imageURL = ''.obs;
  final loading = false.obs;
  final isActive = false.obs;
  final targetScreen = ''.obs;
  final formKey = GlobalKey<FormState>();
  final repository = Get.put(BannerRepository());

  void init(BannerModel banner) {
    imageURL.value = banner.imageUrl;
    isActive.value = banner.active;
    targetScreen.value = banner.targetScreen;

  }

    void pickImage() async {
      final controller = Get.put(MediaController());
      List<ImageModel>? selectedImages =
          await controller.selectImagesFromMedia();

      if (selectedImages != null && selectedImages.isNotEmpty) {
        ImageModel selectedImage = selectedImages.first;
        imageURL.value = selectedImage.url;
      }
    }

    Future<void> updateBanner(BannerModel banner) async {
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

        if (banner.imageUrl != imageURL.value ||
            banner.targetScreen != targetScreen.value ||
            banner.active != isActive.value) {
          banner.imageUrl = imageURL.value;
          banner.targetScreen = targetScreen.value;
          banner.active = isActive.value;

          await repository.updateBanner(banner);
        }

        BannerController.instance.updateItemFromLists(banner);

        TFullScreenLoader.stopLoading();

        TLoaders.successSnackBar(
            title: 'Congratulations', message: 'Your Record has been updated');
      } catch (e) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    }
  }

