import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/order_model.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/order/orders_detail/widgets/customer_info.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/order/orders_detail/widgets/order_info.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/order/orders_detail/widgets/order_items.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/order/orders_detail/widgets/order_transaction.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class OrderDetailDesktopScreen extends StatelessWidget {
  const OrderDetailDesktopScreen({super.key,  required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                  heading:order.id, breadcrumbItems: const [TRoutes.orders, 'Details']),
              const SizedBox(height: TSizes.spaceBtwSections),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      OrderInfo(order: order),
                     const SizedBox(height: TSizes.spaceBtwSections),

                        OrderItems(order: order),
                          const SizedBox(height: TSizes.spaceBtwSections),

                          OrderTransaction(order: order),
                    ],
                  ),
                ),
                  const SizedBox(width: TSizes.spaceBtwSections),

                    Expanded(
                 
                  child: Column(
                    children: [
                      OrderCustomer(order: order),
                     const SizedBox(height: TSizes.spaceBtwSections),

                       
                    ],
                  ),
                ),
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}
