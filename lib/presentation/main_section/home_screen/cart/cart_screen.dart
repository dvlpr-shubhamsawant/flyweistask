import 'package:ecommerce_seller/presentation/main_section/home_screen/cart/payment/payment_screen.dart';
import 'package:ecommerce_seller/presentation/main_section/home_screen/top_products/controller/cart_controller.dart';
import 'package:ecommerce_seller/presentation/main_section/notification/notification_screen.dart';
import 'package:ecommerce_seller/presentation/main_section/search_screen/search_screen.dart';
import 'package:ecommerce_seller/presentation/widgets/bottomsheet_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utilz/colors.dart';
import '../../../../utilz/sized_box.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  TextEditingController sizeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Adaptive.h(20),
              width: Adaptive.w(100),
              color: chatColor,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // sizedBoxHeight50,
                  sizedBoxHeight50,
                  Row(
                    children: [
                      sizedBoxWidth40,
                      // Image.asset('assets/images/home_screen_logo.png',color: grey,),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 17.sp,
                          )),
                      Text(
                        'My Cart',
                        style: GoogleFonts.poppins(
                            fontSize: 18.px, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            Get.to(() => const NotificationScreen());
                          },
                          child: Image.asset('assets/images/appbar1.png')),
                      sizedBoxWidth30,
                      GestureDetector(
                        onTap: () {
                          showCustomBottomSheet(context);
                        },
                        child: Image.asset('assets/images/appbar2.png'),
                      ),
                      sizedBoxWidth30,
                      Consumer<CartController>(
                          builder: (context, controller, _) {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Confirm Deletion"),
                                  content: Text(
                                      "Are you sure you want to delete all items from the cart? This action cannot be undone."),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text("Cancel"),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                    ),
                                    ElevatedButton(
                                      child: Text("Delete All"),
                                      onPressed: () async {
                                        // Add your delete all cart items logic here
                                        await controller
                                            .deleteCartAllProducts();
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .red, // Make the button color red for warning
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Icon(Icons.delete),
                        );
                      }),
                      sizedBoxWidth30,
                      // Image.asset('assets/images/carbon_delivery.png'),
                      // sizedBoxWidth40,
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SearchScreen());
                    },
                    child: Container(
                      height: Adaptive.h(6),
                      width: Adaptive.w(90),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Search your products...',
                            style: GoogleFonts.poppins(
                                color: grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.px),
                          ),
                          Spacer(),
                          Icon(
                            Icons.search,
                            color: buttonColor,
                          ),
                          sizedBoxWidth20,
                          Container(
                            height: Adaptive.h(2),
                            width: Adaptive.w(0.4),
                            color: grey,
                          ),
                          sizedBoxWidth20,
                          Image.asset('assets/images/home2.png'),
                          sizedBoxWidth15
                        ],
                      ),
                    ),
                  ),
                  sizedBoxHeight20,
                ],
              ),
            ),
            sizedBoxHeight20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: 'Deliver to :',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12.px,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff838383))),
                                TextSpan(
                                    text: 'Jay Kumar... 411045',
                                    style: GoogleFonts.poppins(
                                        fontSize: 13.px,
                                        fontWeight: FontWeight.w500,
                                        color: black)),
                              ])),
                              sizedBoxWidth10,
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xffF2F2F2)),
                                child: Text('Home',
                                    style: GoogleFonts.poppins(
                                        fontSize: 11.px,
                                        fontWeight: FontWeight.w400,
                                        color: black)),
                              )
                            ],
                          ),
                          Text('Q.No. Room number 201, Epic, Vishal...',
                              style: GoogleFonts.poppins(
                                  fontSize: 12.px,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff838383)))
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: Adaptive.h(6),
                        // width: Adaptive.w(45),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.sp),
                          border: Border.all(
                            color: buttonColor,
                          ),
                          color: whiteColor,
                        ),
                        child: Center(
                          child: Text(
                            'Change',
                            style: GoogleFonts.poppins(
                                fontSize: 13.px,
                                color: buttonColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Available Coupons"),
                  Consumer<CartController>(builder: (context, controller, _) {
                    return controller.coupons?.data?.length == 0
                        ? SizedBox()
                        : GestureDetector(
                            onTap: () async {
                              controller.iscouponApply == true
                                  ? await controller.removeCoupon()
                                  : await controller.applyCoupon(
                                      controller.coupons!.data![0].code!);
                              controller.updatecoupon =
                                  !controller.iscouponApply;
                            },
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: controller.iscouponApply == true
                                      ? Colors.green
                                      : Colors.white,
                                  border: Border.all(
                                    color: controller.iscouponApply == true
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                "${controller.coupons!.data![0].code}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                  }),
                  Consumer<CartController>(
                    builder: (context, controller, _) {
                      return SizedBox(
                        child: controller.isCartProductLoading == true
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : controller.cartProducts?.data?.products?.length ==
                                    0
                                ? Center(
                                    child: Text("Cart is Empty"),
                                  )
                                : ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) =>
                                        sizedBoxHeight20,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: grey.withOpacity(0.2))),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image.network(
                                                      '${controller.cartProducts!.data!.products![index].product!.image![0].url}',
                                                      scale: 1.5,
                                                    ),
                                                    sizedBoxHeight10,
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            controller.updateQuantity(
                                                                controller
                                                                    .cartProducts!
                                                                    .data!
                                                                    .products![
                                                                        index]
                                                                    .product!
                                                                    .id!,
                                                                controller
                                                                        .cartProducts!
                                                                        .data!
                                                                        .products![
                                                                            index]
                                                                        .quantity -
                                                                    1);
                                                          },
                                                          child: Image.asset(
                                                              'assets/images/cartdic.png'),
                                                        ),
                                                        sizedBoxWidth20,
                                                        Text(
                                                          '${controller.cartProducts!.data!.products![index].quantity}',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      14.px),
                                                        ),
                                                        sizedBoxWidth20,
                                                        GestureDetector(
                                                          onTap: () {
                                                            controller.updateQuantity(
                                                                controller
                                                                    .cartProducts!
                                                                    .data!
                                                                    .products![
                                                                        index]
                                                                    .product!
                                                                    .id!,
                                                                controller
                                                                        .cartProducts!
                                                                        .data!
                                                                        .products![
                                                                            index]
                                                                        .quantity +
                                                                    1);
                                                          },
                                                          child: Image.asset(
                                                              'assets/images/cartincr.png'),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${controller.cartProducts!.data!.products![index].product!.productName}',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 13.px),
                                                    ),
                                                    sizedBoxHeight10,
                                                    GestureDetector(
                                                      onTap: () {
                                                        sizeController.text =
                                                            controller
                                                                .cartProducts!
                                                                .data!
                                                                .products![
                                                                    index]
                                                                .size!;
                                                        quantityController
                                                                .text =
                                                            controller
                                                                .cartProducts!
                                                                .data!
                                                                .products![
                                                                    index]
                                                                .quantity!
                                                                .toString();
                                                        showModalBottomSheet(
                                                            context: context,
                                                            builder: (context) {
                                                              return SizedBox(
                                                                height: 300,
                                                                width: double
                                                                    .infinity,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          14.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Text(
                                                                        "Update Product Size",
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            sizeController,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          label:
                                                                              Text(
                                                                            "Size",
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            quantityController,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          label:
                                                                              Text(
                                                                            "Quantity",
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      FilledButton(
                                                                        onPressed:
                                                                            () async {
                                                                          if (controller
                                                                              .cartProducts!
                                                                              .data!
                                                                              .products![index]
                                                                              .product!
                                                                              .id!
                                                                              .isNotEmpty) {
                                                                            await controller.updateProduct(
                                                                              controller.cartProducts!.data!.products![index].product!.id!,
                                                                              int.parse(quantityController.text),
                                                                              sizeController.text,
                                                                            );
                                                                          } else {
                                                                            VxToast.show(context,
                                                                                msg: "Id Not Found");
                                                                          }
                                                                          Get.back();
                                                                        },
                                                                        child: Text(
                                                                            "Update Product Detail"),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                      },
                                                      child: Row(
                                                        // mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          VxRating(
                                                            size: Adaptive.h(2),
                                                            count: 5,
                                                            isSelectable: false,
                                                            selectionColor:
                                                                buttonColor,
                                                            onRatingUpdate:
                                                                (value) {},
                                                          ),
                                                          Text(
                                                            '56890',
                                                            style: TextStyle(
                                                                color: grey,
                                                                fontSize:
                                                                    12.px),
                                                          ),
                                                          // Spacer(),

                                                          sizedBoxWidth20,
                                                          Text(
                                                            'Size : ${controller.cartProducts!.data!.products![index].size}',
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12.px),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    sizedBoxHeight10,
                                                    Row(
                                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          '${controller.cartProducts!.data!.products![index].totalAmount}',
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              color: Colors
                                                                  .black26,
                                                              fontSize: 15.px,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),

                                                        sizedBoxWidth10,
                                                        Text(
                                                          '₹ ${controller.cartProducts!.data!.products![index].price}',
                                                          style: TextStyle(
                                                              color: black,
                                                              fontSize: 15.px,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        sizedBoxWidth60,
                                                        // Spacer(),
                                                        Text(
                                                          '74% off',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      15.px,
                                                                  color: Colors
                                                                      .green),
                                                        ),
                                                        // Spacer(),
                                                        // Text(
                                                        //   'MOQ: 4 Pcs',
                                                        //   style: GoogleFonts.poppins(
                                                        //       fontWeight: FontWeight.w400, fontSize: 13.px),
                                                        // )
                                                      ],
                                                    ),
                                                    sizedBoxHeight10,
                                                    Text(
                                                      '2 offers applied 2 offers available ',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 12.px,
                                                              color:
                                                                  Colors.green),
                                                    ),
                                                    sizedBoxHeight10,
                                                    RichText(
                                                        text: TextSpan(
                                                            children: [
                                                          TextSpan(
                                                              text:
                                                                  'Free Delivery',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize:
                                                                      12.px,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .green)),
                                                          TextSpan(
                                                              text:
                                                                  'by Thu Mar 28 | ',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize:
                                                                      13.px,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: grey)),
                                                          TextSpan(
                                                              text: ' ₹ 40',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize:
                                                                      13.px,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: grey)),
                                                        ])),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Flex(
                                              direction: Axis.horizontal,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      await controller
                                                          .deleteProduct(
                                                              controller
                                                                  .cartProducts!
                                                                  .data!
                                                                  .products![
                                                                      index]
                                                                  .product!
                                                                  .id!);
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                            'assets/images/cartremove.png'),
                                                        sizedBoxWidth10,
                                                        Text(
                                                          'Remove',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      12.px,
                                                                  color: grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                          'assets/images/cartsave.png'),
                                                      sizedBoxWidth10,
                                                      Text(
                                                        'Save for later',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 12.px,
                                                                color: grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                          'assets/images/cartbuy.png'),
                                                      sizedBoxWidth10,
                                                      Text(
                                                        'Buy this now',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 12.px,
                                                                color: grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: controller
                                        .cartProducts!.data!.products!.length,
                                  ),
                      );
                    },
                  ),
                  sizedBoxHeight30
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          Consumer<CartController>(builder: (context, controller, _) {
        return Container(
          height: Adaptive.h(8),
          width: Adaptive.w(100),
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Adaptive.sp(22)),
                  topLeft: Radius.circular(Adaptive.sp(22))),
              border: Border.all(color: black)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '₹11,097',
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.black26,
                    fontSize: 12.px,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '₹${controller.cartProducts!.data!.totalPaidAmount}',
                style: TextStyle(
                    // decoration: TextDecoration.lineThrough,
                    color: Colors.black,
                    fontSize: 18.px,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                height: Adaptive.h(5.5),
                width: Adaptive.w(45),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  border: Border.all(
                    color: buttonColor,
                  ),
                  color: buttonColor,
                ),
                child: Center(
                  child: Text(
                    'Place Order',
                    style: GoogleFonts.poppins(
                        fontSize: 15.px,
                        color: whiteColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ).onTap(() {
                Get.to(() => const PaymentScreen());
              })
            ],
          ),
        );
      }),
    );
  }
}
