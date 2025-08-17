import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/validators/validation.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.symmetric(vertical:TSizes.lg, horizontal: TSizes.md),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Profile Details', style: Theme.of(context).textTheme.headlineSmall),

              const SizedBox(height: TSizes.spaceBtwSections),

              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'First Name',
                              label: Text('First Name'),
                              prefixIcon: Icon(Iconsax.user),
                              enabled: false,
                            ),
                            validator: (value) => TValidator.validateEmptyText('First Name', value),
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Last Name',
                              label: Text('Last Name'),
                               prefixIcon: Icon(Iconsax.user),
                            ),
                             validator: (value) => TValidator.validateEmptyText('Last Name', value),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: TSizes.spaceBtwInputFields),


                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              label: Text('Email'),
                               prefixIcon: Icon(Iconsax.forward),
                               enabled: false
                            ),
                             validator: (value) => TValidator.validateEmptyText('Email', value),
                          ),
                        ),

                         const SizedBox(width: TSizes.spaceBtwItems),

                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Phone Number',
                              label: Text('Phone Number'),
                               prefixIcon: Icon(Iconsax.mobile),
                            ),
                             validator: (value) => TValidator.validateEmptyText('Phone Number', value),
                          ),
                        ),
                      ],
                    )
                  ],
                )
                ),

                 const SizedBox(width: TSizes.spaceBtwSections),

                 SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: const Text('Update Profile'),),
                 ),
            ],
           )
           )
      ],
    );
  }
}
