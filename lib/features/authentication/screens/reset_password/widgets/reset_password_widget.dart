import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/text_strings.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({
    super.key,
   
  });

  

  @override
  Widget build(BuildContext context) {
    final email = Get.parameters['email'] ?? '';
    return Column(
      children: [
        // header
        Row(
          children: [
            IconButton(onPressed: () => Get.offAllNamed(TRoutes.login), icon: const Icon(CupertinoIcons.clear)),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
    
    
        // image
        const Image(width: 300,height: 300, image: AssetImage(TImages.deliveredEmailIllustration)),
        const SizedBox(height: TSizes.spaceBtwItems),
    
    
        // title
        Text(TTexts.changeYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(email, textAlign: TextAlign.center,style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(TTexts.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
    
        const SizedBox(height: TSizes.spaceBtwSections),
    
    
        // buttons
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () => Get.offAllNamed(TRoutes.login), child: const Text(TTexts.done)),
        ),
    
        const SizedBox(height: TSizes.spaceBtwItems),
    
         SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () => Get.back(), child: const Text(TTexts.resendEmail)),
        ),
      ],
    );
  }
}