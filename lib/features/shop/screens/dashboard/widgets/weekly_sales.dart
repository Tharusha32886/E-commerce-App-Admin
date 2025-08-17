import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/dashboard/dashboard_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/device/device_utility.dart';

class TWeeklySalesGraph extends StatelessWidget {
  const TWeeklySalesGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Weekly Sales',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwSections),

          // graph
          SizedBox(
            height: 400,
            child: BarChart(
              BarChartData(
                titlesData: buildFlTitlesData(),
                borderData: FlBorderData(
                    show: true,
                    border: const Border(
                        top: BorderSide.none, right: BorderSide.none)),
                gridData: const FlGridData(
                  show: false,
                  drawHorizontalLine: true,
                  drawVerticalLine: false,
                  horizontalInterval: 200,
                ),
                barGroups: controller.weeklySales
                    .asMap()
                    .entries
                    .map(
                      (entry) => BarChartGroupData(
                        x: entry.key,
                        barRods: [
                          BarChartRodData(
                            toY: entry.value,
                            color: TColors.primary,
                            borderRadius: BorderRadius.circular(TSizes.sm),
                          ),
                        ],
                      ),
                    )
                    .toList(),
                groupsSpace: TSizes.spaceBtwItems,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) => TColors.secondary),
                  touchCallback: TDeviceUtils.isDesktopScreen(context)
                      ? (barTouchEvent, barTouchResponse) {}
                      : null,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

 FlTitlesData buildFlTitlesData() {
    return FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            // days
            final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

            // calculate the index
            final index = value.toInt() % days.length;

            //get the day
            final day = days[index];

          return SideTitleWidget(meta: meta,space: 0, child: Text(day));
          },
        ),
        ),

        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: true,interval: 200, reservedSize: 50)),
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        );
  }

