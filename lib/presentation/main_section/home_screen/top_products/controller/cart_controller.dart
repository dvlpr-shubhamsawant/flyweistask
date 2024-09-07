import 'dart:developer';

import 'package:ecommerce_seller/models/cart_products_data_model.dart';
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
  QuantityUpdateDataModel? quantityUpdate;

  set updateCartProductLoading(bool value) {
    isCartProductLoading = value;
    notifyListeners();
  }

  CartRequests cartRequests = CartRequests();

  Future<void> fetchAllCartProducts() async {
    updateCartProductLoading = true;
    cartProducts = await cartRequests.getCartProducts();
    updateCartProductLoading = false;
  }

  // Future<void> updateQuantity(String id, int quantity) async {
  //   updateCartProductLoading = true;

  //   quantityUpdate = await cartRequests.updateCartProductQuantity(
  //     {"productId": id, "quantity": quantity},
  //   );
  //   isUpdateQuantity = true;
  //   updateCartProductLoading = false;
  // }

  Future<void> updateProduct(String id, int quantity, String size) async {
    updateCartProductLoading = true;
    quantityUpdate = await cartRequests.updateCartProductQuantity(
      {"productId": id, "size": size, "quantity": quantity},
    );
    fetchAllCartProducts();
    updateCartProductLoading = false;
  }
}
