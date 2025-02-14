// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce_seller/controllers/user_controller.dart';
import 'package:ecommerce_seller/presentation/main_section/bottom_navigation/bottom_navigation_screen.dart';
import 'package:ecommerce_seller/presentation/main_section/home_screen/home_screen.dart';
import 'package:ecommerce_seller/presentation/main_section/home_screen/top_products/controller/cart_controller.dart';
import 'package:ecommerce_seller/presentation/on_boarding_section/walk_through/walk_through.dart';
import 'package:ecommerce_seller/requests/cart_requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main_section/home_screen/top_products/controller/product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    loginScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // profile.getCurrentLoactioLatAndLot(context);
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: 160,
          height: 160,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Center(
            child: Image.asset(
              "assets/images/Group 3.png",
              fit: BoxFit.fill,
              // style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      )),
    );
  }

  loginScreen() async {
    Future.delayed(const Duration(seconds: 3), () async {
      await ProductController().fetchAllProducts();
      CartController().fetchAllCartProducts();
      CartController().getAllCoupons();
      AppUser().isLogin
          ? Get.to(() => BottomNavigation())
          : Get.to(() => WalkThroughScreen());
    });
  }
}
