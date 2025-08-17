import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/models/user_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/customer/customer_detail/widgets/customer_info.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/customer/customer_detail/widgets/customer_orders.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/customer/customer_detail/widgets/shipping_address.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class CustomerDetailDesktopScreen extends StatelessWidget {
  const CustomerDetailDesktopScreen({super.key, required this.customer});

  final UserModel customer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
            const  TBreadcrumbWithHeading(
              returnToPreviousScreen: true,
                  heading: 'Customers',
                   breadcrumbItems: [TRoutes.customers,'Customers']),
            const  SizedBox(height: TSizes.spaceBtwSections),


              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CustomerInfo(customer: customer),
                        const SizedBox(height: TSizes.spaceBtwSections),


                        const ShippingAddress(),
                      ],
                    ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwSections),

                    const Expanded(flex:2,child: CustomerOrders())

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
