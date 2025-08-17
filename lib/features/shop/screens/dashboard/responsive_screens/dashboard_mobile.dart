import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/table/data_table.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/widgets/order_status_graph.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/widgets/weekly_sales.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class DashboadMobileScreen extends StatelessWidget {
  const DashboadMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // heading
              Text('Dashboard',style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: TSizes.spaceBtwSections),

              // cards
               const TDashboardCard(title: 'Sales total', subTitle: '\$365.6', status: 25,),
               const SizedBox(height: TSizes.spaceBtwItems),
               const TDashboardCard(title: 'Average Order Value', subTitle: '\$25', status: 15),
               const SizedBox(height: TSizes.spaceBtwItems),
               const TDashboardCard(title: 'Total Orders', subTitle: '36', status: 244),
                const SizedBox(height: TSizes.spaceBtwItems),
               const TDashboardCard(title: 'Visitors', subTitle: '25,876', status: 2),

                const SizedBox(height: TSizes.spaceBtwSections),

              // bar graph
              const TWeeklySalesGraph(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // orders
                        TRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Recent Orders',style: Theme.of(context).textTheme.headlineSmall,),
                              const SizedBox(height: TSizes.spaceBtwSections),
                              const DashboardOrderTable(),
                            ],
                          ),
                        ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // pie chart
              const OrderStatusPieChart(),
                 
                  
            ],
          ),
        ),
      ),
    );
  }
}