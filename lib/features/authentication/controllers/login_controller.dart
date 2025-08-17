import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yt_ecommerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:yt_ecommerce_admin_panel/data/repositories/user/user_repository.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/controllers/user_controller.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/models/user_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/network_manager.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {

      //start loading
      TFullScreenLoader.openLoadingDialog(
          'Loggin you in...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
       TFullScreenLoader.stopLoading();
           return;
    }

    // save data iif remember is selected
    if (rememberMe.value) {
      localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
    } 

    await AuthenticationRepository.instance.loginWithEmailAndPassword(
      email.text.trim(),
      password.text.trim(),
    );

    final user = await UserController.instance.fetchUserDetails();

    TFullScreenLoader.stopLoading();

    // if user is not admin logut and return
    if (user.role != AppRole.admin) {
      await AuthenticationRepository.instance.logout();
      TLoaders.errorSnackBar(
          title: 'Not Authorized', message: 'You are not an authorized or do have access. Contact Admin');
      
    } else {
      AuthenticationRepository.instance.screenRedirect();
    }
  }  catch (e) {
    TFullScreenLoader.stopLoading();
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
   }
  }

  Future<void> registerAdmin() async {
   try {

    //sart loading
    TFullScreenLoader.openLoadingDialog(
        'Registering Admin Account', TImages.docerAnimation);

    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }

    await AuthenticationRepository.instance.registerWithEmailAndPassword(
      TTexts.adminEmail,
      TTexts.adminPassword,
    );
    final userRepository = Get.put(UserRepository());
    await userRepository.createUser(
      UserModel(
        id: AuthenticationRepository.instance.authUser!.uid,
        firstName: 'ATE',
        lastName: 'Admin',
        email: TTexts.adminEmail,
        role: AppRole.admin,
        createdAt: DateTime.now(),
      ),
    );
    TFullScreenLoader.stopLoading();

    AuthenticationRepository.instance.screenRedirect();

   } catch (e) {
    TFullScreenLoader.stopLoading();
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
   }
  }
}


