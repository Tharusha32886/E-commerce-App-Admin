import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/banner/create_banner_controller.dart';
import 'package:yt_ecommerce_admin_panel/routes/app_screens.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class CreateBannersForm extends StatelessWidget {
  const CreateBannersForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateBannerController());
    return TRoundedContainer(
        width: 500,
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: TSizes.sm),
              Text('Create New Banner',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),
              Column(
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () => controller.pickImage(),
                      child: TRoundedImage(
                        width: 400,
                        height: 200,
                        backgroundColor: TColors.primaryBackground,
                        image: controller.imageURL.value.isNotEmpty
                            ? controller.imageURL.value
                            : TImages.defaultImage,
                        imageType: controller.imageURL.value.isNotEmpty
                            ? ImageType.network
                            : ImageType.asset,
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TextButton(
                      onPressed: () => controller.pickImage(),
                      child: const Text('Select Image')),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Text('Make your Banner Active or InActive',
                  style: Theme.of(context).textTheme.bodyMedium),
              Obx(
                () => CheckboxMenuButton(
                    value: controller.isActive.value,
                    onChanged: (value) =>
                        controller.isActive.value = value ?? false,
                    child: const Text('Active')),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Obx(() {
                return DropdownButton<String>(
                  value: controller.targetScreen.value,
                  onChanged: (String? newValue) =>
                      controller.targetScreen.value = newValue!,
                  items: AppScreens.allAppScreenItems
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                );
              }),
              const SizedBox(height: TSizes.spaceBtwInputFields * 2),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.createBanner(),
                  child: const Text('Create'),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields * 2),
            ],
          ),
        ));
  }
}
