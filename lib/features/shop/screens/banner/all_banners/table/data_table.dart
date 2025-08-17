import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/data_table/paginated_data_table.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/controllers/banner/banner_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/all_banners/table/table_source.dart';

class BannersTable extends StatelessWidget {
  const BannersTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
     
       Text(controller.filteredItems.length.toString());
       Text(controller.selectedRows.length.toString());

      return TPaginatedDataTable(
        minWidth: 700,
        tableHeight: 900,
        dataRowHeight: 110,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        columns: const [
          DataColumn2(label: Text('Banner')),
          DataColumn2(label: Text('Redirect Screen')),
          DataColumn2(label: Text('Active')),
          DataColumn2(label: Text('Action'), fixedWidth: 100),
        ],
        source: BannerRows(),
      
      );
    });
  }
}
