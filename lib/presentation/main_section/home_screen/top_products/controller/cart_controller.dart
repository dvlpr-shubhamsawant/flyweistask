import 'dart:developer';

import 'package:ecommerce_seller/models/cart_products_data_model.dart';
import 'package:ecommerce_seller/models/coupons_data_model.dart';
import 'package:ecommerce_seller/models/quantity_update_data_model.dart';
import 'package:ecommerce_seller/requests/cart_requests.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  CartController.internal();
  static CartController _instance = CartController.internal();
  factory CartController() => _instance;
  bool isCartProductLoading = false;
  bool isUpdateQuantity = false;
  CartProductsDataModel? cartProducts;
  CouponsDataModel? coupons;
  QuantityUpdateDataModel? quantityUpdate;
  bool iscouponApply = false;
  set updatecoupon(bool value) {
    iscouponApply = value;
    notifyListeners();
  }

  set updateCartProductLoading(bool value) {
    isCartProductLoading = value;
    notifyListeners();
  }

  CartRequests cartRequests = CartRequests();

  Future<void> fetchAllCartProducts() async {
    updateCartProductLoading = true;
    var data = await cartRequests.getCartProducts();
    if (data?.status == 404) {
      log("No data");
    } else {
      cartProducts = data;
    }
    updateCartProductLoading = false;
  }

  Future<void> updateQuantity(String id, int quantity) async {
    // updateCartProductLoading = true;

    quantityUpdate = await cartRequests.updateCartProductQuantity(
      {"productId": id, "quantity": quantity},
    );
    var data = await cartRequests.getCartProducts();
    if (data?.status == 404) {
      log("No data");
    } else {
      cartProducts = data;
    }
    notifyListeners();

    // updateCartProductLoading = false;
  }

  Future<void> updateProduct(String id, var quantity, String size) async {
    updateCartProductLoading = true;
    log(id);
    var data = await cartRequests.updateCartProductQuantity(
      {
        "productId": "668bb881d618f27777cdfbc0",
        "size": size,
        "quantity": quantity
      },
    );

    await fetchAllCartProducts();
    updateCartProductLoading = false;
  }

  Future<void> deleteProduct(String id) async {
    updateCartProductLoading = true;
    await cartRequests.deleteCartProductById(id);

    await fetchAllCartProducts();
    updateCartProductLoading = false;
  }

  Future<void> deleteCartAllProducts() async {
    updateCartProductLoading = true;
    await cartRequests.deleteCartProducts();

    await fetchAllCartProducts();
    updateCartProductLoading = false;
  }

  Future<void> getAllCoupons() async {
    updateCartProductLoading = true;
    coupons = await cartRequests.getAllCoupons();
    updateCartProductLoading = false;
  }

  applyCoupon(String coupon) async {
    await cartRequests.applyCoupon(
      {"couponCode": coupon},
    );
    var data = await cartRequests.getCartProducts();
    if (data?.status == 404) {
      log("No data");
    } else {
      cartProducts = data;
    }
    notifyListeners();
  }

  removeCoupon() async {
    await cartRequests.removeCoupon();
    var data = await cartRequests.getCartProducts();
    if (data?.status == 404) {
      log("No data");
    } else {
      cartProducts = data;
    }
    notifyListeners();
  }
}
