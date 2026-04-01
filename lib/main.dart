import 'package:ecommerce_route/core/config/di.dart';
import 'package:ecommerce_route/core/utils/app_routes.dart';
import 'package:ecommerce_route/core/utils/app_theme.dart';
import 'package:ecommerce_route/core/utils/my_bloc_observer.dart';
import 'package:ecommerce_route/features/ui/auth/login/login_screen.dart';
import 'package:ecommerce_route/features/ui/auth/register/register_screen.dart';
import 'package:ecommerce_route/features/ui/pages/cart_screen/cart_screen.dart';
import 'package:ecommerce_route/features/ui/pages/home_screen/home_screen.dart';
import 'package:ecommerce_route/features/ui/pages/product_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.homeRoute,
          routes: {
            AppRoutes.loginRoute: (context) => LoginScreen(),
            AppRoutes.registerRoute: (context) => RegisterScreen(),
            AppRoutes.homeRoute: (context) => const HomeScreen(),
            AppRoutes.cartRoute: (context) => const CartScreen(),
            AppRoutes.productRoute: (context) => ProductDetailsScreen(
              
            ),
          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}