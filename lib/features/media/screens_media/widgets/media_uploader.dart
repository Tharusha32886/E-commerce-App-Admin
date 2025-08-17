// ignore_for_file: avoid_print, deprecated_member_use
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/media/models/image_model.dart';
import 'package:yt_ecommerce_admin_panel/features/media/screens_media/widgets/folder_dropdown.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/device/device_utility.dart';

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
   final controller = MediaController.instance;
    return  Obx(
      () => controller.showImagesUploaderSection.value ? Column(
        children: [
          TRoundedContainer(
            height: 250,
            showBorder: true,
            borderColor: TColors.borderPrimary,
            backgroundColor: TColors.primaryBackground,
            padding: const EdgeInsets.all( TSizes.defaultSpace),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      DropzoneView(
    mime: const ['image/jpeg', 'image/png'],
    cursor: CursorType.Default,
    operation: DragOperation.copy,
    onCreated: (ctrl) => controller.dropzoneController = ctrl,
    onLoaded: () => print('Zone loaded'),
    onError: (ev) => print('Zone error: $ev'),
    onHover: () {
      print('Zone hovered');
    },
    onLeave: () {
      print('Zone left');
    },
    onDropFile: (DropzoneFileInterface ev) async {
      // Retrieve file data as Uint8List
      final bytes = await controller.dropzoneController.getFileData(ev);
      // Extract file metadata
      final filename = await controller.dropzoneController.getFilename(ev);
      final mimeType = await controller.dropzoneController.getFileMIME(ev);
      final image = ImageModel(
        url: '',
        folder: '',
        filename: filename,
        contentType: mimeType,
        localImageToDisplay: Uint8List.fromList(bytes),
      );
      controller.selectedImagesToUpload.add(image);
    },
    onDropInvalid: (ev) => print('Zone invalid MIME: $ev'),
    onDropFiles: (ev) async {
      print('Zone drop multiple: $ev');
    },
  ),
      
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(TImages.defaultMultiImageIcon, height: 50, width: 50,),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          const Text('Drag and Drop images here'),
                           const SizedBox(height: TSizes.spaceBtwItems),
                          OutlinedButton(onPressed: () => controller.selectLocalImages(), child: const Text('Select Images')),
                        ],
                      )
                    ],
                  )
                  )
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
      
      
          // locally selected image
          if(controller.selectedImagesToUpload.isNotEmpty)
          TRoundedContainer(
          child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
          // folders dropdown
           Row(
            children: [
              Text('Select Folder',style: Theme.of(context).textTheme.headlineSmall,),
              const SizedBox(width: TSizes.spaceBtwItems),
               MediaFolderDropdown(onChanged: (MediaCategory? newValue) {
                if (newValue != null) {
                  controller.selectedPath.value = newValue;
                }
               }),
           
            ],),
      
            Row(
              children: [
                TextButton(onPressed: () => controller.selectedImagesToUpload.clear(), child: const Text('Remove All')),
                const SizedBox(width: TSizes.spaceBtwItems),
      
                TDeviceUtils.isMobileScreen(context)
                 ? const SizedBox.shrink() 
                 : SizedBox(width: TSizes.buttonWidth, child: ElevatedButton(
                  onPressed: () => controller.uploadImagesConfirmation(),
                   child: const Text('Upload'),),)
              ],
            ),
      
            ],
       ),
       const SizedBox(height: TSizes.spaceBtwSections),
      
        Wrap(
        alignment: WrapAlignment.start,
        spacing: TSizes.spaceBtwItems / 2,
        runSpacing: TSizes.spaceBtwItems / 2,
        children: controller.selectedImagesToUpload
        .where((image) => image.localImageToDisplay != null)
        .map((element) => TRoundedImage(
          width: 90, 
          height: 90,
          padding: TSizes.sm,
          imageType: ImageType.memory,
          memoryImage: element.localImageToDisplay,
          backgroundColor: TColors.primaryBackground,
          )).toList(),
       ),
      

      // upload for mobile
       const SizedBox(width: TSizes.spaceBtwSections),
       TDeviceUtils.isMobileScreen(context)
       ? SizedBox(width: double.infinity,
       child: ElevatedButton(
        onPressed: () => controller.uploadImagesConfirmation(),
         child: const Text('Upload'),),)
       : const SizedBox.shrink(),
      ],
            )
            
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      )
      : const SizedBox.shrink(),
    );
  }
}