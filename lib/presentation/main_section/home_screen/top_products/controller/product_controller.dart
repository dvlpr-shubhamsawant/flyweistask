import 'package:ecommerce_seller/models/products_data_model.dart';
import 'package:ecommerce_seller/requests/product_requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends ChangeNotifier {
  ProductController.internal();
  static ProductController _instance = ProductController.internal();
  factory ProductController() => _instance;
  ProductRequests productRequests = ProductRequests();
  ProductsDataModel? products;

  bool isLoading = false;
  set loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> fetchAllProducts() async {
    loading = true;
    products = await productRequests.getAllProducts();
    loading = false;
  }
}
