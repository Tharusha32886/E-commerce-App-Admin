import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/image_uploader.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProductAdditionalImages extends StatelessWidget {
  const ProductAdditionalImages(
      {super.key,
      required this.additionalProductImagesUrls,
      this.onTapToAddImages,
      this.onTapToRemoveImage});

  final RxList<String> additionalProductImagesUrls;
  final void Function()? onTapToAddImages;
  final void Function(int index)? onTapToRemoveImage;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 300,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: onTapToAddImages,
                    child: TRoundedContainer(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(TImages.defaultMultiImageIcon,
                                width: 50, height: 50),
                            const Text('Add Additional Images'),
                          ],
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                        height: 80, child: _uploadedImagesOrEmptyList()),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems / 2),

                  //add more
                  TRoundedContainer(
                    width: 80,
                    height: 80,
                    showBorder: true,
                    borderColor: TColors.white,
                    onTap: onTapToAddImages,
                    child: const Center(
                      child: Icon(Iconsax.add),
                    ),
                  )
                ],
              ))
            ],
          ),
        ));
  }

  Widget _uploadedImagesOrEmptyList() {
    return additionalProductImagesUrls.isNotEmpty
        ? _uploadedImages()
        : emptyList();
  }

  Widget emptyList() {
    return ListView.separated(
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) =>
          const SizedBox(width: TSizes.spaceBtwItems / 2),
      itemBuilder: (context, index) => const TRoundedContainer(
        backgroundColor: TColors.primaryBackground,
        width: 80,
        height: 80,
      ),
    );
  }

  ListView _uploadedImages() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: additionalProductImagesUrls.length,
      separatorBuilder: (context, index) =>
          const SizedBox(width: TSizes.spaceBtwItems / 2),
      itemBuilder: (context, index) {
        final image = additionalProductImagesUrls[index];
        return TImageUploader(
          top: 0,
          right: 0,
          width: 80,
          height: 80,
          left: null,
          bottom: null,
          image: image,
          icon: Iconsax.trash,
          imageType: ImageType.network,
          onIconButtonPressed: () => onTapToRemoveImage!(index),
        );
      },
    );
  }
}
