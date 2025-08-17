import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/order_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/helper_functions.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[].obs;
  final RxMap<OrderStatus, int> orderStatusData = <OrderStatus, int>{}.obs;
  final RxMap<OrderStatus, double> totalAmounts = <OrderStatus, double>{}.obs;

  // orders
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      status: OrderStatus.processing,
      totalAmount: 265,
      orderDate: DateTime(2025, 7, 10),
      deliveryDate: DateTime(2025, 7, 10), items: [],
    ),
    OrderModel(
      id: 'CWT0025',
      status: OrderStatus.shipped,
      totalAmount: 365,
      orderDate: DateTime(2025, 7, 6),
      deliveryDate: DateTime(2025, 7, 6),
    ),
    OrderModel(
      id: 'CWT0026',
      status: OrderStatus.delivered,
      totalAmount: 270,
      orderDate: DateTime(2025, 7, 5),
      deliveryDate: DateTime(2025, 7, 5),
    ),
    OrderModel(
      id: 'CWT0016',
      status: OrderStatus.delivered,
      totalAmount: 295,
      orderDate: DateTime(2025, 7, 8),
      deliveryDate: DateTime(2025, 7, 8),
    ),
    OrderModel(
      id: 'CWT0017',
      status: OrderStatus.delivered,
      totalAmount: 165,
      orderDate: DateTime(2025, 7, 11),
      deliveryDate: DateTime(2025, 7, 11),
    )
  ];

  @override
  void onInit() {
    _calculateWeeklySales();
    _calculateOrderStatusData();
    super.onInit();
  }

  // calculate weekly sales
  void _calculateWeeklySales() {
    // reset
    weeklySales.value = List<double>.filled(7, 0.0);

    for (var order in orders) {
      final DateTime orderWeekStart =
          THelperFunctions.getStartOfWeek(order.orderDate);

      // chechk if the order is within the currunt week
      if (orderWeekStart.isBefore(DateTime.now()) &&
          orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate.weekday - 1) % 7;

        // ensure the index is non negative
        index = index < 0 ? index + 7 : index;

        weeklySales[index] += order.totalAmount;

        // ignore: avoid_print
        print(
            'Order Date: ${order.orderDate}, CurrentWeekDay: $orderWeekStart, Index: $index');
      }
    }

    // ignore: avoid_print
    print('Weekly Sales: $weeklySales');
  }

  // calculate order status data
  void _calculateOrderStatusData() {
    orderStatusData.clear();
    totalAmounts.value = {for (var status in OrderStatus.values) status: 0.0};


    for (var order in orders) {

      final status = order.status;
      orderStatusData[status] = (orderStatusData[status] ?? 0) + 1;
      totalAmounts[status] = (totalAmounts[status] ?? 0) + order.totalAmount;
    }
  }

  String getDisplayStatusName(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
        case OrderStatus.cancelled:
        return 'Cancelled';
      // ignore: unreachable_switch_default
      default:
        return 'Unknown';
    }
  }
}
