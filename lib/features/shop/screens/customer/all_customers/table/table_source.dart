import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/icons/table_action_icon_buttons.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/models/user_model.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class CustomerRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [
      DataCell(Row(
        children: [
          const TRoundedImage(
            width: 50,
            height: 50,
            padding: TSizes.sm,
            image: TImages.defaultImage,
            imageType: ImageType.network,
            borderRadius: TSizes.borderRadiusMd,
            backgroundColor: TColors.primaryBackground,
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          Expanded(
              child: Text(
            'Customer',
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .apply(color: TColors.primary),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ))
        ],
      )),
      const DataCell(Text('test@gmail.com')),
      const DataCell(Text('+94 123456789')),
      DataCell(Text(DateTime.now().toString())),
      DataCell(
        TTableActionButtons(
          view: true,
          edit: false,
          onEditPressed: () => Get.toNamed(TRoutes.customerDetails,
              arguments: UserModel.empty()),
          onDeletePressed: () {},
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 10;

  @override
  int get selectedRowCount => 0;
}
