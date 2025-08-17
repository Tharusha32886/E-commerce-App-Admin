import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/controllers/user_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => NetworkManager(), fenix: true);
   Get.lazyPut(() => UserController(), fenix: true);
  }
}