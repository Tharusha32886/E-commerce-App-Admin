import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/data_table/table_header.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/customer/all_customers/table/data_table.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class CustomersDesktopScreen extends StatelessWidget {
  const CustomersDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBreadcrumbWithHeading(
                  heading: 'Customers', breadcrumbItems: ['Customers']),
              SizedBox(height: TSizes.spaceBtwSections),
              
                 TRoundedContainer(
                  child: Column(
                    children: [
                      TTableHeader(showLeftWidget: false),
                      SizedBox(height: TSizes.spaceBtwItems),


                      CustomerTable(),
                    ],
                  ),
                )
              
            ],
          ),
        ),
      ),
    );
  }
}
