import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_seller/consts/endpoints.dart';
import 'package:ecommerce_seller/main.dart';

import 'package:ecommerce_seller/models/cart_products_data_model.dart';
import 'package:ecommerce_seller/models/coupons_data_model.dart';
import 'package:ecommerce_seller/models/quantity_update_data_model.dart';
import 'package:http/http.dart' as http;

class CartRequests {
  final String _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NmE4N2ZhNmZlNDcwMmQ5Yjc2MDhjNjYiLCJpYXQiOjE3MjUxMTA4NTAsImV4cCI6MTc1NjY0Njg1MH0.Y37QMEg_PZ9TqFr66h-8F5T7koxt3iNnl_u_B3RE9y0";

// add products into the cart
  Future<void> addToCart(Map<String, dynamic> productData) async {
    try {
      Uri url = Uri.parse(Endpoints.baseUrl + Endpoints.addToCart);
      final body = jsonEncode(productData);
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
        body: body,
      );
      if (response.statusCode == 201) {
        log(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }

// update product in cart
  Future<void> updateCartProduct(Map<String, dynamic> productData) async {
    try {
      Uri url = Uri.parse(Endpoints.baseUrl + Endpoints.updateCartItem);
      final body = jsonEncode(productData);

      http.Response response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        log(response.body);
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

// update product quantity in cart
  Future updateCartProductQuantity(Map<String, dynamic> quantityData) async {
    try {
      Uri url = Uri.parse(Endpoints.baseUrl + Endpoints.updateCartItemQuantity);
      final body = jsonEncode(quantityData);
      log(body);

      http.Response response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
        body: body,
      );
      log(response.body);
      if (response.statusCode == 200) {
        QuantityUpdateDataModel.fromJson(jsonDecode(response.body));
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // get all cart products
  Future<CartProductsDataModel?> getCartProducts() async {
    try {
      Uri url = Uri.parse(Endpoints.baseUrl + Endpoints.getCart);
      http.Response response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );
      if (response.statusCode == 200) {
        return CartProductsDataModel.fromJson(jsonDecode(response.body));
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  // delete all cart products
  Future<dynamic> deleteCartProducts() async {
    try {
      Uri url = Uri.parse(Endpoints.baseUrl + Endpoints.deleteAllCart);
      http.Response response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );
      if (response.statusCode == 200) {
        // return "Cart Clear Success";
        log("cart clear success");
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // delete cart product by id
  Future<dynamic> deleteCartProductById(String id) async {
    try {
      Uri url =
          Uri.parse(Endpoints.baseUrl + "${Endpoints.deleteItemCart}/$id");

      http.Response response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );
      if (response.statusCode == 200) {
        // return "Cart Clear Success";
        log("cart product delete success");
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // get all coupons
  Future<CouponsDataModel?> getAllCoupons() async {
    try {
      Uri url = Uri.parse(Endpoints.baseUrl + Endpoints.getAllCoupons);
      http.Response response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );
      if (response.statusCode == 200) {
        log(response.body);
        return CouponsDataModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  // apply coupons
  Future<dynamic> applyCoupon(Map<String, dynamic> couponData) async {
    try {
      Uri url = Uri.parse(Endpoints.baseUrl + Endpoints.applyCouponInCart);
      final body = jsonEncode(couponData);
      http.Response response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
        body: body,
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(response.body);
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // remove coupons
  Future<dynamic> removeCoupon() async {
    try {
      Uri url = Uri.parse(Endpoints.baseUrl + Endpoints.deleteCouponInCart);
      http.Response response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );
      if (response.statusCode == 200) {
        log(response.body);
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
