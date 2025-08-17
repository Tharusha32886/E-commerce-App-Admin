import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/product/product_images_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/table/data_table.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/widgets/order_status_graph.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/widgets/weekly_sales.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductImagesController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // heading
              Text('Dashboard',
                  style: Theme.of(context).textTheme.headlineLarge),
              ElevatedButton(
                  onPressed: () => controller.selectThumbnailImage(),
                  child: const Text('Select Single Image')),
              const SizedBox(height: TSizes.spaceBtwSections),
              ElevatedButton(
                  onPressed: () => controller.selectMultipleProductImages(),
                  child: const Text('Select Multiple Images')),
              const SizedBox(height: TSizes.spaceBtwSections),

              // cards
              const Row(
                children: [
                  Expanded(
                      child: TDashboardCard(
                    title: 'Sales total',
                    subTitle: '\$365.6',
                    status: 25,
                  )),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                      child: TDashboardCard(
                          title: 'Average Order Value',
                          subTitle: '\$25',
                          status: 15)),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                      child: TDashboardCard(
                          title: 'Total Orders', subTitle: '36', status: 244)),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                      child: TDashboardCard(
                          title: 'Visitors', subTitle: '25,876', status: 2)),
                  SizedBox(width: TSizes.spaceBtwItems),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // graphs
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        // bar graph
                        const TWeeklySalesGraph(),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // orders
                        TRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recent Orders',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: TSizes.spaceBtwSections),
                              const DashboardOrderTable(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwSections),

                  // pie chart
                  const Expanded(child: OrderStatusPieChart()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
