import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:yt_ecommerce_admin_panel/features/media/screens_media/media.dart';
import 'package:yt_ecommerce_admin_panel/features/personalization/screens/profile/profile.dart';
import 'package:yt_ecommerce_admin_panel/features/personalization/screens/settings/settings.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/all_banners/banners.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/create_banner/create_banner.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/banner/edit_banner/edit_banner.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/all_brands/brands.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/create_brand/create_brand.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/brand/edit_brand/edit_brand.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/all_categories/categories.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/create_category/create_category.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/category/edit_category/edit_category.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/customer/all_customers/customers.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/customer/customer_detail/customer.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/dashboard.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/forget_password/forget_password.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/login/login.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/reset_password/reset_password.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/order/all_orders/orders.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/order/orders_detail/order_detail.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/all_products/products.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/create_product/create_product.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/product/edit_product/edit_product.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes_middleware.dart';


class TAppRoute {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.login, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: TRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    GetPage(name: TRoutes.dashboard, page: () => const DashboardScreen(), middlewares: [TRoutesMiddleware()]),
   GetPage(name: TRoutes.media, page: () => const MediaScreen(), middlewares: [TRoutesMiddleware()]),


   // categories routes
    GetPage(name: TRoutes.categories, page: () => const CategoriesScreen(), middlewares: [TRoutesMiddleware()]),
    GetPage(name: TRoutes.createCategory, page: () => const CreateCategoryScreen(), middlewares: [TRoutesMiddleware()]),
    GetPage(name: TRoutes.editCategory, page: () => const EditCategoryScreen(), middlewares: [TRoutesMiddleware()]),

    // brands routes
    GetPage(name: TRoutes.brands, page: () => const BrandsScreen(), middlewares: [TRoutesMiddleware()]),
    GetPage(name: TRoutes.createBrand, page: () => const CreateBrandScreen(), middlewares: [TRoutesMiddleware()]),
    GetPage(name: TRoutes.editBrand, page: () => const EditBrandScreen(), middlewares: [TRoutesMiddleware()]),


    // banners routes
    GetPage(name: TRoutes.banners, page: () => const BannersScreen(), middlewares: [TRoutesMiddleware()]),
    GetPage(name: TRoutes.createBanner, page: () => const CreateBannerScreen(), middlewares: [TRoutesMiddleware()]),
    GetPage(name: TRoutes.editBanner, page: () => const EditBannerScreen(), middlewares: [TRoutesMiddleware()]),

    // products routes
    GetPage(name: TRoutes.products, page: () => const ProductsScreen(), middlewares: [TRoutesMiddleware()]),
    GetPage(name: TRoutes.createProduct, page: () => const CreateProductScreen(), middlewares: [TRoutesMiddleware()]),
    GetPage(name: TRoutes.editProduct, page: () => const EditProductScreen(), middlewares: [TRoutesMiddleware()]),  

    // customers routes
     GetPage(name: TRoutes.customers, page: () => const CustomersScreen(), middlewares: [TRoutesMiddleware()]),
    GetPage(name: TRoutes.customerDetails, page: () => const CustomerDetailScreen(), middlewares: [TRoutesMiddleware()]),

    // orders 
     GetPage(name: TRoutes.orders, page: () => const OrdersScreen(), middlewares: [TRoutesMiddleware()]),
    GetPage(name: TRoutes.orderDetails, page: () => const OrderDetailScreen(), middlewares: [TRoutesMiddleware()]),

      GetPage(name: TRoutes.settings, page: () => const SettingsScreen(), middlewares: [TRoutesMiddleware()]),
    GetPage(name: TRoutes.pofile, page: () => const ProfileScreen(), middlewares: [TRoutesMiddleware()]),
  
   

    
  ];
}
