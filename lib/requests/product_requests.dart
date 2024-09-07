import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_seller/consts/endpoints.dart';
import 'package:ecommerce_seller/main.dart';
import 'package:ecommerce_seller/models/products_data_model.dart';
import 'package:http/http.dart' as http;

class ProductRequests {
  final String _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NmE4N2ZhNmZlNDcwMmQ5Yjc2MDhjNjYiLCJpYXQiOjE3MjUxMTA4NTAsImV4cCI6MTc1NjY0Njg1MH0.Y37QMEg_PZ9TqFr66h-8F5T7koxt3iNnl_u_B3RE9y0";

  Future<ProductsDataModel?> getAllProducts() async {
    try {
      Uri url = Uri.parse(Endpoints.baseUrl + Endpoints.getAllProducts);
      http.Response response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );
      if (response.statusCode == 200) {
        return ProductsDataModel.fromJson(jsonDecode(response.body));
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
