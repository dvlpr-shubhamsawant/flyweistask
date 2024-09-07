import 'dart:convert';

import 'package:ecommerce_seller/controllers/user_controller.dart';
import 'package:ecommerce_seller/main.dart';
import 'package:ecommerce_seller/models/address.dart';
import 'package:http/http.dart' as http;

class AddressApis {
  addAddress({name, phone, add1, add2, city, state, pincode, country}) async {
    Uri url =
        Uri.parse("https://sanjay-tiwari-backend.vercel.app/api/user/address");
    var headers = {
      "Authorization": "Bearer ${AppUser().token}",
      "Content-Type": "application/json"
    };
    var body = {
      "fullName": name,
      "phone": phone,
      "addressLine1": add1,
      "addressLine2": add2,
      "city": city,
      "state": state,
      "postalCode": pincode,
      "country": country
    };

    try {
      http.Response response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      var data = jsonDecode(response.body);
      logger.d(data);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<List<Address>> getAddresses() async {
    Uri url =
        Uri.parse("https://sanjay-tiwari-backend.vercel.app/api/user/address");
    var headers = {"Authorization": "Bearer ${AppUser().token}"};

    try {
      http.Response response = await http.get(url, headers: headers);
      var data = jsonDecode(response.body);
      logger.d(data);
      if (response.statusCode == 200) {
        List addresses = data['data'];
        if (addresses.isNotEmpty) {
          return addresses.map((e) => Address.fromJson(e)).toList();
        }
      }
    } catch (e) {
      logger.e(e);
    }
    return [];
  }

  deleteAddress(Address address) async {
    Uri url = Uri.parse(
        "https://sanjay-tiwari-backend.vercel.app/api/user/address/${address.id}");
    var headers = {"Authorization": "Bearer ${AppUser().token}"};

    try {
      http.Response response = await http.delete(url, headers: headers);
      var data = jsonDecode(response.body);
      logger.d(data);
    } catch (e) {
      logger.e(e);
    }
  }

  updateAddress(
      {id, name, phone, add1, add2, city, state, pincode, country}) async {
    Uri url = Uri.parse(
        "https://sanjay-tiwari-backend.vercel.app/api/user/address/$id");
    var headers = {
      "Authorization": "Bearer ${AppUser().token}",
      "Content-Type": "application/json"
    };
    var body = {
      "fullName": name,
      "phone": phone,
      "addressLine1": add1,
      "addressLine2": add2,
      "city": city,
      "state": state,
      "postalCode": pincode,
      "country": country
    };

    try {
      http.Response response =
          await http.put(url, headers: headers, body: jsonEncode(body));
      var data = response.body;
      logger.d(data);
    } catch (e) {
      logger.e(e);
    }
  }
}
