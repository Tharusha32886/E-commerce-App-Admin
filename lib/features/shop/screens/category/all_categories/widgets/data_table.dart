import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/data_table/paginated_data_table.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/all_categories/table/table_source.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return TPaginatedDataTable(
      minWidth: 700,
      columns: const [
        DataColumn2(label: Text('category')),
        DataColumn2(label: Text('category')),
        DataColumn2(label: Text('category')),
        DataColumn2(label: Text('category')),
        DataColumn2(label: Text('category')),
      ],
      source: CategoryRows(),
    );
  }
}
