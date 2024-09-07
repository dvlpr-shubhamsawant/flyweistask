import 'package:ecommerce_seller/presentation/main_section/home_screen/top_products/controller/cart_controller.dart';
import 'package:ecommerce_seller/presentation/main_section/home_screen/top_products/controller/product_controller.dart';
import 'package:ecommerce_seller/presentation/on_boarding_section/splash_screen/splash_screen.dart';
import 'package:ecommerce_seller/utilz/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final logger = Logger();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductController()),
          ChangeNotifierProvider(create: (_) => CartController()),
        ],
        child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: backGroundColor,
            appBarTheme: const AppBarTheme()
                .copyWith(color: Colors.white, surfaceTintColor: Colors.white),
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SplashScreen(),
        ),
      );
    });
  }
}
